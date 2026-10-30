% Answer 1
'case-name'(delfour, "delfour").

% Answer 2
is_a(delfour, 'low-sugar-case').

% Answer 3
'derived-need'([delfour, 'sugar-insight'], 'low-sugar').

% Reason 3
proof_step(3, 1, household(delfour, 'household-profile'), source(2)).
proof_step(3, 2, condition('household-profile', "Diabetes"), source(3)).
proof_step(3, 3, envelope(delfour, 'shopping-envelope'), source(13)).
proof_step(3, 4, insight('shopping-envelope', 'sugar-insight'), source(44)).
proof_step(3, 5, is_a(delfour, 'low-sugar-case'), rule(3, [1, 2])).
proof_step(3, 6, 'case-insight'(delfour, 'sugar-insight'), rule(1, [3, 4])).
proof_step(
    3,
    7,
    'derived-need'([delfour, 'sugar-insight'], 'low-sugar'),
    rule(4, [5, 6])
).
proof_claim(3, answer(3, [7])).

% Answer 4
outcome(delfour, "Allowed").

% Answer 5
target(delfour, 'sugar-insight').

% Answer 6
metric('sugar-insight', "sugar_g_per_serving").

% Answer 7
'threshold-display'('sugar-insight', "10.0").

% Answer 8
scope(delfour, ["self-scanner", "pick_up_scanner"]).

% Answer 9
retailer('sugar-insight', "Delfour").

% Answer 10
expires('sugar-insight', "2025-10-05T22:33:48.907185+00:00").

% Answer 11
'scanned-name'(delfour, "Classic Tea Biscuits").

% Answer 12
'alternative-name'(delfour, "Low-Sugar Tea Biscuits").

% Answer 13
'banner-alternative'(delfour, "Low-Sugar Tea Biscuits").

% Answer 14
headline(delfour, "Track sugar per serving while you scan").

% Answer 15
note(delfour, "High sugar").

% Answer 16
algorithm('scanner-signature', "HMAC-SHA256").

% Answer 17
'audit-entries'(delfour, 1).

% Answer 18
'files-written'(delfour, 6).

% Answer 19
is_a([delfour, 'expected-file-count'], 'passed-check').
is_a([delfour, 'matching-hash'], 'passed-check').
is_a([delfour, 'trusted-signature'], 'passed-check').
is_a([delfour, 'complete-scope'], 'passed-check').
is_a([delfour, authorization], 'passed-check').
is_a([delfour, 'duty-timing'], 'passed-check').
is_a([delfour, 'minimal-payload'], 'passed-check').
is_a([delfour, 'marketing-prohibited'], 'passed-check').
is_a([delfour, 'high-sugar'], 'passed-check').
is_a([delfour, 'lower-sugar'], 'passed-check').

% Answer 20
is_a(delfour, 'checked-case').

% Goal check 21
check_result(21, true).

% Goal check 22
check_result(22, true).

% Goal check 23
check_result(23, true).

% Goal check 24
check_result(24, true).

% Goal check 25
check_result(25, true).
