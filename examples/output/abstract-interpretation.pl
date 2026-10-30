% Answer 1
abs_state(countdown, input, neg).
abs_state(countdown, input, zero).
abs_state(countdown, input, pos).
abs_state(guarded, input, neg).
abs_state(guarded, input, zero).
abs_state(guarded, input, pos).
abs_state(countdown, negative_branch, pos).
abs_state(countdown, nonnegative_branch, zero).
abs_state(countdown, nonnegative_branch, pos).
abs_state(countdown, loop_head, pos).
abs_state(countdown, loop_head, zero).
abs_state(countdown, loop_body, zero).
abs_state(countdown, loop_body, pos).
abs_state(countdown, divide, zero).
abs_state(guarded, negative_branch, pos).
abs_state(guarded, nonnegative_branch, zero).
abs_state(guarded, nonnegative_branch, pos).
abs_state(guarded, check, pos).
abs_state(guarded, check, zero).
abs_state(guarded, divide, pos).
abs_state(guarded, zero_result, zero).

% Answer 2
abs_warning(countdown, possible_division_by_zero(divide)).

% Reason 2
proof_step(2, 1, entry(countdown, input), source(3)).
proof_step(2, 2, input_sign(zero), source(6)).
proof_step(
    2,
    3,
    transition(countdown, input, nonnegative_branch, nonnegative, identity),
    source(9)
).
proof_step(
    2,
    4,
    transition(countdown, nonnegative_branch, loop_head, any, identity),
    source(11)
).
proof_step(
    2,
    5,
    transition(countdown, loop_head, divide, nonpositive, identity),
    source(14)
).
proof_step(2, 6, division(countdown, divide), source(21)).
proof_step(2, 7, accepts(any, zero), source(24)).
proof_step(2, 8, accepts(nonnegative, zero), source(27)).
proof_step(2, 9, accepts(nonpositive, zero), source(31)).
proof_step(2, 10, transfer(identity, zero, zero), source(33)).
proof_step(2, 11, abs_state(countdown, input, zero), rule(1, [1, 2])).
proof_step(
    2,
    12,
    abs_state(countdown, nonnegative_branch, zero),
    rule(2, [11, 3, 8, 10])
).
proof_step(2, 13, abs_state(countdown, loop_head, zero), rule(2, [12, 4, 7, 10])).
proof_step(2, 14, abs_state(countdown, divide, zero), rule(2, [13, 5, 9, 10])).
proof_step(2, 15, zero_possible(countdown, divide), rule(3, [14])).
proof_step(
    2,
    16,
    abs_warning(countdown, possible_division_by_zero(divide)),
    rule(5, [6, 15])
).
proof_claim(2, answer(2, [16])).

% Answer 3
nonzero_divisor(guarded, divide).

% Reason 3
proof_step(3, 1, program(countdown), source(1)).
proof_step(3, 2, program(guarded), source(2)).
proof_step(3, 3, entry(countdown, input), source(3)).
proof_step(3, 4, entry(guarded, input), source(4)).
proof_step(3, 5, input_sign(neg), source(5)).
proof_step(3, 6, input_sign(zero), source(6)).
proof_step(3, 7, input_sign(pos), source(7)).
proof_step(
    3,
    8,
    transition(countdown, input, negative_branch, negative, negate),
    source(8)
).
proof_step(
    3,
    9,
    transition(countdown, input, nonnegative_branch, nonnegative, identity),
    source(9)
).
proof_step(
    3,
    10,
    transition(countdown, negative_branch, loop_head, any, identity),
    source(10)
).
proof_step(
    3,
    11,
    transition(countdown, nonnegative_branch, loop_head, any, identity),
    source(11)
).
proof_step(
    3,
    12,
    transition(countdown, loop_head, loop_body, positive, decrement),
    source(12)
).
proof_step(
    3,
    13,
    transition(countdown, loop_body, loop_head, any, identity),
    source(13)
).
proof_step(
    3,
    14,
    transition(countdown, loop_head, divide, nonpositive, identity),
    source(14)
).
proof_step(
    3,
    15,
    transition(guarded, input, negative_branch, negative, negate),
    source(15)
).
proof_step(
    3,
    16,
    transition(guarded, input, nonnegative_branch, nonnegative, identity),
    source(16)
).
proof_step(
    3,
    17,
    transition(guarded, negative_branch, check, any, identity),
    source(17)
).
proof_step(
    3,
    18,
    transition(guarded, nonnegative_branch, check, any, identity),
    source(18)
).
proof_step(3, 19, transition(guarded, check, divide, positive, identity), source(19)).
proof_step(
    3,
    20,
    transition(guarded, check, zero_result, nonpositive, identity),
    source(20)
).
proof_step(3, 21, division(countdown, divide), source(21)).
proof_step(3, 22, division(guarded, divide), source(22)).
proof_step(3, 23, accepts(any, neg), source(23)).
proof_step(3, 24, accepts(any, zero), source(24)).
proof_step(3, 25, accepts(any, pos), source(25)).
proof_step(3, 26, accepts(negative, neg), source(26)).
proof_step(3, 27, accepts(nonnegative, zero), source(27)).
proof_step(3, 28, accepts(nonnegative, pos), source(28)).
proof_step(3, 29, accepts(positive, pos), source(29)).
proof_step(3, 30, accepts(nonpositive, neg), source(30)).
proof_step(3, 31, accepts(nonpositive, zero), source(31)).
proof_step(3, 32, transfer(identity, neg, neg), source(32)).
proof_step(3, 33, transfer(identity, zero, zero), source(33)).
proof_step(3, 34, transfer(identity, pos, pos), source(34)).
proof_step(3, 35, transfer(negate, neg, pos), source(35)).
proof_step(3, 36, transfer(negate, zero, zero), source(36)).
proof_step(3, 37, transfer(negate, pos, neg), source(37)).
proof_step(3, 38, transfer(decrement, neg, neg), source(38)).
proof_step(3, 39, transfer(decrement, zero, neg), source(39)).
proof_step(3, 40, transfer(decrement, pos, zero), source(40)).
proof_step(3, 41, transfer(decrement, pos, pos), source(41)).
proof_step(3, 42, abs_state(countdown, input, neg), rule(1, [3, 5])).
proof_step(3, 43, abs_state(countdown, input, zero), rule(1, [3, 6])).
proof_step(3, 44, abs_state(countdown, input, pos), rule(1, [3, 7])).
proof_step(3, 45, abs_state(guarded, input, neg), rule(1, [4, 5])).
proof_step(3, 46, abs_state(guarded, input, zero), rule(1, [4, 6])).
proof_step(3, 47, abs_state(guarded, input, pos), rule(1, [4, 7])).
proof_step(3, 48, abs_state(countdown, negative_branch, pos), rule(2, [42, 8, 26, 35])).
proof_step(
    3,
    49,
    abs_state(countdown, nonnegative_branch, zero),
    rule(2, [43, 9, 27, 33])
).
proof_step(
    3,
    50,
    abs_state(countdown, nonnegative_branch, pos),
    rule(2, [44, 9, 28, 34])
).
proof_step(3, 51, abs_state(countdown, loop_head, pos), rule(2, [48, 10, 25, 34])).
proof_step(3, 52, abs_state(countdown, loop_head, zero), rule(2, [49, 11, 24, 33])).
proof_step(3, 53, abs_state(countdown, loop_body, zero), rule(2, [51, 12, 29, 40])).
proof_step(3, 54, abs_state(countdown, loop_body, pos), rule(2, [51, 12, 29, 41])).
proof_step(3, 55, abs_state(countdown, divide, zero), rule(2, [52, 14, 31, 33])).
proof_step(3, 56, abs_state(guarded, negative_branch, pos), rule(2, [45, 15, 26, 35])).
proof_step(
    3,
    57,
    abs_state(guarded, nonnegative_branch, zero),
    rule(2, [46, 16, 27, 33])
).
proof_step(
    3,
    58,
    abs_state(guarded, nonnegative_branch, pos),
    rule(2, [47, 16, 28, 34])
).
proof_step(3, 59, abs_state(guarded, check, pos), rule(2, [56, 17, 25, 34])).
proof_step(3, 60, abs_state(guarded, check, zero), rule(2, [57, 18, 24, 33])).
proof_step(3, 61, abs_state(guarded, divide, pos), rule(2, [59, 19, 29, 34])).
proof_step(3, 62, abs_state(guarded, zero_result, zero), rule(2, [60, 20, 31, 33])).
proof_step(3, 63, reachable_division(countdown, divide), rule(4, [21, 55])).
proof_step(3, 64, reachable_division(guarded, divide), rule(4, [22, 61])).
proof_step(3, 65, zero_possible(countdown, input), rule(3, [43])).
proof_step(3, 66, zero_possible(guarded, input), rule(3, [46])).
proof_step(3, 67, zero_possible(countdown, nonnegative_branch), rule(3, [49])).
proof_step(3, 68, zero_possible(countdown, loop_head), rule(3, [52])).
proof_step(3, 69, zero_possible(countdown, loop_body), rule(3, [53])).
proof_step(3, 70, zero_possible(countdown, divide), rule(3, [55])).
proof_step(3, 71, zero_possible(guarded, nonnegative_branch), rule(3, [57])).
proof_step(3, 72, zero_possible(guarded, check), rule(3, [60])).
proof_step(3, 73, zero_possible(guarded, zero_result), rule(3, [62])).
proof_step(
    3,
    74,
    abs_warning(countdown, possible_division_by_zero(divide)),
    rule(5, [21, 70])
).
proof_step(3, 75, zero_possible(guarded, divide), absent(1)).
proof_step(3, 76, nonzero_divisor(guarded, divide), rule(6, [64, 75])).
proof_boundary(3, 1, 0).
proof_boundary_steps(3, 1, 1, 74).
proof_claim(3, answer(3, [76])).

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
