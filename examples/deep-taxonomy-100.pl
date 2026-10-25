% Following a classification chain 100 levels deep
%
% Follow 100 classification steps from n0 through n100. The individual
% ind starts with label n0 and acquires the next n label plus two side
% labels, i and j, at each step. The final n label implies a2.
%
% The query asks which individual has label a2, and the proof traces
% the supporting chain. Longer versions produce larger proofs.

is_a(ind, n0).

is_a(Entity, a2) :-
    is_a(Entity, n100).
is_a(Entity, n1) :-
    is_a(Entity, n0).
is_a(Entity, i1) :-
    is_a(Entity, n0).
is_a(Entity, j1) :-
    is_a(Entity, n0).
is_a(Entity, n2) :-
    is_a(Entity, n1).
is_a(Entity, i2) :-
    is_a(Entity, n1).
is_a(Entity, j2) :-
    is_a(Entity, n1).
is_a(Entity, n3) :-
    is_a(Entity, n2).
is_a(Entity, i3) :-
    is_a(Entity, n2).
is_a(Entity, j3) :-
    is_a(Entity, n2).
is_a(Entity, n4) :-
    is_a(Entity, n3).
is_a(Entity, i4) :-
    is_a(Entity, n3).
is_a(Entity, j4) :-
    is_a(Entity, n3).
is_a(Entity, n5) :-
    is_a(Entity, n4).
is_a(Entity, i5) :-
    is_a(Entity, n4).
is_a(Entity, j5) :-
    is_a(Entity, n4).
is_a(Entity, n6) :-
    is_a(Entity, n5).
is_a(Entity, i6) :-
    is_a(Entity, n5).
is_a(Entity, j6) :-
    is_a(Entity, n5).
is_a(Entity, n7) :-
    is_a(Entity, n6).
is_a(Entity, i7) :-
    is_a(Entity, n6).
is_a(Entity, j7) :-
    is_a(Entity, n6).
is_a(Entity, n8) :-
    is_a(Entity, n7).
is_a(Entity, i8) :-
    is_a(Entity, n7).
is_a(Entity, j8) :-
    is_a(Entity, n7).
is_a(Entity, n9) :-
    is_a(Entity, n8).
is_a(Entity, i9) :-
    is_a(Entity, n8).
is_a(Entity, j9) :-
    is_a(Entity, n8).
is_a(Entity, n10) :-
    is_a(Entity, n9).
is_a(Entity, i10) :-
    is_a(Entity, n9).
is_a(Entity, j10) :-
    is_a(Entity, n9).
is_a(Entity, n11) :-
    is_a(Entity, n10).
is_a(Entity, i11) :-
    is_a(Entity, n10).
is_a(Entity, j11) :-
    is_a(Entity, n10).
is_a(Entity, n12) :-
    is_a(Entity, n11).
is_a(Entity, i12) :-
    is_a(Entity, n11).
is_a(Entity, j12) :-
    is_a(Entity, n11).
is_a(Entity, n13) :-
    is_a(Entity, n12).
is_a(Entity, i13) :-
    is_a(Entity, n12).
is_a(Entity, j13) :-
    is_a(Entity, n12).
is_a(Entity, n14) :-
    is_a(Entity, n13).
is_a(Entity, i14) :-
    is_a(Entity, n13).
is_a(Entity, j14) :-
    is_a(Entity, n13).
is_a(Entity, n15) :-
    is_a(Entity, n14).
is_a(Entity, i15) :-
    is_a(Entity, n14).
is_a(Entity, j15) :-
    is_a(Entity, n14).
is_a(Entity, n16) :-
    is_a(Entity, n15).
is_a(Entity, i16) :-
    is_a(Entity, n15).
is_a(Entity, j16) :-
    is_a(Entity, n15).
is_a(Entity, n17) :-
    is_a(Entity, n16).
is_a(Entity, i17) :-
    is_a(Entity, n16).
is_a(Entity, j17) :-
    is_a(Entity, n16).
is_a(Entity, n18) :-
    is_a(Entity, n17).
is_a(Entity, i18) :-
    is_a(Entity, n17).
is_a(Entity, j18) :-
    is_a(Entity, n17).
is_a(Entity, n19) :-
    is_a(Entity, n18).
is_a(Entity, i19) :-
    is_a(Entity, n18).
is_a(Entity, j19) :-
    is_a(Entity, n18).
is_a(Entity, n20) :-
    is_a(Entity, n19).
is_a(Entity, i20) :-
    is_a(Entity, n19).
is_a(Entity, j20) :-
    is_a(Entity, n19).
is_a(Entity, n21) :-
    is_a(Entity, n20).
is_a(Entity, i21) :-
    is_a(Entity, n20).
is_a(Entity, j21) :-
    is_a(Entity, n20).
is_a(Entity, n22) :-
    is_a(Entity, n21).
is_a(Entity, i22) :-
    is_a(Entity, n21).
is_a(Entity, j22) :-
    is_a(Entity, n21).
is_a(Entity, n23) :-
    is_a(Entity, n22).
is_a(Entity, i23) :-
    is_a(Entity, n22).
is_a(Entity, j23) :-
    is_a(Entity, n22).
is_a(Entity, n24) :-
    is_a(Entity, n23).
is_a(Entity, i24) :-
    is_a(Entity, n23).
is_a(Entity, j24) :-
    is_a(Entity, n23).
is_a(Entity, n25) :-
    is_a(Entity, n24).
is_a(Entity, i25) :-
    is_a(Entity, n24).
is_a(Entity, j25) :-
    is_a(Entity, n24).
is_a(Entity, n26) :-
    is_a(Entity, n25).
is_a(Entity, i26) :-
    is_a(Entity, n25).
is_a(Entity, j26) :-
    is_a(Entity, n25).
is_a(Entity, n27) :-
    is_a(Entity, n26).
is_a(Entity, i27) :-
    is_a(Entity, n26).
is_a(Entity, j27) :-
    is_a(Entity, n26).
is_a(Entity, n28) :-
    is_a(Entity, n27).
is_a(Entity, i28) :-
    is_a(Entity, n27).
is_a(Entity, j28) :-
    is_a(Entity, n27).
is_a(Entity, n29) :-
    is_a(Entity, n28).
is_a(Entity, i29) :-
    is_a(Entity, n28).
is_a(Entity, j29) :-
    is_a(Entity, n28).
is_a(Entity, n30) :-
    is_a(Entity, n29).
is_a(Entity, i30) :-
    is_a(Entity, n29).
is_a(Entity, j30) :-
    is_a(Entity, n29).
is_a(Entity, n31) :-
    is_a(Entity, n30).
is_a(Entity, i31) :-
    is_a(Entity, n30).
is_a(Entity, j31) :-
    is_a(Entity, n30).
is_a(Entity, n32) :-
    is_a(Entity, n31).
is_a(Entity, i32) :-
    is_a(Entity, n31).
is_a(Entity, j32) :-
    is_a(Entity, n31).
is_a(Entity, n33) :-
    is_a(Entity, n32).
is_a(Entity, i33) :-
    is_a(Entity, n32).
is_a(Entity, j33) :-
    is_a(Entity, n32).
is_a(Entity, n34) :-
    is_a(Entity, n33).
is_a(Entity, i34) :-
    is_a(Entity, n33).
is_a(Entity, j34) :-
    is_a(Entity, n33).
is_a(Entity, n35) :-
    is_a(Entity, n34).
is_a(Entity, i35) :-
    is_a(Entity, n34).
is_a(Entity, j35) :-
    is_a(Entity, n34).
is_a(Entity, n36) :-
    is_a(Entity, n35).
is_a(Entity, i36) :-
    is_a(Entity, n35).
is_a(Entity, j36) :-
    is_a(Entity, n35).
is_a(Entity, n37) :-
    is_a(Entity, n36).
is_a(Entity, i37) :-
    is_a(Entity, n36).
is_a(Entity, j37) :-
    is_a(Entity, n36).
is_a(Entity, n38) :-
    is_a(Entity, n37).
is_a(Entity, i38) :-
    is_a(Entity, n37).
is_a(Entity, j38) :-
    is_a(Entity, n37).
is_a(Entity, n39) :-
    is_a(Entity, n38).
is_a(Entity, i39) :-
    is_a(Entity, n38).
is_a(Entity, j39) :-
    is_a(Entity, n38).
is_a(Entity, n40) :-
    is_a(Entity, n39).
is_a(Entity, i40) :-
    is_a(Entity, n39).
is_a(Entity, j40) :-
    is_a(Entity, n39).
is_a(Entity, n41) :-
    is_a(Entity, n40).
is_a(Entity, i41) :-
    is_a(Entity, n40).
is_a(Entity, j41) :-
    is_a(Entity, n40).
is_a(Entity, n42) :-
    is_a(Entity, n41).
is_a(Entity, i42) :-
    is_a(Entity, n41).
is_a(Entity, j42) :-
    is_a(Entity, n41).
is_a(Entity, n43) :-
    is_a(Entity, n42).
is_a(Entity, i43) :-
    is_a(Entity, n42).
is_a(Entity, j43) :-
    is_a(Entity, n42).
is_a(Entity, n44) :-
    is_a(Entity, n43).
is_a(Entity, i44) :-
    is_a(Entity, n43).
is_a(Entity, j44) :-
    is_a(Entity, n43).
is_a(Entity, n45) :-
    is_a(Entity, n44).
is_a(Entity, i45) :-
    is_a(Entity, n44).
is_a(Entity, j45) :-
    is_a(Entity, n44).
is_a(Entity, n46) :-
    is_a(Entity, n45).
is_a(Entity, i46) :-
    is_a(Entity, n45).
is_a(Entity, j46) :-
    is_a(Entity, n45).
is_a(Entity, n47) :-
    is_a(Entity, n46).
is_a(Entity, i47) :-
    is_a(Entity, n46).
is_a(Entity, j47) :-
    is_a(Entity, n46).
is_a(Entity, n48) :-
    is_a(Entity, n47).
is_a(Entity, i48) :-
    is_a(Entity, n47).
is_a(Entity, j48) :-
    is_a(Entity, n47).
is_a(Entity, n49) :-
    is_a(Entity, n48).
is_a(Entity, i49) :-
    is_a(Entity, n48).
is_a(Entity, j49) :-
    is_a(Entity, n48).
is_a(Entity, n50) :-
    is_a(Entity, n49).
is_a(Entity, i50) :-
    is_a(Entity, n49).
is_a(Entity, j50) :-
    is_a(Entity, n49).
is_a(Entity, n51) :-
    is_a(Entity, n50).
is_a(Entity, i51) :-
    is_a(Entity, n50).
is_a(Entity, j51) :-
    is_a(Entity, n50).
is_a(Entity, n52) :-
    is_a(Entity, n51).
is_a(Entity, i52) :-
    is_a(Entity, n51).
is_a(Entity, j52) :-
    is_a(Entity, n51).
is_a(Entity, n53) :-
    is_a(Entity, n52).
is_a(Entity, i53) :-
    is_a(Entity, n52).
is_a(Entity, j53) :-
    is_a(Entity, n52).
is_a(Entity, n54) :-
    is_a(Entity, n53).
is_a(Entity, i54) :-
    is_a(Entity, n53).
is_a(Entity, j54) :-
    is_a(Entity, n53).
is_a(Entity, n55) :-
    is_a(Entity, n54).
is_a(Entity, i55) :-
    is_a(Entity, n54).
is_a(Entity, j55) :-
    is_a(Entity, n54).
is_a(Entity, n56) :-
    is_a(Entity, n55).
is_a(Entity, i56) :-
    is_a(Entity, n55).
is_a(Entity, j56) :-
    is_a(Entity, n55).
is_a(Entity, n57) :-
    is_a(Entity, n56).
is_a(Entity, i57) :-
    is_a(Entity, n56).
is_a(Entity, j57) :-
    is_a(Entity, n56).
is_a(Entity, n58) :-
    is_a(Entity, n57).
is_a(Entity, i58) :-
    is_a(Entity, n57).
is_a(Entity, j58) :-
    is_a(Entity, n57).
is_a(Entity, n59) :-
    is_a(Entity, n58).
is_a(Entity, i59) :-
    is_a(Entity, n58).
is_a(Entity, j59) :-
    is_a(Entity, n58).
is_a(Entity, n60) :-
    is_a(Entity, n59).
is_a(Entity, i60) :-
    is_a(Entity, n59).
is_a(Entity, j60) :-
    is_a(Entity, n59).
is_a(Entity, n61) :-
    is_a(Entity, n60).
is_a(Entity, i61) :-
    is_a(Entity, n60).
is_a(Entity, j61) :-
    is_a(Entity, n60).
is_a(Entity, n62) :-
    is_a(Entity, n61).
is_a(Entity, i62) :-
    is_a(Entity, n61).
is_a(Entity, j62) :-
    is_a(Entity, n61).
is_a(Entity, n63) :-
    is_a(Entity, n62).
is_a(Entity, i63) :-
    is_a(Entity, n62).
is_a(Entity, j63) :-
    is_a(Entity, n62).
is_a(Entity, n64) :-
    is_a(Entity, n63).
is_a(Entity, i64) :-
    is_a(Entity, n63).
is_a(Entity, j64) :-
    is_a(Entity, n63).
is_a(Entity, n65) :-
    is_a(Entity, n64).
is_a(Entity, i65) :-
    is_a(Entity, n64).
is_a(Entity, j65) :-
    is_a(Entity, n64).
is_a(Entity, n66) :-
    is_a(Entity, n65).
is_a(Entity, i66) :-
    is_a(Entity, n65).
is_a(Entity, j66) :-
    is_a(Entity, n65).
is_a(Entity, n67) :-
    is_a(Entity, n66).
is_a(Entity, i67) :-
    is_a(Entity, n66).
is_a(Entity, j67) :-
    is_a(Entity, n66).
is_a(Entity, n68) :-
    is_a(Entity, n67).
is_a(Entity, i68) :-
    is_a(Entity, n67).
is_a(Entity, j68) :-
    is_a(Entity, n67).
is_a(Entity, n69) :-
    is_a(Entity, n68).
is_a(Entity, i69) :-
    is_a(Entity, n68).
is_a(Entity, j69) :-
    is_a(Entity, n68).
is_a(Entity, n70) :-
    is_a(Entity, n69).
is_a(Entity, i70) :-
    is_a(Entity, n69).
is_a(Entity, j70) :-
    is_a(Entity, n69).
is_a(Entity, n71) :-
    is_a(Entity, n70).
is_a(Entity, i71) :-
    is_a(Entity, n70).
is_a(Entity, j71) :-
    is_a(Entity, n70).
is_a(Entity, n72) :-
    is_a(Entity, n71).
is_a(Entity, i72) :-
    is_a(Entity, n71).
is_a(Entity, j72) :-
    is_a(Entity, n71).
is_a(Entity, n73) :-
    is_a(Entity, n72).
is_a(Entity, i73) :-
    is_a(Entity, n72).
is_a(Entity, j73) :-
    is_a(Entity, n72).
is_a(Entity, n74) :-
    is_a(Entity, n73).
is_a(Entity, i74) :-
    is_a(Entity, n73).
is_a(Entity, j74) :-
    is_a(Entity, n73).
is_a(Entity, n75) :-
    is_a(Entity, n74).
is_a(Entity, i75) :-
    is_a(Entity, n74).
is_a(Entity, j75) :-
    is_a(Entity, n74).
is_a(Entity, n76) :-
    is_a(Entity, n75).
is_a(Entity, i76) :-
    is_a(Entity, n75).
is_a(Entity, j76) :-
    is_a(Entity, n75).
is_a(Entity, n77) :-
    is_a(Entity, n76).
is_a(Entity, i77) :-
    is_a(Entity, n76).
is_a(Entity, j77) :-
    is_a(Entity, n76).
is_a(Entity, n78) :-
    is_a(Entity, n77).
is_a(Entity, i78) :-
    is_a(Entity, n77).
is_a(Entity, j78) :-
    is_a(Entity, n77).
is_a(Entity, n79) :-
    is_a(Entity, n78).
is_a(Entity, i79) :-
    is_a(Entity, n78).
is_a(Entity, j79) :-
    is_a(Entity, n78).
is_a(Entity, n80) :-
    is_a(Entity, n79).
is_a(Entity, i80) :-
    is_a(Entity, n79).
is_a(Entity, j80) :-
    is_a(Entity, n79).
is_a(Entity, n81) :-
    is_a(Entity, n80).
is_a(Entity, i81) :-
    is_a(Entity, n80).
is_a(Entity, j81) :-
    is_a(Entity, n80).
is_a(Entity, n82) :-
    is_a(Entity, n81).
is_a(Entity, i82) :-
    is_a(Entity, n81).
is_a(Entity, j82) :-
    is_a(Entity, n81).
is_a(Entity, n83) :-
    is_a(Entity, n82).
is_a(Entity, i83) :-
    is_a(Entity, n82).
is_a(Entity, j83) :-
    is_a(Entity, n82).
is_a(Entity, n84) :-
    is_a(Entity, n83).
is_a(Entity, i84) :-
    is_a(Entity, n83).
is_a(Entity, j84) :-
    is_a(Entity, n83).
is_a(Entity, n85) :-
    is_a(Entity, n84).
is_a(Entity, i85) :-
    is_a(Entity, n84).
is_a(Entity, j85) :-
    is_a(Entity, n84).
is_a(Entity, n86) :-
    is_a(Entity, n85).
is_a(Entity, i86) :-
    is_a(Entity, n85).
is_a(Entity, j86) :-
    is_a(Entity, n85).
is_a(Entity, n87) :-
    is_a(Entity, n86).
is_a(Entity, i87) :-
    is_a(Entity, n86).
is_a(Entity, j87) :-
    is_a(Entity, n86).
is_a(Entity, n88) :-
    is_a(Entity, n87).
is_a(Entity, i88) :-
    is_a(Entity, n87).
is_a(Entity, j88) :-
    is_a(Entity, n87).
is_a(Entity, n89) :-
    is_a(Entity, n88).
is_a(Entity, i89) :-
    is_a(Entity, n88).
is_a(Entity, j89) :-
    is_a(Entity, n88).
is_a(Entity, n90) :-
    is_a(Entity, n89).
is_a(Entity, i90) :-
    is_a(Entity, n89).
is_a(Entity, j90) :-
    is_a(Entity, n89).
is_a(Entity, n91) :-
    is_a(Entity, n90).
is_a(Entity, i91) :-
    is_a(Entity, n90).
is_a(Entity, j91) :-
    is_a(Entity, n90).
is_a(Entity, n92) :-
    is_a(Entity, n91).
is_a(Entity, i92) :-
    is_a(Entity, n91).
is_a(Entity, j92) :-
    is_a(Entity, n91).
is_a(Entity, n93) :-
    is_a(Entity, n92).
is_a(Entity, i93) :-
    is_a(Entity, n92).
is_a(Entity, j93) :-
    is_a(Entity, n92).
is_a(Entity, n94) :-
    is_a(Entity, n93).
is_a(Entity, i94) :-
    is_a(Entity, n93).
is_a(Entity, j94) :-
    is_a(Entity, n93).
is_a(Entity, n95) :-
    is_a(Entity, n94).
is_a(Entity, i95) :-
    is_a(Entity, n94).
is_a(Entity, j95) :-
    is_a(Entity, n94).
is_a(Entity, n96) :-
    is_a(Entity, n95).
is_a(Entity, i96) :-
    is_a(Entity, n95).
is_a(Entity, j96) :-
    is_a(Entity, n95).
is_a(Entity, n97) :-
    is_a(Entity, n96).
is_a(Entity, i97) :-
    is_a(Entity, n96).
is_a(Entity, j97) :-
    is_a(Entity, n96).
is_a(Entity, n98) :-
    is_a(Entity, n97).
is_a(Entity, i98) :-
    is_a(Entity, n97).
is_a(Entity, j98) :-
    is_a(Entity, n97).
is_a(Entity, n99) :-
    is_a(Entity, n98).
is_a(Entity, i99) :-
    is_a(Entity, n98).
is_a(Entity, j99) :-
    is_a(Entity, n98).
is_a(Entity, n100) :-
    is_a(Entity, n99).
is_a(Entity, i100) :-
    is_a(Entity, n99).
is_a(Entity, j100) :-
    is_a(Entity, n99).

% Answer
?- is_a(Who, a2).

% Reason
?- why.

% Check
?- check((is_a(ind, a2))).
?- check((is_a(ind, n100))).
?- check((is_a(ind, i100))).
?- check((is_a(ind, j100))).
?- check((\+ (is_a(ind, n101)))).
