% Answer 1
sensor_record(sensor_0042, 42).

% Reason 1
proof_step(1, 1, reading("0042"), source(1)).
proof_step(1, 2, decimal_digits([], 42, 42), rule(3, [])).
proof_step(1, 3, '>='(50, 48), builtin).
proof_step(1, 4, '=<'(50, 57), builtin).
proof_step(1, 5, is(42, '-'('+'('*'(4, 10), 50), 48)), builtin).
proof_step(1, 6, '>='(52, 48), builtin).
proof_step(1, 7, '=<'(52, 57), builtin).
proof_step(1, 8, is(4, '-'('+'('*'(0, 10), 52), 48)), builtin).
proof_step(1, 9, '>='(48, 48), builtin).
proof_step(1, 10, '=<'(48, 57), builtin).
proof_step(1, 11, is(0, '-'('+'('*'(0, 10), 48), 48)), builtin).
proof_step(1, 12, string_codes("0042", [48, 48, 52, 50]), builtin).
proof_step(1, 13, append([], [48, 48, 52, 50], [48, 48, 52, 50]), rule(1, [])).
proof_step(1, 14, atom_codes(sensor_, [115, 101, 110, 115, 111, 114, 95]), builtin).
proof_step(
    1,
    15,
    atom_codes(sensor_0042, [115, 101, 110, 115, 111, 114, 95, 48, 48, 52, 50]),
    builtin
).
proof_step(1, 16, decimal_digits([50], 4, 42), rule(4, [3, 4, 5, 2])).
proof_step(1, 17, append([95], [48, 48, 52, 50], [95, 48, 48, 52, 50]), rule(2, [13])).
proof_step(1, 18, decimal_digits([52, 50], 0, 42), rule(4, [6, 7, 8, 16])).
proof_step(
    1,
    19,
    append([114, 95], [48, 48, 52, 50], [114, 95, 48, 48, 52, 50]),
    rule(2, [17])
).
proof_step(1, 20, decimal_digits([48, 52, 50], 0, 42), rule(4, [9, 10, 11, 18])).
proof_step(
    1,
    21,
    append([111, 114, 95], [48, 48, 52, 50], [111, 114, 95, 48, 48, 52, 50]),
    rule(2, [19])
).
proof_step(1, 22, decimal_digits([48, 48, 52, 50], 0, 42), rule(4, [9, 10, 11, 20])).
proof_step(
    1,
    23,
    append([115, 111, 114, 95], [48, 48, 52, 50], [115, 111, 114, 95, 48, 48, 52, 50]),
    rule(2, [21])
).
proof_step(1, 24, unsigned_decimal("0042", 42), rule(5, [12, 22])).
proof_step(
    1,
    25,
    append(
        [110, 115, 111, 114, 95],
        [48, 48, 52, 50],
        [110, 115, 111, 114, 95, 48, 48, 52, 50]
    ),
    rule(2, [23])
).
proof_step(
    1,
    26,
    append(
        [101, 110, 115, 111, 114, 95],
        [48, 48, 52, 50],
        [101, 110, 115, 111, 114, 95, 48, 48, 52, 50]
    ),
    rule(2, [25])
).
proof_step(
    1,
    27,
    append(
        [115, 101, 110, 115, 111, 114, 95],
        [48, 48, 52, 50],
        [115, 101, 110, 115, 111, 114, 95, 48, 48, 52, 50]
    ),
    rule(2, [26])
).
proof_step(1, 28, sensor_record(sensor_0042, 42), rule(6, [1, 24, 14, 12, 27, 15])).
proof_claim(1, answer(1, [28])).

% Answer 2
label_text(sensor, "café 😀").

% Answer 3
answer(3, [
    binding("Codes", [99, 97, 102, 233, 32, 128512])
]).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).

% Goal check 12
check_result(12, true).

% Goal check 13
check_result(13, true).
