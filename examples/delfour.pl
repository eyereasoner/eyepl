% Choosing a lower-sugar shopping alternative
%
% Model a shopping assistant that suggests a lower-sugar product while
% keeping the household's private condition out of the shared shopping
% guidance.
%
% The program checks the policy, purpose, timing, and supplied verification
% information attached to the shopping case. It chooses an alternative from
% the same product category with the least sugar per serving. Permissions are
% specific to the case's data package. Signature verification is trusted
% input; the rules do not calculate or verify an HMAC cryptographic
% signature. Timestamps use the same UTC format so text comparisons preserve
% time order.

'case-name'(delfour, "delfour").
household(delfour, 'household-profile').
condition('household-profile', "Diabetes").
'request-purpose'(delfour, 'shopping-assist').
'request-action'(delfour, use).
'phone-created'(delfour, "2025-10-05T20:33:48.907163+00:00").
'phone-expires'(delfour, "2025-10-05T22:33:48.907185+00:00").
'authorization-time'(delfour, "2025-10-05T20:35:48.907163+00:00").
'duty-time'(delfour, "2025-10-05T20:37:48.907163+00:00").
'files-written'(delfour, 6).
'audit-entries'(delfour, 1).
'scanned-product'(delfour, 'prod-bis-001').
envelope(delfour, 'shopping-envelope').
signature(delfour, 'scanner-signature').
'display-id'('prod-bis-001', "prod_BIS_001").
name('prod-bis-001', "Classic Tea Biscuits").
sugar('prod-bis-001', 12).
category('prod-bis-001', biscuits).
'display-id'('prod-bis-101', "prod_BIS_101").
name('prod-bis-101', "Low-Sugar Tea Biscuits").
sugar('prod-bis-101', 3).
category('prod-bis-101', biscuits).
'display-id'('prod-choc-050', "prod_CHOC_050").
name('prod-choc-050', "Milk Chocolate Bar").
sugar('prod-choc-050', 15).
category('prod-choc-050', chocolate).
'display-id'('prod-choc-150', "prod_CHOC_150").
name('prod-choc-150', "85% Dark Chocolate").
sugar('prod-choc-150', 6).
category('prod-choc-150', chocolate).
metric('sugar-insight', "sugar_g_per_serving").
threshold('sugar-insight', 10).
'threshold-display'('sugar-insight', "10.0").
'suggestion-policy'('sugar-insight', "lower_metric_first_higher_price_ok").
device('sugar-insight', "self-scanner").
event('sugar-insight', "pick_up_scanner").
retailer('sugar-insight', "Delfour").
created('sugar-insight', "2025-10-05T20:33:48.907163+00:00").
expires('sugar-insight', "2025-10-05T22:33:48.907185+00:00").
'payload-text'('sugar-insight', "createdat expiresat insight metric sugar_g_per_serving retailer delfour scopedevice self-scanner scopeevent pick_up_scanner").
permission(['shopping-policy', use, 'sugar-insight'], 'shopping-assist').
prohibition(['shopping-policy', distribute, 'sugar-insight'], marketing).
'deletion-deadline'('shopping-policy', "2025-10-05T22:33:48.907185+00:00").
insight('shopping-envelope', 'sugar-insight').
policy('shopping-envelope', 'shopping-policy').
hash('shopping-envelope', "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098").
algorithm('scanner-signature', "HMAC-SHA256").
'key-id'('scanner-signature', "demo-shared-secret").
created('scanner-signature', "2025-10-05T20:33:48.907163+00:00").
'payload-hash'('scanner-signature', "34ad35638dfd7c67d031eeca8abb235ec24280740f863f3f31cd9d7b6517f098").
hmac('scanner-signature', "b21d0072d90112a9f820aced0286889f4b6ef92b145e6fdef1011f3bfa4608c2").
'verification-mode'('scanner-signature', 'trusted-precomputed-input').

'case-insight'(Case, Insight) :-
    envelope(Case, Envelope),
    insight(Envelope, Insight).
'case-policy'(Case, Policy) :-
    envelope(Case, Envelope),
    policy(Envelope, Policy).
is_a(Case, 'low-sugar-case') :-
    household(Case, Household),
    condition(Household, "Diabetes").
'derived-need'([Case, Insight], 'low-sugar') :-
    is_a(Case, 'low-sugar-case'),
    'case-insight'(Case, Insight).
is_a([Case, 'trusted-signature'], 'passed-check') :-
    signature(Case, Signature),
    'verification-mode'(Signature, 'trusted-precomputed-input').
is_a([Case, 'matching-hash'], 'passed-check') :-
    envelope(Case, Envelope),
    signature(Case, Signature),
    hash(Envelope, Hash),
    'payload-hash'(Signature, Hash).
is_a([Case, 'minimal-payload'], 'passed-check') :-
    'case-insight'(Case, Insight),
    'payload-text'(Insight, Payload),
    \+ (contains_text(Payload, "diabetes")),
    \+ (contains_text(Payload, "medical")).
is_a([Case, 'complete-scope'], 'passed-check') :-
    'case-insight'(Case, Insight),
    device(Insight, Device),
    event(Insight, Event),
    expires(Insight, Expires).
is_a([Case, authorization], 'passed-check') :-
    'case-insight'(Case, Insight),
    'case-policy'(Case, Policy),
    permission([Policy, use, Insight], 'shopping-assist'),
    'request-action'(Case, use),
    'request-purpose'(Case, 'shopping-assist'),
    'authorization-time'(Case, Time),
    expires(Insight, Expires),
    Time @=< Expires.
outcome(Case, "Allowed") :-
    is_a([Case, authorization], 'passed-check').
target(Case, Insight) :-
    is_a([Case, authorization], 'passed-check'),
    'case-insight'(Case, Insight).
'scanned-name'(Case, Name) :-
    'scanned-product'(Case, Product),
    name(Product, Name).
'scanned-category'(Case, Category) :-
    'scanned-product'(Case, Product),
    category(Product, Category).
'scanned-sugar'(Case, Sugar) :-
    'scanned-product'(Case, Product),
    sugar(Product, Sugar).
is_a([Case, 'high-sugar'], 'passed-check') :-
    is_a([Case, authorization], 'passed-check'),
    'scanned-sugar'(Case, Sugar),
    'case-insight'(Case, Insight),
    threshold(Insight, Threshold),
    Sugar >= Threshold.
headline(Case, "Track sugar per serving while you scan") :-
    is_a([Case, 'high-sugar'], 'passed-check').
note(Case, "High sugar") :-
    is_a([Case, 'high-sugar'], 'passed-check').
considers(Case, Product) :-
    'scanned-category'(Case, Category),
    'scanned-sugar'(Case, ScannedSugar),
    category(Product, Category),
    sugar(Product, Sugar),
    Sugar < ScannedSugar.
is_a([Case, Product], 'beaten-candidate') :-
    considers(Case, Product),
    considers(Case, Other),
    sugar(Product, Sugar),
    sugar(Other, OtherSugar),
    OtherSugar < Sugar.
alternative(Case, Product) :-
    considers(Case, Product),
    \+ (is_a([Case, Product], 'beaten-candidate')).
'alternative-name'(Case, Name) :-
    alternative(Case, Product),
    name(Product, Name).
'banner-alternative'(Case, Name) :-
    is_a([Case, 'high-sugar'], 'passed-check'),
    'alternative-name'(Case, Name).
is_a([Case, 'lower-sugar'], 'passed-check') :-
    'scanned-sugar'(Case, ScannedSugar),
    alternative(Case, Product),
    sugar(Product, Sugar),
    Sugar < ScannedSugar.
is_a([Case, 'duty-timing'], 'passed-check') :-
    'case-insight'(Case, Insight),
    'duty-time'(Case, Time),
    expires(Insight, Expires),
    Time @=< Expires.
is_a([Case, 'marketing-prohibited'], 'passed-check') :-
    'case-policy'(Case, Policy),
    'case-insight'(Case, Insight),
    prohibition([Policy, distribute, Insight], marketing).
is_a([Case, 'expected-file-count'], 'passed-check') :-
    'files-written'(Case, 6).
is_a(Case, 'checked-case') :-
    is_a([Case, 'trusted-signature'], 'passed-check'),
    is_a([Case, 'matching-hash'], 'passed-check'),
    is_a([Case, 'minimal-payload'], 'passed-check'),
    is_a([Case, 'complete-scope'], 'passed-check'),
    is_a([Case, authorization], 'passed-check'),
    is_a([Case, 'high-sugar'], 'passed-check'),
    is_a([Case, 'lower-sugar'], 'passed-check'),
    is_a([Case, 'duty-timing'], 'passed-check'),
    is_a([Case, 'marketing-prohibited'], 'passed-check'),
    is_a([Case, 'expected-file-count'], 'passed-check').
scope(Case, [Device, Event]) :-
    'case-insight'(Case, Insight),
    device(Insight, Device),
    event(Insight, Event).

% Answer
?- 'case-name'(delfour, What).
?- is_a(delfour, 'low-sugar-case').
?- 'derived-need'([delfour, 'sugar-insight'], What).

% Reason
?- why.

% Answer
?- outcome(delfour, What).
?- target(delfour, What).
?- metric('sugar-insight', What).
?- 'threshold-display'('sugar-insight', What).
?- scope(delfour, What).
?- retailer('sugar-insight', What).
?- expires('sugar-insight', What).
?- 'scanned-name'(delfour, What).
?- 'alternative-name'(delfour, What).
?- 'banner-alternative'(delfour, What).
?- headline(delfour, What).
?- note(delfour, What).
?- algorithm('scanner-signature', What).
?- 'audit-entries'(delfour, What).
?- 'files-written'(delfour, What).
?- is_a(Who, 'passed-check').
?- is_a(delfour, 'checked-case').

% Check
?- check((outcome(delfour, "Allowed"))).
?- check((note(delfour, "High sugar"))).
?- check(('alternative-name'(delfour, "Low-Sugar Tea Biscuits"))).
?- check((aggregate_all(count, is_a(Subject, 'passed-check'), 10))).
?- check((is_a(delfour, 'checked-case'))).
