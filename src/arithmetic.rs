use crate::{Error, Value};
use num_bigint::BigInt;
use num_integer::Integer;
use num_traits::{FromPrimitive, Signed, ToPrimitive, Zero};
use std::cmp::Ordering;
pub(crate) fn integer(n: BigInt) -> Value {
    n.to_i64()
        .map(Value::Integer)
        .unwrap_or(Value::BigInteger(n))
}
pub(crate) fn real(n: f64) -> Result<Value, Error> {
    if n.is_finite() {
        Ok(Value::Real(if n == 0.0 {
            0.0f64.to_bits()
        } else {
            n.to_bits()
        }))
    } else {
        Err(Error::new("Arithmetic produced a non-finite real."))
    }
}
fn int(v: &Value) -> Result<BigInt, Error> {
    match v {
        Value::Integer(n) => Ok((*n).into()),
        Value::BigInteger(n) => Ok(n.clone()),
        _ => Err(Error::new("This arithmetic operation requires integers.")),
    }
}
fn float(v: &Value) -> Result<f64, Error> {
    let n = match v {
        Value::Real(b) => f64::from_bits(*b),
        _ => int(v)?
            .to_f64()
            .ok_or_else(|| Error::new("Integer is too large for binary64 arithmetic."))?,
    };
    if n.is_finite() {
        Ok(n)
    } else {
        Err(Error::new("Integer is too large for binary64 arithmetic."))
    }
}
fn mixed(v: &Value) -> bool {
    matches!(v, Value::Real(_))
}
fn real_input(v: &Value) -> Result<f64, Error> {
    if let Value::Real(bits) = v {
        Ok(f64::from_bits(*bits))
    } else {
        Err(Error::new("This arithmetic operation requires a real."))
    }
}

fn power(name: &str, a: &Value, b: &Value) -> Result<Value, Error> {
    if name == "^" && !mixed(a) && !mixed(b) {
        let (base, exponent) = (int(a)?, int(b)?);
        if exponent.is_negative() {
            if base.is_zero() {
                return Err(Error::new("Zero cannot be raised to a negative power."));
            }
            if base.abs() == BigInt::from(1) {
                return Ok(Value::Integer(if base.is_negative() && exponent.is_odd() {
                    -1
                } else {
                    1
                }));
            }
            return Err(Error::new(
                "Integer power with a negative exponent requires a real base.",
            ));
        }
        let exponent = exponent
            .to_u32()
            .filter(|n| *n <= 1_000_000)
            .ok_or_else(|| Error::new("Integer exponent exceeds the resource limit."))?;
        return Ok(integer(base.pow(exponent)));
    }
    let (base, exponent) = (float(a)?, float(b)?);
    if base == 0.0 && exponent < 0.0 {
        return Err(Error::new("Zero cannot be raised to a negative power."));
    }
    let negative = if base < 0.0 {
        if mixed(b) {
            if name == "**" || exponent.fract() != 0.0 {
                return Err(Error::new(
                    "A negative power base requires an integer exponent.",
                ));
            }
            exponent % 2.0 != 0.0
        } else {
            int(b)?.is_odd()
        }
    } else {
        false
    };
    let result = base.abs().powf(exponent);
    if result == 0.0 && base != 0.0 {
        return Err(Error::new("Power underflow."));
    }
    real(if negative { -result } else { result })
}

pub(crate) fn compare(a: &Value, b: &Value) -> Result<Ordering, Error> {
    if !mixed(a) && !mixed(b) {
        return Ok(int(a)?.cmp(&int(b)?));
    }
    if mixed(a) && mixed(b) {
        return Ok(float(a)?.partial_cmp(&float(b)?).unwrap());
    }
    if mixed(a) {
        return Ok(compare(b, a)?.reverse());
    }
    let left = int(a)?;
    let right = float(b)?;
    let whole =
        BigInt::from_f64(right.trunc()).ok_or_else(|| Error::new("Invalid real comparison."))?;
    Ok(match left.cmp(&whole) {
        Ordering::Equal => {
            if right.fract() > 0.0 {
                Ordering::Less
            } else if right.fract() < 0.0 {
                Ordering::Greater
            } else {
                Ordering::Equal
            }
        }
        ordering => ordering,
    })
}
pub(crate) fn eval(v: &Value) -> Result<Value, Error> {
    let (name, args) = match v {
        Value::Integer(_) | Value::BigInteger(_) | Value::Real(_) => return Ok(v.clone()),
        Value::Symbol(s) if s == "pi" => return real(std::f64::consts::PI),
        Value::Symbol(s) if s == "e" => return real(std::f64::consts::E),
        Value::Compound(n, a) => (n.as_str(), a),
        Value::Variable(n) => {
            return Err(Error::new(format!(
                "Arithmetic input {n} must be bound by an earlier goal or call."
            )))
        }
        _ => {
            return Err(Error::new(
                "Arithmetic requires a number or supported arithmetic expression.",
            ))
        }
    };
    let values = args.iter().map(eval).collect::<Result<Vec<_>, _>>()?;
    let failure = || {
        Error::new(format!(
            "Unsupported arithmetic function {name}/{}.",
            args.len()
        ))
    };
    match values.as_slice() {
        [a] => match name {
            "+" => Ok(a.clone()),
            "-" => {
                if mixed(a) {
                    real(-float(a)?)
                } else {
                    Ok(integer(-int(a)?))
                }
            }
            "\\" => Ok(integer(!int(a)?)),
            "abs" => {
                if mixed(a) {
                    real(float(a)?.abs())
                } else {
                    Ok(integer(int(a)?.abs()))
                }
            }
            "sign" => {
                let sign = match compare(a, &Value::Integer(0))? {
                    Ordering::Less => -1,
                    Ordering::Equal => 0,
                    Ordering::Greater => 1,
                };
                if mixed(a) {
                    real(f64::from(sign))
                } else {
                    Ok(Value::Integer(i64::from(sign)))
                }
            }
            "floor" | "ceiling" | "truncate" | "round" => {
                let n = real_input(a)?;
                let n = match name {
                    "floor" => n.floor(),
                    "ceiling" => n.ceil(),
                    "truncate" => n.trunc(),
                    // ISO rounds halfway toward +infinity. Avoid adding 0.5
                    // to n itself, which can round twice near integer limits.
                    _ => {
                        let lower = n.floor();
                        if n - lower >= 0.5 {
                            lower + 1.0
                        } else {
                            lower
                        }
                    }
                };
                Ok(integer(
                    BigInt::from_f64(n).ok_or_else(|| Error::new("Invalid rounded real."))?,
                ))
            }
            "float" => real(float(a)?),
            "float_integer_part" => real(real_input(a)?.trunc()),
            "float_fractional_part" => real(real_input(a)?.fract()),
            "sqrt" => real(float(a)?.sqrt()),
            "log" => real(float(a)?.ln()),
            "exp" => real(float(a)?.exp()),
            "sin" => real(float(a)?.sin()),
            "cos" => real(float(a)?.cos()),
            "tan" => real(float(a)?.tan()),
            "asin" => real(float(a)?.asin()),
            "acos" => real(float(a)?.acos()),
            "atan" => real(float(a)?.atan()),
            _ => Err(failure()),
        },
        [a, b] => match name {
            "+" | "-" | "*" => {
                if mixed(a) || mixed(b) {
                    let (a, b) = (float(a)?, float(b)?);
                    real(match name {
                        "+" => a + b,
                        "-" => a - b,
                        _ => a * b,
                    })
                } else {
                    let (a, b) = (int(a)?, int(b)?);
                    Ok(integer(match name {
                        "+" => a + b,
                        "-" => a - b,
                        _ => a * b,
                    }))
                }
            }
            "/" => {
                let b = float(b)?;
                if b == 0.0 {
                    return Err(Error::new("Division by zero."));
                }
                real(float(a)? / b)
            }
            "//" | "div" | "rem" | "mod" => {
                let (a, b) = (int(a)?, int(b)?);
                if b.is_zero() {
                    return Err(Error::new("Division or remainder by zero."));
                }
                Ok(integer(match name {
                    "//" => a / b,
                    "div" => a.div_floor(&b),
                    "rem" => a % b,
                    _ => a.mod_floor(&b),
                }))
            }
            "^" | "**" => power(name, a, b),
            "min" | "max" => {
                let cmp = compare(a, b)?;
                Ok(
                    if (name == "min" && cmp != Ordering::Greater)
                        || (name == "max" && cmp != Ordering::Less)
                    {
                        a.clone()
                    } else {
                        b.clone()
                    },
                )
            }
            "gcd" => Ok(integer(int(a)?.gcd(&int(b)?))),
            "xor" => Ok(integer(int(a)? ^ int(b)?)),
            "\\/" => Ok(integer(int(a)? | int(b)?)),
            "/\\" => Ok(integer(int(a)? & int(b)?)),
            "<<" | ">>" => {
                let shift = int(b)?
                    .to_usize()
                    .filter(|s| *s <= 1_000_000)
                    .ok_or_else(|| {
                        Error::new("Shift count must be nonnegative and within the resource limit.")
                    })?;
                Ok(integer(if name == "<<" {
                    int(a)? << shift
                } else {
                    int(a)? >> shift
                }))
            }
            "atan2" => {
                let (y, x) = (float(a)?, float(b)?);
                if y == 0.0 && x == 0.0 {
                    return Err(Error::new(
                        "atan2 is undefined when both arguments are zero.",
                    ));
                }
                real(y.atan2(x))
            }
            _ => Err(failure()),
        },
        _ => Err(failure()),
    }
}
