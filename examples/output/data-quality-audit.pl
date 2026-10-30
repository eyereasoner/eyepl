% Answer 1
finding(customer(c2), empty_email).
finding(order(o3), invalid_amount(-5)).
finding(order(o3), duplicate_key(r09, r10)).
finding(customer(c1), conflicting_email("ada@example.org", "ada.new@example.org")).
finding(record(r11), unsupported_shape(shipment, 1)).
finding(customer(c3), missing_email).
finding(order(o2), unknown_customer(c9)).

% Reason 1
proof_step(1, 1, record(r01, customer(c1, "Ada")), source(1)).
proof_step(1, 2, record(r02, customer(c2, "Lin")), source(2)).
proof_step(1, 3, record(r03, customer(c3, "Mira")), source(3)).
proof_step(1, 4, record(r04, email(c1, "ada@example.org")), source(4)).
proof_step(1, 5, record(r05, email(c1, "ada.new@example.org")), source(5)).
proof_step(1, 6, record(r06, email(c2, "")), source(6)).
proof_step(1, 7, record(r07, order(o1, c1, 120)), source(7)).
proof_step(1, 8, record(r08, order(o2, c9, 45)), source(8)).
proof_step(1, 9, record(r09, order(o3, c2, -5)), source(9)).
proof_step(1, 10, record(r10, order(o3, c2, 9)), source(10)).
proof_step(1, 11, record(r11, shipment(o1)), source(11)).
proof_step(1, 12, allowed_shape(customer, 2), source(12)).
proof_step(1, 13, allowed_shape(email, 2), source(13)).
proof_step(1, 14, allowed_shape(order, 3), source(14)).
proof_step(1, 15, length([], 0), source(15)).
proof_step(1, 16, '<'(-5, 0), builtin).
proof_step(1, 17, '@<'(r09, r10), builtin).
proof_step(1, 18, '@<'(r04, r05), builtin).
proof_step(1, 19, '\\='("ada@example.org", "ada.new@example.org"), builtin).
proof_step(1, 20, is(1, '+'(0, 1)), builtin).
proof_step(1, 21, '=..'(shipment(o1), [shipment, o1]), builtin).
proof_step(1, 22, is(2, '+'(1, 1)), builtin).
proof_step(1, 23, '=..'(customer(c1, "Ada"), [customer, c1, "Ada"]), builtin).
proof_step(1, 24, '=..'(customer(c2, "Lin"), [customer, c2, "Lin"]), builtin).
proof_step(1, 25, '=..'(customer(c3, "Mira"), [customer, c3, "Mira"]), builtin).
proof_step(
    1,
    26,
    '=..'(email(c1, "ada@example.org"), [email, c1, "ada@example.org"]),
    builtin
).
proof_step(
    1,
    27,
    '=..'(email(c1, "ada.new@example.org"), [email, c1, "ada.new@example.org"]),
    builtin
).
proof_step(1, 28, '=..'(email(c2, ""), [email, c2, ""]), builtin).
proof_step(1, 29, is(3, '+'(2, 1)), builtin).
proof_step(1, 30, '=..'(order(o1, c1, 120), [order, o1, c1, 120]), builtin).
proof_step(1, 31, '=..'(order(o2, c9, 45), [order, o2, c9, 45]), builtin).
proof_step(1, 32, '=..'(order(o3, c2, -5), [order, o3, c2, -5]), builtin).
proof_step(1, 33, '=..'(order(o3, c2, 9), [order, o3, c2, 9]), builtin).
proof_step(1, 34, customer(c1), rule(2, [1])).
proof_step(1, 35, customer(c2), rule(2, [2])).
proof_step(1, 36, customer(c3), rule(2, [3])).
proof_step(1, 37, has_email(c1), rule(3, [4])).
proof_step(1, 38, has_email(c2), rule(3, [6])).
proof_step(1, 39, finding(customer(c2), empty_email), rule(7, [6])).
proof_step(1, 40, finding(order(o3), invalid_amount(-5)), rule(10, [9, 16])).
proof_step(1, 41, finding(order(o3), duplicate_key(r09, r10)), rule(11, [9, 10, 17])).
proof_step(
    1,
    42,
    finding(customer(c1), conflicting_email("ada@example.org", "ada.new@example.org")),
    rule(8, [4, 5, 18, 19])
).
proof_step(1, 43, length([o1], 1), rule(1, [15, 20])).
proof_step(1, 44, length(["Ada"], 1), rule(1, [15, 20])).
proof_step(1, 45, length(["Lin"], 1), rule(1, [15, 20])).
proof_step(1, 46, length(["Mira"], 1), rule(1, [15, 20])).
proof_step(1, 47, length(["ada@example.org"], 1), rule(1, [15, 20])).
proof_step(1, 48, length(["ada.new@example.org"], 1), rule(1, [15, 20])).
proof_step(1, 49, length([""], 1), rule(1, [15, 20])).
proof_step(1, 50, length([120], 1), rule(1, [15, 20])).
proof_step(1, 51, length([45], 1), rule(1, [15, 20])).
proof_step(1, 52, length([-5], 1), rule(1, [15, 20])).
proof_step(1, 53, length([9], 1), rule(1, [15, 20])).
proof_step(1, 54, record_shape(r11, shipment, 1), rule(4, [11, 21, 43])).
proof_step(1, 55, length([c1, "Ada"], 2), rule(1, [44, 22])).
proof_step(1, 56, length([c2, "Lin"], 2), rule(1, [45, 22])).
proof_step(1, 57, length([c3, "Mira"], 2), rule(1, [46, 22])).
proof_step(1, 58, length([c1, "ada@example.org"], 2), rule(1, [47, 22])).
proof_step(1, 59, length([c1, "ada.new@example.org"], 2), rule(1, [48, 22])).
proof_step(1, 60, length([c2, ""], 2), rule(1, [49, 22])).
proof_step(1, 61, length([c1, 120], 2), rule(1, [50, 22])).
proof_step(1, 62, length([c9, 45], 2), rule(1, [51, 22])).
proof_step(1, 63, length([c2, -5], 2), rule(1, [52, 22])).
proof_step(1, 64, length([c2, 9], 2), rule(1, [53, 22])).
proof_step(1, 65, record_shape(r01, customer, 2), rule(4, [1, 23, 55])).
proof_step(1, 66, record_shape(r02, customer, 2), rule(4, [2, 24, 56])).
proof_step(1, 67, record_shape(r03, customer, 2), rule(4, [3, 25, 57])).
proof_step(1, 68, record_shape(r04, email, 2), rule(4, [4, 26, 58])).
proof_step(1, 69, record_shape(r05, email, 2), rule(4, [5, 27, 59])).
proof_step(1, 70, record_shape(r06, email, 2), rule(4, [6, 28, 60])).
proof_step(1, 71, length([o1, c1, 120], 3), rule(1, [61, 29])).
proof_step(1, 72, length([o2, c9, 45], 3), rule(1, [62, 29])).
proof_step(1, 73, length([o3, c2, -5], 3), rule(1, [63, 29])).
proof_step(1, 74, length([o3, c2, 9], 3), rule(1, [64, 29])).
proof_step(1, 75, record_shape(r07, order, 3), rule(4, [7, 30, 71])).
proof_step(1, 76, record_shape(r08, order, 3), rule(4, [8, 31, 72])).
proof_step(1, 77, record_shape(r09, order, 3), rule(4, [9, 32, 73])).
proof_step(1, 78, record_shape(r10, order, 3), rule(4, [10, 33, 74])).
proof_step(1, 79, allowed_shape(shipment, 1), absent(1)).
proof_step(1, 80, has_email(c3), absent(1)).
proof_step(1, 81, customer(c9), absent(1)).
proof_step(
    1,
    82,
    finding(record(r11), unsupported_shape(shipment, 1)),
    rule(5, [54, 79])
).
proof_step(1, 83, finding(customer(c3), missing_email), rule(6, [36, 80])).
proof_step(1, 84, finding(order(o2), unknown_customer(c9)), rule(9, [8, 81])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 15).
proof_boundary_steps(1, 1, 34, 78).
proof_boundary_call(1, 1, length([""], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length(["Ada"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length(["Lin"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length(["Mira"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length(["ada.new@example.org"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length(["ada@example.org"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([-5], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([120], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([45], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([9], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c1, "Ada"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c1, "ada.new@example.org"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c1, "ada@example.org"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c1, 120], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c2, ""], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c2, "Lin"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c2, -5], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c2, 9], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c3, "Mira"], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([c9, 45], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([o1, c1, 120], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([o1], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([o2, c9, 45], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([o3, c2, -5], variable("_EyeplCall0"))).
proof_boundary_call(1, 1, length([o3, c2, 9], variable("_EyeplCall0"))).
proof_claim(1, answer(1, [39])).
proof_claim(1, answer(1, [40])).
proof_claim(1, answer(1, [41])).
proof_claim(1, answer(1, [42])).
proof_claim(1, answer(1, [82])).
proof_claim(1, answer(1, [83])).
proof_claim(1, answer(1, [84])).

% Answer 2
audit_summary(customer_count, 3).
audit_summary(finding_count, 7).

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
