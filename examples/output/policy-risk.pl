% Answer 1
report(4, c4, 70, moderate, export_prohibited, permit_export).
report(3, c2, 85, high, short_notice(3, 14), increase_notice(14)).
report(2, c3, 97, high, sharing_without_consent, require_consent).
report(1, c1, 100, high, no_removal_safeguards, add_notice_and_inform).

% Reason 1
proof_step(1, 1, permission(c1, remove_account), source(1)).
proof_step(1, 2, permission(c2, change_terms), source(2)).
proof_step(1, 3, permission(c3, share_data), source(3)).
proof_step(1, 4, prohibition(c4, export_data), source(4)).
proof_step(1, 5, notice_days(c2, 3), source(5)).
proof_step(1, 6, permission(c5, share_data), source(6)).
proof_step(1, 7, safeguard(c5, consent), source(7)).
proof_step(1, 8, permission(c6, change_terms), source(8)).
proof_step(1, 9, notice_days(c6, 14), source(9)).
proof_step(1, 10, importance(retention, 20), source(10)).
proof_step(1, 11, importance(prior_notice, 15), source(11)).
proof_step(1, 12, importance(consent, 12), source(12)).
proof_step(1, 13, importance(portability, 10), source(13)).
proof_step(1, 14, required_notice(14), source(14)).
proof_step(1, 15, '>='(3, 0), builtin).
proof_step(1, 16, '>='(14, 0), builtin).
proof_step(1, 17, is(70, '+'(60, 10)), builtin).
proof_step(1, 18, '<'(3, 14), builtin).
proof_step(1, 19, is(85, '+'(70, 15)), builtin).
proof_step(1, 20, '=<'(70, 100), builtin).
proof_step(1, 21, '=<'(85, 100), builtin).
proof_step(1, 22, is(97, '+'(85, 12)), builtin).
proof_step(1, 23, is(110, '+'(90, 20)), builtin).
proof_step(1, 24, '=<'(97, 100), builtin).
proof_step(1, 25, '>'(110, 100), builtin).
proof_step(1, 26, '>='(70, 50), builtin).
proof_step(1, 27, '<'(70, 80), builtin).
proof_step(1, 28, '>='(85, 80), builtin).
proof_step(1, 29, '>='(97, 80), builtin).
proof_step(1, 30, '>='(100, 80), builtin).
proof_step(1, 31, '>'(85, 70), builtin).
proof_step(1, 32, '>'(97, 70), builtin).
proof_step(1, 33, '>'(100, 70), builtin).
proof_step(1, 34, '>'(97, 85), builtin).
proof_step(1, 35, '>'(100, 85), builtin).
proof_step(1, 36, '>'(100, 97), builtin).
proof_step(1, 37, is(4, '+'(3, 1)), builtin).
proof_step(1, 38, is(3, '+'(2, 1)), builtin).
proof_step(1, 39, is(2, '+'(1, 1)), builtin).
proof_step(1, 40, is(1, '+'(0, 1)), builtin).
proof_step(1, 41, has_notice(c2), rule(1, [5, 15])).
proof_step(1, 42, has_notice(c6), rule(1, [9, 16])).
proof_step(
    1,
    43,
    finding(c4, 70, export_prohibited, permit_export),
    rule(5, [4, 13, 17])
).
proof_step(
    1,
    44,
    finding(c2, 85, short_notice(3, 14), increase_notice(14)),
    rule(3, [2, 5, 14, 18, 11, 19])
).
proof_step(1, 45, severity(70, moderate), rule(9, [26, 27])).
proof_step(1, 46, severity(85, high), rule(8, [28])).
proof_step(1, 47, severity(97, high), rule(8, [29])).
proof_step(1, 48, severity(100, high), rule(8, [30])).
proof_step(1, 49, score(c4, 70), rule(7, [43, 20])).
proof_step(1, 50, score(c2, 85), rule(7, [44, 21])).
proof_step(1, 51, safeguard(c3, consent), absent(1)).
proof_step(1, 52, has_notice(c1), absent(1)).
proof_step(1, 53, safeguard(c1, inform), absent(1)).
proof_step(1, 54, higher(70, 85), rule(11, [50, 31])).
proof_step(
    1,
    55,
    finding(c3, 97, sharing_without_consent, require_consent),
    rule(4, [3, 51, 12, 22])
).
proof_step(
    1,
    56,
    finding(c1, 110, no_removal_safeguards, add_notice_and_inform),
    rule(2, [1, 10, 52, 53, 23])
).
proof_step(1, 57, score(c3, 97), rule(7, [55, 24])).
proof_step(1, 58, score(c1, 100), rule(6, [56, 25])).
proof_step(1, 59, higher(70, 97), rule(11, [57, 32])).
proof_step(1, 60, higher(85, 97), rule(11, [57, 34])).
proof_step(1, 61, higher(70, 100), rule(11, [58, 33])).
proof_step(1, 62, higher(85, 100), rule(11, [58, 35])).
proof_step(1, 63, higher(97, 100), rule(11, [58, 36])).
proof_step(
    1,
    64,
    '$aggregate:r12:4'(
        [
            binding('Clause', c4),
            binding('Fix', permit_export),
            binding('Raw', 70),
            binding('Score', 70),
            binding('Severity', moderate),
            binding('Why', export_prohibited)
        ],
        3
    ),
    aggregate(rule(12), 4, 2)
).
proof_step(
    1,
    65,
    '$aggregate:r12:4'(
        [
            binding('Clause', c2),
            binding('Fix', increase_notice(14)),
            binding('Raw', 85),
            binding('Score', 85),
            binding('Severity', high),
            binding('Why', short_notice(3, 14))
        ],
        2
    ),
    aggregate(rule(12), 4, 2)
).
proof_step(
    1,
    66,
    '$aggregate:r12:4'(
        [
            binding('Clause', c3),
            binding('Fix', require_consent),
            binding('Raw', 97),
            binding('Score', 97),
            binding('Severity', high),
            binding('Why', sharing_without_consent)
        ],
        1
    ),
    aggregate(rule(12), 4, 2)
).
proof_step(
    1,
    67,
    '$aggregate:r12:4'(
        [
            binding('Clause', c1),
            binding('Fix', add_notice_and_inform),
            binding('Raw', 110),
            binding('Score', 100),
            binding('Severity', high),
            binding('Why', no_removal_safeguards)
        ],
        0
    ),
    aggregate(rule(12), 4, 2)
).
proof_step(
    1,
    68,
    report(4, c4, 70, moderate, export_prohibited, permit_export),
    rule(12, [49, 43, 45, 64, 37])
).
proof_step(
    1,
    69,
    report(3, c2, 85, high, short_notice(3, 14), increase_notice(14)),
    rule(12, [50, 44, 46, 65, 38])
).
proof_step(
    1,
    70,
    report(2, c3, 97, high, sharing_without_consent, require_consent),
    rule(12, [57, 55, 47, 66, 39])
).
proof_step(
    1,
    71,
    report(1, c1, 100, high, no_removal_safeguards, add_notice_and_inform),
    rule(12, [58, 56, 48, 67, 40])
).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 14).
proof_boundary_steps(1, 1, 41, 48).
proof_boundary_call(1, 1, severity(100, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, severity(70, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, severity(85, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, severity(97, variable("_EyeplCall0"))).
proof_boundary(1, 2, 1).
proof_boundary_steps(1, 2, 1, 14).
proof_boundary_steps(1, 2, 41, 50).
proof_boundary_steps(1, 2, 54, 63).
proof_boundary_call(1, 2, higher(100, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, higher(70, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, higher(85, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, higher(97, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, severity(100, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, severity(70, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, severity(85, variable("_EyeplCall0"))).
proof_boundary_call(1, 2, severity(97, variable("_EyeplCall0"))).
proof_claim(1, answer(1, [68])).
proof_claim(1, answer(1, [69])).
proof_claim(1, answer(1, [70])).
proof_claim(1, answer(1, [71])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

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
