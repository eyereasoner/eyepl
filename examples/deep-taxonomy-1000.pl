% Following a classification chain 1,000 levels deep
%
% Follow 1,000 classification steps from n0 through n1000. The individual
% ind starts with label n0 and acquires the next n label plus two side
% labels, i and j, at each step. The final n label implies a2.
%
% The query asks which individual has label a2, and the proof traces
% the supporting chain. Longer versions produce larger proofs.

is_a(ind, n0).

is_a(Entity, a2) :-
    is_a(Entity, n1000).
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
is_a(Entity, n101) :-
    is_a(Entity, n100).
is_a(Entity, i101) :-
    is_a(Entity, n100).
is_a(Entity, j101) :-
    is_a(Entity, n100).
is_a(Entity, n102) :-
    is_a(Entity, n101).
is_a(Entity, i102) :-
    is_a(Entity, n101).
is_a(Entity, j102) :-
    is_a(Entity, n101).
is_a(Entity, n103) :-
    is_a(Entity, n102).
is_a(Entity, i103) :-
    is_a(Entity, n102).
is_a(Entity, j103) :-
    is_a(Entity, n102).
is_a(Entity, n104) :-
    is_a(Entity, n103).
is_a(Entity, i104) :-
    is_a(Entity, n103).
is_a(Entity, j104) :-
    is_a(Entity, n103).
is_a(Entity, n105) :-
    is_a(Entity, n104).
is_a(Entity, i105) :-
    is_a(Entity, n104).
is_a(Entity, j105) :-
    is_a(Entity, n104).
is_a(Entity, n106) :-
    is_a(Entity, n105).
is_a(Entity, i106) :-
    is_a(Entity, n105).
is_a(Entity, j106) :-
    is_a(Entity, n105).
is_a(Entity, n107) :-
    is_a(Entity, n106).
is_a(Entity, i107) :-
    is_a(Entity, n106).
is_a(Entity, j107) :-
    is_a(Entity, n106).
is_a(Entity, n108) :-
    is_a(Entity, n107).
is_a(Entity, i108) :-
    is_a(Entity, n107).
is_a(Entity, j108) :-
    is_a(Entity, n107).
is_a(Entity, n109) :-
    is_a(Entity, n108).
is_a(Entity, i109) :-
    is_a(Entity, n108).
is_a(Entity, j109) :-
    is_a(Entity, n108).
is_a(Entity, n110) :-
    is_a(Entity, n109).
is_a(Entity, i110) :-
    is_a(Entity, n109).
is_a(Entity, j110) :-
    is_a(Entity, n109).
is_a(Entity, n111) :-
    is_a(Entity, n110).
is_a(Entity, i111) :-
    is_a(Entity, n110).
is_a(Entity, j111) :-
    is_a(Entity, n110).
is_a(Entity, n112) :-
    is_a(Entity, n111).
is_a(Entity, i112) :-
    is_a(Entity, n111).
is_a(Entity, j112) :-
    is_a(Entity, n111).
is_a(Entity, n113) :-
    is_a(Entity, n112).
is_a(Entity, i113) :-
    is_a(Entity, n112).
is_a(Entity, j113) :-
    is_a(Entity, n112).
is_a(Entity, n114) :-
    is_a(Entity, n113).
is_a(Entity, i114) :-
    is_a(Entity, n113).
is_a(Entity, j114) :-
    is_a(Entity, n113).
is_a(Entity, n115) :-
    is_a(Entity, n114).
is_a(Entity, i115) :-
    is_a(Entity, n114).
is_a(Entity, j115) :-
    is_a(Entity, n114).
is_a(Entity, n116) :-
    is_a(Entity, n115).
is_a(Entity, i116) :-
    is_a(Entity, n115).
is_a(Entity, j116) :-
    is_a(Entity, n115).
is_a(Entity, n117) :-
    is_a(Entity, n116).
is_a(Entity, i117) :-
    is_a(Entity, n116).
is_a(Entity, j117) :-
    is_a(Entity, n116).
is_a(Entity, n118) :-
    is_a(Entity, n117).
is_a(Entity, i118) :-
    is_a(Entity, n117).
is_a(Entity, j118) :-
    is_a(Entity, n117).
is_a(Entity, n119) :-
    is_a(Entity, n118).
is_a(Entity, i119) :-
    is_a(Entity, n118).
is_a(Entity, j119) :-
    is_a(Entity, n118).
is_a(Entity, n120) :-
    is_a(Entity, n119).
is_a(Entity, i120) :-
    is_a(Entity, n119).
is_a(Entity, j120) :-
    is_a(Entity, n119).
is_a(Entity, n121) :-
    is_a(Entity, n120).
is_a(Entity, i121) :-
    is_a(Entity, n120).
is_a(Entity, j121) :-
    is_a(Entity, n120).
is_a(Entity, n122) :-
    is_a(Entity, n121).
is_a(Entity, i122) :-
    is_a(Entity, n121).
is_a(Entity, j122) :-
    is_a(Entity, n121).
is_a(Entity, n123) :-
    is_a(Entity, n122).
is_a(Entity, i123) :-
    is_a(Entity, n122).
is_a(Entity, j123) :-
    is_a(Entity, n122).
is_a(Entity, n124) :-
    is_a(Entity, n123).
is_a(Entity, i124) :-
    is_a(Entity, n123).
is_a(Entity, j124) :-
    is_a(Entity, n123).
is_a(Entity, n125) :-
    is_a(Entity, n124).
is_a(Entity, i125) :-
    is_a(Entity, n124).
is_a(Entity, j125) :-
    is_a(Entity, n124).
is_a(Entity, n126) :-
    is_a(Entity, n125).
is_a(Entity, i126) :-
    is_a(Entity, n125).
is_a(Entity, j126) :-
    is_a(Entity, n125).
is_a(Entity, n127) :-
    is_a(Entity, n126).
is_a(Entity, i127) :-
    is_a(Entity, n126).
is_a(Entity, j127) :-
    is_a(Entity, n126).
is_a(Entity, n128) :-
    is_a(Entity, n127).
is_a(Entity, i128) :-
    is_a(Entity, n127).
is_a(Entity, j128) :-
    is_a(Entity, n127).
is_a(Entity, n129) :-
    is_a(Entity, n128).
is_a(Entity, i129) :-
    is_a(Entity, n128).
is_a(Entity, j129) :-
    is_a(Entity, n128).
is_a(Entity, n130) :-
    is_a(Entity, n129).
is_a(Entity, i130) :-
    is_a(Entity, n129).
is_a(Entity, j130) :-
    is_a(Entity, n129).
is_a(Entity, n131) :-
    is_a(Entity, n130).
is_a(Entity, i131) :-
    is_a(Entity, n130).
is_a(Entity, j131) :-
    is_a(Entity, n130).
is_a(Entity, n132) :-
    is_a(Entity, n131).
is_a(Entity, i132) :-
    is_a(Entity, n131).
is_a(Entity, j132) :-
    is_a(Entity, n131).
is_a(Entity, n133) :-
    is_a(Entity, n132).
is_a(Entity, i133) :-
    is_a(Entity, n132).
is_a(Entity, j133) :-
    is_a(Entity, n132).
is_a(Entity, n134) :-
    is_a(Entity, n133).
is_a(Entity, i134) :-
    is_a(Entity, n133).
is_a(Entity, j134) :-
    is_a(Entity, n133).
is_a(Entity, n135) :-
    is_a(Entity, n134).
is_a(Entity, i135) :-
    is_a(Entity, n134).
is_a(Entity, j135) :-
    is_a(Entity, n134).
is_a(Entity, n136) :-
    is_a(Entity, n135).
is_a(Entity, i136) :-
    is_a(Entity, n135).
is_a(Entity, j136) :-
    is_a(Entity, n135).
is_a(Entity, n137) :-
    is_a(Entity, n136).
is_a(Entity, i137) :-
    is_a(Entity, n136).
is_a(Entity, j137) :-
    is_a(Entity, n136).
is_a(Entity, n138) :-
    is_a(Entity, n137).
is_a(Entity, i138) :-
    is_a(Entity, n137).
is_a(Entity, j138) :-
    is_a(Entity, n137).
is_a(Entity, n139) :-
    is_a(Entity, n138).
is_a(Entity, i139) :-
    is_a(Entity, n138).
is_a(Entity, j139) :-
    is_a(Entity, n138).
is_a(Entity, n140) :-
    is_a(Entity, n139).
is_a(Entity, i140) :-
    is_a(Entity, n139).
is_a(Entity, j140) :-
    is_a(Entity, n139).
is_a(Entity, n141) :-
    is_a(Entity, n140).
is_a(Entity, i141) :-
    is_a(Entity, n140).
is_a(Entity, j141) :-
    is_a(Entity, n140).
is_a(Entity, n142) :-
    is_a(Entity, n141).
is_a(Entity, i142) :-
    is_a(Entity, n141).
is_a(Entity, j142) :-
    is_a(Entity, n141).
is_a(Entity, n143) :-
    is_a(Entity, n142).
is_a(Entity, i143) :-
    is_a(Entity, n142).
is_a(Entity, j143) :-
    is_a(Entity, n142).
is_a(Entity, n144) :-
    is_a(Entity, n143).
is_a(Entity, i144) :-
    is_a(Entity, n143).
is_a(Entity, j144) :-
    is_a(Entity, n143).
is_a(Entity, n145) :-
    is_a(Entity, n144).
is_a(Entity, i145) :-
    is_a(Entity, n144).
is_a(Entity, j145) :-
    is_a(Entity, n144).
is_a(Entity, n146) :-
    is_a(Entity, n145).
is_a(Entity, i146) :-
    is_a(Entity, n145).
is_a(Entity, j146) :-
    is_a(Entity, n145).
is_a(Entity, n147) :-
    is_a(Entity, n146).
is_a(Entity, i147) :-
    is_a(Entity, n146).
is_a(Entity, j147) :-
    is_a(Entity, n146).
is_a(Entity, n148) :-
    is_a(Entity, n147).
is_a(Entity, i148) :-
    is_a(Entity, n147).
is_a(Entity, j148) :-
    is_a(Entity, n147).
is_a(Entity, n149) :-
    is_a(Entity, n148).
is_a(Entity, i149) :-
    is_a(Entity, n148).
is_a(Entity, j149) :-
    is_a(Entity, n148).
is_a(Entity, n150) :-
    is_a(Entity, n149).
is_a(Entity, i150) :-
    is_a(Entity, n149).
is_a(Entity, j150) :-
    is_a(Entity, n149).
is_a(Entity, n151) :-
    is_a(Entity, n150).
is_a(Entity, i151) :-
    is_a(Entity, n150).
is_a(Entity, j151) :-
    is_a(Entity, n150).
is_a(Entity, n152) :-
    is_a(Entity, n151).
is_a(Entity, i152) :-
    is_a(Entity, n151).
is_a(Entity, j152) :-
    is_a(Entity, n151).
is_a(Entity, n153) :-
    is_a(Entity, n152).
is_a(Entity, i153) :-
    is_a(Entity, n152).
is_a(Entity, j153) :-
    is_a(Entity, n152).
is_a(Entity, n154) :-
    is_a(Entity, n153).
is_a(Entity, i154) :-
    is_a(Entity, n153).
is_a(Entity, j154) :-
    is_a(Entity, n153).
is_a(Entity, n155) :-
    is_a(Entity, n154).
is_a(Entity, i155) :-
    is_a(Entity, n154).
is_a(Entity, j155) :-
    is_a(Entity, n154).
is_a(Entity, n156) :-
    is_a(Entity, n155).
is_a(Entity, i156) :-
    is_a(Entity, n155).
is_a(Entity, j156) :-
    is_a(Entity, n155).
is_a(Entity, n157) :-
    is_a(Entity, n156).
is_a(Entity, i157) :-
    is_a(Entity, n156).
is_a(Entity, j157) :-
    is_a(Entity, n156).
is_a(Entity, n158) :-
    is_a(Entity, n157).
is_a(Entity, i158) :-
    is_a(Entity, n157).
is_a(Entity, j158) :-
    is_a(Entity, n157).
is_a(Entity, n159) :-
    is_a(Entity, n158).
is_a(Entity, i159) :-
    is_a(Entity, n158).
is_a(Entity, j159) :-
    is_a(Entity, n158).
is_a(Entity, n160) :-
    is_a(Entity, n159).
is_a(Entity, i160) :-
    is_a(Entity, n159).
is_a(Entity, j160) :-
    is_a(Entity, n159).
is_a(Entity, n161) :-
    is_a(Entity, n160).
is_a(Entity, i161) :-
    is_a(Entity, n160).
is_a(Entity, j161) :-
    is_a(Entity, n160).
is_a(Entity, n162) :-
    is_a(Entity, n161).
is_a(Entity, i162) :-
    is_a(Entity, n161).
is_a(Entity, j162) :-
    is_a(Entity, n161).
is_a(Entity, n163) :-
    is_a(Entity, n162).
is_a(Entity, i163) :-
    is_a(Entity, n162).
is_a(Entity, j163) :-
    is_a(Entity, n162).
is_a(Entity, n164) :-
    is_a(Entity, n163).
is_a(Entity, i164) :-
    is_a(Entity, n163).
is_a(Entity, j164) :-
    is_a(Entity, n163).
is_a(Entity, n165) :-
    is_a(Entity, n164).
is_a(Entity, i165) :-
    is_a(Entity, n164).
is_a(Entity, j165) :-
    is_a(Entity, n164).
is_a(Entity, n166) :-
    is_a(Entity, n165).
is_a(Entity, i166) :-
    is_a(Entity, n165).
is_a(Entity, j166) :-
    is_a(Entity, n165).
is_a(Entity, n167) :-
    is_a(Entity, n166).
is_a(Entity, i167) :-
    is_a(Entity, n166).
is_a(Entity, j167) :-
    is_a(Entity, n166).
is_a(Entity, n168) :-
    is_a(Entity, n167).
is_a(Entity, i168) :-
    is_a(Entity, n167).
is_a(Entity, j168) :-
    is_a(Entity, n167).
is_a(Entity, n169) :-
    is_a(Entity, n168).
is_a(Entity, i169) :-
    is_a(Entity, n168).
is_a(Entity, j169) :-
    is_a(Entity, n168).
is_a(Entity, n170) :-
    is_a(Entity, n169).
is_a(Entity, i170) :-
    is_a(Entity, n169).
is_a(Entity, j170) :-
    is_a(Entity, n169).
is_a(Entity, n171) :-
    is_a(Entity, n170).
is_a(Entity, i171) :-
    is_a(Entity, n170).
is_a(Entity, j171) :-
    is_a(Entity, n170).
is_a(Entity, n172) :-
    is_a(Entity, n171).
is_a(Entity, i172) :-
    is_a(Entity, n171).
is_a(Entity, j172) :-
    is_a(Entity, n171).
is_a(Entity, n173) :-
    is_a(Entity, n172).
is_a(Entity, i173) :-
    is_a(Entity, n172).
is_a(Entity, j173) :-
    is_a(Entity, n172).
is_a(Entity, n174) :-
    is_a(Entity, n173).
is_a(Entity, i174) :-
    is_a(Entity, n173).
is_a(Entity, j174) :-
    is_a(Entity, n173).
is_a(Entity, n175) :-
    is_a(Entity, n174).
is_a(Entity, i175) :-
    is_a(Entity, n174).
is_a(Entity, j175) :-
    is_a(Entity, n174).
is_a(Entity, n176) :-
    is_a(Entity, n175).
is_a(Entity, i176) :-
    is_a(Entity, n175).
is_a(Entity, j176) :-
    is_a(Entity, n175).
is_a(Entity, n177) :-
    is_a(Entity, n176).
is_a(Entity, i177) :-
    is_a(Entity, n176).
is_a(Entity, j177) :-
    is_a(Entity, n176).
is_a(Entity, n178) :-
    is_a(Entity, n177).
is_a(Entity, i178) :-
    is_a(Entity, n177).
is_a(Entity, j178) :-
    is_a(Entity, n177).
is_a(Entity, n179) :-
    is_a(Entity, n178).
is_a(Entity, i179) :-
    is_a(Entity, n178).
is_a(Entity, j179) :-
    is_a(Entity, n178).
is_a(Entity, n180) :-
    is_a(Entity, n179).
is_a(Entity, i180) :-
    is_a(Entity, n179).
is_a(Entity, j180) :-
    is_a(Entity, n179).
is_a(Entity, n181) :-
    is_a(Entity, n180).
is_a(Entity, i181) :-
    is_a(Entity, n180).
is_a(Entity, j181) :-
    is_a(Entity, n180).
is_a(Entity, n182) :-
    is_a(Entity, n181).
is_a(Entity, i182) :-
    is_a(Entity, n181).
is_a(Entity, j182) :-
    is_a(Entity, n181).
is_a(Entity, n183) :-
    is_a(Entity, n182).
is_a(Entity, i183) :-
    is_a(Entity, n182).
is_a(Entity, j183) :-
    is_a(Entity, n182).
is_a(Entity, n184) :-
    is_a(Entity, n183).
is_a(Entity, i184) :-
    is_a(Entity, n183).
is_a(Entity, j184) :-
    is_a(Entity, n183).
is_a(Entity, n185) :-
    is_a(Entity, n184).
is_a(Entity, i185) :-
    is_a(Entity, n184).
is_a(Entity, j185) :-
    is_a(Entity, n184).
is_a(Entity, n186) :-
    is_a(Entity, n185).
is_a(Entity, i186) :-
    is_a(Entity, n185).
is_a(Entity, j186) :-
    is_a(Entity, n185).
is_a(Entity, n187) :-
    is_a(Entity, n186).
is_a(Entity, i187) :-
    is_a(Entity, n186).
is_a(Entity, j187) :-
    is_a(Entity, n186).
is_a(Entity, n188) :-
    is_a(Entity, n187).
is_a(Entity, i188) :-
    is_a(Entity, n187).
is_a(Entity, j188) :-
    is_a(Entity, n187).
is_a(Entity, n189) :-
    is_a(Entity, n188).
is_a(Entity, i189) :-
    is_a(Entity, n188).
is_a(Entity, j189) :-
    is_a(Entity, n188).
is_a(Entity, n190) :-
    is_a(Entity, n189).
is_a(Entity, i190) :-
    is_a(Entity, n189).
is_a(Entity, j190) :-
    is_a(Entity, n189).
is_a(Entity, n191) :-
    is_a(Entity, n190).
is_a(Entity, i191) :-
    is_a(Entity, n190).
is_a(Entity, j191) :-
    is_a(Entity, n190).
is_a(Entity, n192) :-
    is_a(Entity, n191).
is_a(Entity, i192) :-
    is_a(Entity, n191).
is_a(Entity, j192) :-
    is_a(Entity, n191).
is_a(Entity, n193) :-
    is_a(Entity, n192).
is_a(Entity, i193) :-
    is_a(Entity, n192).
is_a(Entity, j193) :-
    is_a(Entity, n192).
is_a(Entity, n194) :-
    is_a(Entity, n193).
is_a(Entity, i194) :-
    is_a(Entity, n193).
is_a(Entity, j194) :-
    is_a(Entity, n193).
is_a(Entity, n195) :-
    is_a(Entity, n194).
is_a(Entity, i195) :-
    is_a(Entity, n194).
is_a(Entity, j195) :-
    is_a(Entity, n194).
is_a(Entity, n196) :-
    is_a(Entity, n195).
is_a(Entity, i196) :-
    is_a(Entity, n195).
is_a(Entity, j196) :-
    is_a(Entity, n195).
is_a(Entity, n197) :-
    is_a(Entity, n196).
is_a(Entity, i197) :-
    is_a(Entity, n196).
is_a(Entity, j197) :-
    is_a(Entity, n196).
is_a(Entity, n198) :-
    is_a(Entity, n197).
is_a(Entity, i198) :-
    is_a(Entity, n197).
is_a(Entity, j198) :-
    is_a(Entity, n197).
is_a(Entity, n199) :-
    is_a(Entity, n198).
is_a(Entity, i199) :-
    is_a(Entity, n198).
is_a(Entity, j199) :-
    is_a(Entity, n198).
is_a(Entity, n200) :-
    is_a(Entity, n199).
is_a(Entity, i200) :-
    is_a(Entity, n199).
is_a(Entity, j200) :-
    is_a(Entity, n199).
is_a(Entity, n201) :-
    is_a(Entity, n200).
is_a(Entity, i201) :-
    is_a(Entity, n200).
is_a(Entity, j201) :-
    is_a(Entity, n200).
is_a(Entity, n202) :-
    is_a(Entity, n201).
is_a(Entity, i202) :-
    is_a(Entity, n201).
is_a(Entity, j202) :-
    is_a(Entity, n201).
is_a(Entity, n203) :-
    is_a(Entity, n202).
is_a(Entity, i203) :-
    is_a(Entity, n202).
is_a(Entity, j203) :-
    is_a(Entity, n202).
is_a(Entity, n204) :-
    is_a(Entity, n203).
is_a(Entity, i204) :-
    is_a(Entity, n203).
is_a(Entity, j204) :-
    is_a(Entity, n203).
is_a(Entity, n205) :-
    is_a(Entity, n204).
is_a(Entity, i205) :-
    is_a(Entity, n204).
is_a(Entity, j205) :-
    is_a(Entity, n204).
is_a(Entity, n206) :-
    is_a(Entity, n205).
is_a(Entity, i206) :-
    is_a(Entity, n205).
is_a(Entity, j206) :-
    is_a(Entity, n205).
is_a(Entity, n207) :-
    is_a(Entity, n206).
is_a(Entity, i207) :-
    is_a(Entity, n206).
is_a(Entity, j207) :-
    is_a(Entity, n206).
is_a(Entity, n208) :-
    is_a(Entity, n207).
is_a(Entity, i208) :-
    is_a(Entity, n207).
is_a(Entity, j208) :-
    is_a(Entity, n207).
is_a(Entity, n209) :-
    is_a(Entity, n208).
is_a(Entity, i209) :-
    is_a(Entity, n208).
is_a(Entity, j209) :-
    is_a(Entity, n208).
is_a(Entity, n210) :-
    is_a(Entity, n209).
is_a(Entity, i210) :-
    is_a(Entity, n209).
is_a(Entity, j210) :-
    is_a(Entity, n209).
is_a(Entity, n211) :-
    is_a(Entity, n210).
is_a(Entity, i211) :-
    is_a(Entity, n210).
is_a(Entity, j211) :-
    is_a(Entity, n210).
is_a(Entity, n212) :-
    is_a(Entity, n211).
is_a(Entity, i212) :-
    is_a(Entity, n211).
is_a(Entity, j212) :-
    is_a(Entity, n211).
is_a(Entity, n213) :-
    is_a(Entity, n212).
is_a(Entity, i213) :-
    is_a(Entity, n212).
is_a(Entity, j213) :-
    is_a(Entity, n212).
is_a(Entity, n214) :-
    is_a(Entity, n213).
is_a(Entity, i214) :-
    is_a(Entity, n213).
is_a(Entity, j214) :-
    is_a(Entity, n213).
is_a(Entity, n215) :-
    is_a(Entity, n214).
is_a(Entity, i215) :-
    is_a(Entity, n214).
is_a(Entity, j215) :-
    is_a(Entity, n214).
is_a(Entity, n216) :-
    is_a(Entity, n215).
is_a(Entity, i216) :-
    is_a(Entity, n215).
is_a(Entity, j216) :-
    is_a(Entity, n215).
is_a(Entity, n217) :-
    is_a(Entity, n216).
is_a(Entity, i217) :-
    is_a(Entity, n216).
is_a(Entity, j217) :-
    is_a(Entity, n216).
is_a(Entity, n218) :-
    is_a(Entity, n217).
is_a(Entity, i218) :-
    is_a(Entity, n217).
is_a(Entity, j218) :-
    is_a(Entity, n217).
is_a(Entity, n219) :-
    is_a(Entity, n218).
is_a(Entity, i219) :-
    is_a(Entity, n218).
is_a(Entity, j219) :-
    is_a(Entity, n218).
is_a(Entity, n220) :-
    is_a(Entity, n219).
is_a(Entity, i220) :-
    is_a(Entity, n219).
is_a(Entity, j220) :-
    is_a(Entity, n219).
is_a(Entity, n221) :-
    is_a(Entity, n220).
is_a(Entity, i221) :-
    is_a(Entity, n220).
is_a(Entity, j221) :-
    is_a(Entity, n220).
is_a(Entity, n222) :-
    is_a(Entity, n221).
is_a(Entity, i222) :-
    is_a(Entity, n221).
is_a(Entity, j222) :-
    is_a(Entity, n221).
is_a(Entity, n223) :-
    is_a(Entity, n222).
is_a(Entity, i223) :-
    is_a(Entity, n222).
is_a(Entity, j223) :-
    is_a(Entity, n222).
is_a(Entity, n224) :-
    is_a(Entity, n223).
is_a(Entity, i224) :-
    is_a(Entity, n223).
is_a(Entity, j224) :-
    is_a(Entity, n223).
is_a(Entity, n225) :-
    is_a(Entity, n224).
is_a(Entity, i225) :-
    is_a(Entity, n224).
is_a(Entity, j225) :-
    is_a(Entity, n224).
is_a(Entity, n226) :-
    is_a(Entity, n225).
is_a(Entity, i226) :-
    is_a(Entity, n225).
is_a(Entity, j226) :-
    is_a(Entity, n225).
is_a(Entity, n227) :-
    is_a(Entity, n226).
is_a(Entity, i227) :-
    is_a(Entity, n226).
is_a(Entity, j227) :-
    is_a(Entity, n226).
is_a(Entity, n228) :-
    is_a(Entity, n227).
is_a(Entity, i228) :-
    is_a(Entity, n227).
is_a(Entity, j228) :-
    is_a(Entity, n227).
is_a(Entity, n229) :-
    is_a(Entity, n228).
is_a(Entity, i229) :-
    is_a(Entity, n228).
is_a(Entity, j229) :-
    is_a(Entity, n228).
is_a(Entity, n230) :-
    is_a(Entity, n229).
is_a(Entity, i230) :-
    is_a(Entity, n229).
is_a(Entity, j230) :-
    is_a(Entity, n229).
is_a(Entity, n231) :-
    is_a(Entity, n230).
is_a(Entity, i231) :-
    is_a(Entity, n230).
is_a(Entity, j231) :-
    is_a(Entity, n230).
is_a(Entity, n232) :-
    is_a(Entity, n231).
is_a(Entity, i232) :-
    is_a(Entity, n231).
is_a(Entity, j232) :-
    is_a(Entity, n231).
is_a(Entity, n233) :-
    is_a(Entity, n232).
is_a(Entity, i233) :-
    is_a(Entity, n232).
is_a(Entity, j233) :-
    is_a(Entity, n232).
is_a(Entity, n234) :-
    is_a(Entity, n233).
is_a(Entity, i234) :-
    is_a(Entity, n233).
is_a(Entity, j234) :-
    is_a(Entity, n233).
is_a(Entity, n235) :-
    is_a(Entity, n234).
is_a(Entity, i235) :-
    is_a(Entity, n234).
is_a(Entity, j235) :-
    is_a(Entity, n234).
is_a(Entity, n236) :-
    is_a(Entity, n235).
is_a(Entity, i236) :-
    is_a(Entity, n235).
is_a(Entity, j236) :-
    is_a(Entity, n235).
is_a(Entity, n237) :-
    is_a(Entity, n236).
is_a(Entity, i237) :-
    is_a(Entity, n236).
is_a(Entity, j237) :-
    is_a(Entity, n236).
is_a(Entity, n238) :-
    is_a(Entity, n237).
is_a(Entity, i238) :-
    is_a(Entity, n237).
is_a(Entity, j238) :-
    is_a(Entity, n237).
is_a(Entity, n239) :-
    is_a(Entity, n238).
is_a(Entity, i239) :-
    is_a(Entity, n238).
is_a(Entity, j239) :-
    is_a(Entity, n238).
is_a(Entity, n240) :-
    is_a(Entity, n239).
is_a(Entity, i240) :-
    is_a(Entity, n239).
is_a(Entity, j240) :-
    is_a(Entity, n239).
is_a(Entity, n241) :-
    is_a(Entity, n240).
is_a(Entity, i241) :-
    is_a(Entity, n240).
is_a(Entity, j241) :-
    is_a(Entity, n240).
is_a(Entity, n242) :-
    is_a(Entity, n241).
is_a(Entity, i242) :-
    is_a(Entity, n241).
is_a(Entity, j242) :-
    is_a(Entity, n241).
is_a(Entity, n243) :-
    is_a(Entity, n242).
is_a(Entity, i243) :-
    is_a(Entity, n242).
is_a(Entity, j243) :-
    is_a(Entity, n242).
is_a(Entity, n244) :-
    is_a(Entity, n243).
is_a(Entity, i244) :-
    is_a(Entity, n243).
is_a(Entity, j244) :-
    is_a(Entity, n243).
is_a(Entity, n245) :-
    is_a(Entity, n244).
is_a(Entity, i245) :-
    is_a(Entity, n244).
is_a(Entity, j245) :-
    is_a(Entity, n244).
is_a(Entity, n246) :-
    is_a(Entity, n245).
is_a(Entity, i246) :-
    is_a(Entity, n245).
is_a(Entity, j246) :-
    is_a(Entity, n245).
is_a(Entity, n247) :-
    is_a(Entity, n246).
is_a(Entity, i247) :-
    is_a(Entity, n246).
is_a(Entity, j247) :-
    is_a(Entity, n246).
is_a(Entity, n248) :-
    is_a(Entity, n247).
is_a(Entity, i248) :-
    is_a(Entity, n247).
is_a(Entity, j248) :-
    is_a(Entity, n247).
is_a(Entity, n249) :-
    is_a(Entity, n248).
is_a(Entity, i249) :-
    is_a(Entity, n248).
is_a(Entity, j249) :-
    is_a(Entity, n248).
is_a(Entity, n250) :-
    is_a(Entity, n249).
is_a(Entity, i250) :-
    is_a(Entity, n249).
is_a(Entity, j250) :-
    is_a(Entity, n249).
is_a(Entity, n251) :-
    is_a(Entity, n250).
is_a(Entity, i251) :-
    is_a(Entity, n250).
is_a(Entity, j251) :-
    is_a(Entity, n250).
is_a(Entity, n252) :-
    is_a(Entity, n251).
is_a(Entity, i252) :-
    is_a(Entity, n251).
is_a(Entity, j252) :-
    is_a(Entity, n251).
is_a(Entity, n253) :-
    is_a(Entity, n252).
is_a(Entity, i253) :-
    is_a(Entity, n252).
is_a(Entity, j253) :-
    is_a(Entity, n252).
is_a(Entity, n254) :-
    is_a(Entity, n253).
is_a(Entity, i254) :-
    is_a(Entity, n253).
is_a(Entity, j254) :-
    is_a(Entity, n253).
is_a(Entity, n255) :-
    is_a(Entity, n254).
is_a(Entity, i255) :-
    is_a(Entity, n254).
is_a(Entity, j255) :-
    is_a(Entity, n254).
is_a(Entity, n256) :-
    is_a(Entity, n255).
is_a(Entity, i256) :-
    is_a(Entity, n255).
is_a(Entity, j256) :-
    is_a(Entity, n255).
is_a(Entity, n257) :-
    is_a(Entity, n256).
is_a(Entity, i257) :-
    is_a(Entity, n256).
is_a(Entity, j257) :-
    is_a(Entity, n256).
is_a(Entity, n258) :-
    is_a(Entity, n257).
is_a(Entity, i258) :-
    is_a(Entity, n257).
is_a(Entity, j258) :-
    is_a(Entity, n257).
is_a(Entity, n259) :-
    is_a(Entity, n258).
is_a(Entity, i259) :-
    is_a(Entity, n258).
is_a(Entity, j259) :-
    is_a(Entity, n258).
is_a(Entity, n260) :-
    is_a(Entity, n259).
is_a(Entity, i260) :-
    is_a(Entity, n259).
is_a(Entity, j260) :-
    is_a(Entity, n259).
is_a(Entity, n261) :-
    is_a(Entity, n260).
is_a(Entity, i261) :-
    is_a(Entity, n260).
is_a(Entity, j261) :-
    is_a(Entity, n260).
is_a(Entity, n262) :-
    is_a(Entity, n261).
is_a(Entity, i262) :-
    is_a(Entity, n261).
is_a(Entity, j262) :-
    is_a(Entity, n261).
is_a(Entity, n263) :-
    is_a(Entity, n262).
is_a(Entity, i263) :-
    is_a(Entity, n262).
is_a(Entity, j263) :-
    is_a(Entity, n262).
is_a(Entity, n264) :-
    is_a(Entity, n263).
is_a(Entity, i264) :-
    is_a(Entity, n263).
is_a(Entity, j264) :-
    is_a(Entity, n263).
is_a(Entity, n265) :-
    is_a(Entity, n264).
is_a(Entity, i265) :-
    is_a(Entity, n264).
is_a(Entity, j265) :-
    is_a(Entity, n264).
is_a(Entity, n266) :-
    is_a(Entity, n265).
is_a(Entity, i266) :-
    is_a(Entity, n265).
is_a(Entity, j266) :-
    is_a(Entity, n265).
is_a(Entity, n267) :-
    is_a(Entity, n266).
is_a(Entity, i267) :-
    is_a(Entity, n266).
is_a(Entity, j267) :-
    is_a(Entity, n266).
is_a(Entity, n268) :-
    is_a(Entity, n267).
is_a(Entity, i268) :-
    is_a(Entity, n267).
is_a(Entity, j268) :-
    is_a(Entity, n267).
is_a(Entity, n269) :-
    is_a(Entity, n268).
is_a(Entity, i269) :-
    is_a(Entity, n268).
is_a(Entity, j269) :-
    is_a(Entity, n268).
is_a(Entity, n270) :-
    is_a(Entity, n269).
is_a(Entity, i270) :-
    is_a(Entity, n269).
is_a(Entity, j270) :-
    is_a(Entity, n269).
is_a(Entity, n271) :-
    is_a(Entity, n270).
is_a(Entity, i271) :-
    is_a(Entity, n270).
is_a(Entity, j271) :-
    is_a(Entity, n270).
is_a(Entity, n272) :-
    is_a(Entity, n271).
is_a(Entity, i272) :-
    is_a(Entity, n271).
is_a(Entity, j272) :-
    is_a(Entity, n271).
is_a(Entity, n273) :-
    is_a(Entity, n272).
is_a(Entity, i273) :-
    is_a(Entity, n272).
is_a(Entity, j273) :-
    is_a(Entity, n272).
is_a(Entity, n274) :-
    is_a(Entity, n273).
is_a(Entity, i274) :-
    is_a(Entity, n273).
is_a(Entity, j274) :-
    is_a(Entity, n273).
is_a(Entity, n275) :-
    is_a(Entity, n274).
is_a(Entity, i275) :-
    is_a(Entity, n274).
is_a(Entity, j275) :-
    is_a(Entity, n274).
is_a(Entity, n276) :-
    is_a(Entity, n275).
is_a(Entity, i276) :-
    is_a(Entity, n275).
is_a(Entity, j276) :-
    is_a(Entity, n275).
is_a(Entity, n277) :-
    is_a(Entity, n276).
is_a(Entity, i277) :-
    is_a(Entity, n276).
is_a(Entity, j277) :-
    is_a(Entity, n276).
is_a(Entity, n278) :-
    is_a(Entity, n277).
is_a(Entity, i278) :-
    is_a(Entity, n277).
is_a(Entity, j278) :-
    is_a(Entity, n277).
is_a(Entity, n279) :-
    is_a(Entity, n278).
is_a(Entity, i279) :-
    is_a(Entity, n278).
is_a(Entity, j279) :-
    is_a(Entity, n278).
is_a(Entity, n280) :-
    is_a(Entity, n279).
is_a(Entity, i280) :-
    is_a(Entity, n279).
is_a(Entity, j280) :-
    is_a(Entity, n279).
is_a(Entity, n281) :-
    is_a(Entity, n280).
is_a(Entity, i281) :-
    is_a(Entity, n280).
is_a(Entity, j281) :-
    is_a(Entity, n280).
is_a(Entity, n282) :-
    is_a(Entity, n281).
is_a(Entity, i282) :-
    is_a(Entity, n281).
is_a(Entity, j282) :-
    is_a(Entity, n281).
is_a(Entity, n283) :-
    is_a(Entity, n282).
is_a(Entity, i283) :-
    is_a(Entity, n282).
is_a(Entity, j283) :-
    is_a(Entity, n282).
is_a(Entity, n284) :-
    is_a(Entity, n283).
is_a(Entity, i284) :-
    is_a(Entity, n283).
is_a(Entity, j284) :-
    is_a(Entity, n283).
is_a(Entity, n285) :-
    is_a(Entity, n284).
is_a(Entity, i285) :-
    is_a(Entity, n284).
is_a(Entity, j285) :-
    is_a(Entity, n284).
is_a(Entity, n286) :-
    is_a(Entity, n285).
is_a(Entity, i286) :-
    is_a(Entity, n285).
is_a(Entity, j286) :-
    is_a(Entity, n285).
is_a(Entity, n287) :-
    is_a(Entity, n286).
is_a(Entity, i287) :-
    is_a(Entity, n286).
is_a(Entity, j287) :-
    is_a(Entity, n286).
is_a(Entity, n288) :-
    is_a(Entity, n287).
is_a(Entity, i288) :-
    is_a(Entity, n287).
is_a(Entity, j288) :-
    is_a(Entity, n287).
is_a(Entity, n289) :-
    is_a(Entity, n288).
is_a(Entity, i289) :-
    is_a(Entity, n288).
is_a(Entity, j289) :-
    is_a(Entity, n288).
is_a(Entity, n290) :-
    is_a(Entity, n289).
is_a(Entity, i290) :-
    is_a(Entity, n289).
is_a(Entity, j290) :-
    is_a(Entity, n289).
is_a(Entity, n291) :-
    is_a(Entity, n290).
is_a(Entity, i291) :-
    is_a(Entity, n290).
is_a(Entity, j291) :-
    is_a(Entity, n290).
is_a(Entity, n292) :-
    is_a(Entity, n291).
is_a(Entity, i292) :-
    is_a(Entity, n291).
is_a(Entity, j292) :-
    is_a(Entity, n291).
is_a(Entity, n293) :-
    is_a(Entity, n292).
is_a(Entity, i293) :-
    is_a(Entity, n292).
is_a(Entity, j293) :-
    is_a(Entity, n292).
is_a(Entity, n294) :-
    is_a(Entity, n293).
is_a(Entity, i294) :-
    is_a(Entity, n293).
is_a(Entity, j294) :-
    is_a(Entity, n293).
is_a(Entity, n295) :-
    is_a(Entity, n294).
is_a(Entity, i295) :-
    is_a(Entity, n294).
is_a(Entity, j295) :-
    is_a(Entity, n294).
is_a(Entity, n296) :-
    is_a(Entity, n295).
is_a(Entity, i296) :-
    is_a(Entity, n295).
is_a(Entity, j296) :-
    is_a(Entity, n295).
is_a(Entity, n297) :-
    is_a(Entity, n296).
is_a(Entity, i297) :-
    is_a(Entity, n296).
is_a(Entity, j297) :-
    is_a(Entity, n296).
is_a(Entity, n298) :-
    is_a(Entity, n297).
is_a(Entity, i298) :-
    is_a(Entity, n297).
is_a(Entity, j298) :-
    is_a(Entity, n297).
is_a(Entity, n299) :-
    is_a(Entity, n298).
is_a(Entity, i299) :-
    is_a(Entity, n298).
is_a(Entity, j299) :-
    is_a(Entity, n298).
is_a(Entity, n300) :-
    is_a(Entity, n299).
is_a(Entity, i300) :-
    is_a(Entity, n299).
is_a(Entity, j300) :-
    is_a(Entity, n299).
is_a(Entity, n301) :-
    is_a(Entity, n300).
is_a(Entity, i301) :-
    is_a(Entity, n300).
is_a(Entity, j301) :-
    is_a(Entity, n300).
is_a(Entity, n302) :-
    is_a(Entity, n301).
is_a(Entity, i302) :-
    is_a(Entity, n301).
is_a(Entity, j302) :-
    is_a(Entity, n301).
is_a(Entity, n303) :-
    is_a(Entity, n302).
is_a(Entity, i303) :-
    is_a(Entity, n302).
is_a(Entity, j303) :-
    is_a(Entity, n302).
is_a(Entity, n304) :-
    is_a(Entity, n303).
is_a(Entity, i304) :-
    is_a(Entity, n303).
is_a(Entity, j304) :-
    is_a(Entity, n303).
is_a(Entity, n305) :-
    is_a(Entity, n304).
is_a(Entity, i305) :-
    is_a(Entity, n304).
is_a(Entity, j305) :-
    is_a(Entity, n304).
is_a(Entity, n306) :-
    is_a(Entity, n305).
is_a(Entity, i306) :-
    is_a(Entity, n305).
is_a(Entity, j306) :-
    is_a(Entity, n305).
is_a(Entity, n307) :-
    is_a(Entity, n306).
is_a(Entity, i307) :-
    is_a(Entity, n306).
is_a(Entity, j307) :-
    is_a(Entity, n306).
is_a(Entity, n308) :-
    is_a(Entity, n307).
is_a(Entity, i308) :-
    is_a(Entity, n307).
is_a(Entity, j308) :-
    is_a(Entity, n307).
is_a(Entity, n309) :-
    is_a(Entity, n308).
is_a(Entity, i309) :-
    is_a(Entity, n308).
is_a(Entity, j309) :-
    is_a(Entity, n308).
is_a(Entity, n310) :-
    is_a(Entity, n309).
is_a(Entity, i310) :-
    is_a(Entity, n309).
is_a(Entity, j310) :-
    is_a(Entity, n309).
is_a(Entity, n311) :-
    is_a(Entity, n310).
is_a(Entity, i311) :-
    is_a(Entity, n310).
is_a(Entity, j311) :-
    is_a(Entity, n310).
is_a(Entity, n312) :-
    is_a(Entity, n311).
is_a(Entity, i312) :-
    is_a(Entity, n311).
is_a(Entity, j312) :-
    is_a(Entity, n311).
is_a(Entity, n313) :-
    is_a(Entity, n312).
is_a(Entity, i313) :-
    is_a(Entity, n312).
is_a(Entity, j313) :-
    is_a(Entity, n312).
is_a(Entity, n314) :-
    is_a(Entity, n313).
is_a(Entity, i314) :-
    is_a(Entity, n313).
is_a(Entity, j314) :-
    is_a(Entity, n313).
is_a(Entity, n315) :-
    is_a(Entity, n314).
is_a(Entity, i315) :-
    is_a(Entity, n314).
is_a(Entity, j315) :-
    is_a(Entity, n314).
is_a(Entity, n316) :-
    is_a(Entity, n315).
is_a(Entity, i316) :-
    is_a(Entity, n315).
is_a(Entity, j316) :-
    is_a(Entity, n315).
is_a(Entity, n317) :-
    is_a(Entity, n316).
is_a(Entity, i317) :-
    is_a(Entity, n316).
is_a(Entity, j317) :-
    is_a(Entity, n316).
is_a(Entity, n318) :-
    is_a(Entity, n317).
is_a(Entity, i318) :-
    is_a(Entity, n317).
is_a(Entity, j318) :-
    is_a(Entity, n317).
is_a(Entity, n319) :-
    is_a(Entity, n318).
is_a(Entity, i319) :-
    is_a(Entity, n318).
is_a(Entity, j319) :-
    is_a(Entity, n318).
is_a(Entity, n320) :-
    is_a(Entity, n319).
is_a(Entity, i320) :-
    is_a(Entity, n319).
is_a(Entity, j320) :-
    is_a(Entity, n319).
is_a(Entity, n321) :-
    is_a(Entity, n320).
is_a(Entity, i321) :-
    is_a(Entity, n320).
is_a(Entity, j321) :-
    is_a(Entity, n320).
is_a(Entity, n322) :-
    is_a(Entity, n321).
is_a(Entity, i322) :-
    is_a(Entity, n321).
is_a(Entity, j322) :-
    is_a(Entity, n321).
is_a(Entity, n323) :-
    is_a(Entity, n322).
is_a(Entity, i323) :-
    is_a(Entity, n322).
is_a(Entity, j323) :-
    is_a(Entity, n322).
is_a(Entity, n324) :-
    is_a(Entity, n323).
is_a(Entity, i324) :-
    is_a(Entity, n323).
is_a(Entity, j324) :-
    is_a(Entity, n323).
is_a(Entity, n325) :-
    is_a(Entity, n324).
is_a(Entity, i325) :-
    is_a(Entity, n324).
is_a(Entity, j325) :-
    is_a(Entity, n324).
is_a(Entity, n326) :-
    is_a(Entity, n325).
is_a(Entity, i326) :-
    is_a(Entity, n325).
is_a(Entity, j326) :-
    is_a(Entity, n325).
is_a(Entity, n327) :-
    is_a(Entity, n326).
is_a(Entity, i327) :-
    is_a(Entity, n326).
is_a(Entity, j327) :-
    is_a(Entity, n326).
is_a(Entity, n328) :-
    is_a(Entity, n327).
is_a(Entity, i328) :-
    is_a(Entity, n327).
is_a(Entity, j328) :-
    is_a(Entity, n327).
is_a(Entity, n329) :-
    is_a(Entity, n328).
is_a(Entity, i329) :-
    is_a(Entity, n328).
is_a(Entity, j329) :-
    is_a(Entity, n328).
is_a(Entity, n330) :-
    is_a(Entity, n329).
is_a(Entity, i330) :-
    is_a(Entity, n329).
is_a(Entity, j330) :-
    is_a(Entity, n329).
is_a(Entity, n331) :-
    is_a(Entity, n330).
is_a(Entity, i331) :-
    is_a(Entity, n330).
is_a(Entity, j331) :-
    is_a(Entity, n330).
is_a(Entity, n332) :-
    is_a(Entity, n331).
is_a(Entity, i332) :-
    is_a(Entity, n331).
is_a(Entity, j332) :-
    is_a(Entity, n331).
is_a(Entity, n333) :-
    is_a(Entity, n332).
is_a(Entity, i333) :-
    is_a(Entity, n332).
is_a(Entity, j333) :-
    is_a(Entity, n332).
is_a(Entity, n334) :-
    is_a(Entity, n333).
is_a(Entity, i334) :-
    is_a(Entity, n333).
is_a(Entity, j334) :-
    is_a(Entity, n333).
is_a(Entity, n335) :-
    is_a(Entity, n334).
is_a(Entity, i335) :-
    is_a(Entity, n334).
is_a(Entity, j335) :-
    is_a(Entity, n334).
is_a(Entity, n336) :-
    is_a(Entity, n335).
is_a(Entity, i336) :-
    is_a(Entity, n335).
is_a(Entity, j336) :-
    is_a(Entity, n335).
is_a(Entity, n337) :-
    is_a(Entity, n336).
is_a(Entity, i337) :-
    is_a(Entity, n336).
is_a(Entity, j337) :-
    is_a(Entity, n336).
is_a(Entity, n338) :-
    is_a(Entity, n337).
is_a(Entity, i338) :-
    is_a(Entity, n337).
is_a(Entity, j338) :-
    is_a(Entity, n337).
is_a(Entity, n339) :-
    is_a(Entity, n338).
is_a(Entity, i339) :-
    is_a(Entity, n338).
is_a(Entity, j339) :-
    is_a(Entity, n338).
is_a(Entity, n340) :-
    is_a(Entity, n339).
is_a(Entity, i340) :-
    is_a(Entity, n339).
is_a(Entity, j340) :-
    is_a(Entity, n339).
is_a(Entity, n341) :-
    is_a(Entity, n340).
is_a(Entity, i341) :-
    is_a(Entity, n340).
is_a(Entity, j341) :-
    is_a(Entity, n340).
is_a(Entity, n342) :-
    is_a(Entity, n341).
is_a(Entity, i342) :-
    is_a(Entity, n341).
is_a(Entity, j342) :-
    is_a(Entity, n341).
is_a(Entity, n343) :-
    is_a(Entity, n342).
is_a(Entity, i343) :-
    is_a(Entity, n342).
is_a(Entity, j343) :-
    is_a(Entity, n342).
is_a(Entity, n344) :-
    is_a(Entity, n343).
is_a(Entity, i344) :-
    is_a(Entity, n343).
is_a(Entity, j344) :-
    is_a(Entity, n343).
is_a(Entity, n345) :-
    is_a(Entity, n344).
is_a(Entity, i345) :-
    is_a(Entity, n344).
is_a(Entity, j345) :-
    is_a(Entity, n344).
is_a(Entity, n346) :-
    is_a(Entity, n345).
is_a(Entity, i346) :-
    is_a(Entity, n345).
is_a(Entity, j346) :-
    is_a(Entity, n345).
is_a(Entity, n347) :-
    is_a(Entity, n346).
is_a(Entity, i347) :-
    is_a(Entity, n346).
is_a(Entity, j347) :-
    is_a(Entity, n346).
is_a(Entity, n348) :-
    is_a(Entity, n347).
is_a(Entity, i348) :-
    is_a(Entity, n347).
is_a(Entity, j348) :-
    is_a(Entity, n347).
is_a(Entity, n349) :-
    is_a(Entity, n348).
is_a(Entity, i349) :-
    is_a(Entity, n348).
is_a(Entity, j349) :-
    is_a(Entity, n348).
is_a(Entity, n350) :-
    is_a(Entity, n349).
is_a(Entity, i350) :-
    is_a(Entity, n349).
is_a(Entity, j350) :-
    is_a(Entity, n349).
is_a(Entity, n351) :-
    is_a(Entity, n350).
is_a(Entity, i351) :-
    is_a(Entity, n350).
is_a(Entity, j351) :-
    is_a(Entity, n350).
is_a(Entity, n352) :-
    is_a(Entity, n351).
is_a(Entity, i352) :-
    is_a(Entity, n351).
is_a(Entity, j352) :-
    is_a(Entity, n351).
is_a(Entity, n353) :-
    is_a(Entity, n352).
is_a(Entity, i353) :-
    is_a(Entity, n352).
is_a(Entity, j353) :-
    is_a(Entity, n352).
is_a(Entity, n354) :-
    is_a(Entity, n353).
is_a(Entity, i354) :-
    is_a(Entity, n353).
is_a(Entity, j354) :-
    is_a(Entity, n353).
is_a(Entity, n355) :-
    is_a(Entity, n354).
is_a(Entity, i355) :-
    is_a(Entity, n354).
is_a(Entity, j355) :-
    is_a(Entity, n354).
is_a(Entity, n356) :-
    is_a(Entity, n355).
is_a(Entity, i356) :-
    is_a(Entity, n355).
is_a(Entity, j356) :-
    is_a(Entity, n355).
is_a(Entity, n357) :-
    is_a(Entity, n356).
is_a(Entity, i357) :-
    is_a(Entity, n356).
is_a(Entity, j357) :-
    is_a(Entity, n356).
is_a(Entity, n358) :-
    is_a(Entity, n357).
is_a(Entity, i358) :-
    is_a(Entity, n357).
is_a(Entity, j358) :-
    is_a(Entity, n357).
is_a(Entity, n359) :-
    is_a(Entity, n358).
is_a(Entity, i359) :-
    is_a(Entity, n358).
is_a(Entity, j359) :-
    is_a(Entity, n358).
is_a(Entity, n360) :-
    is_a(Entity, n359).
is_a(Entity, i360) :-
    is_a(Entity, n359).
is_a(Entity, j360) :-
    is_a(Entity, n359).
is_a(Entity, n361) :-
    is_a(Entity, n360).
is_a(Entity, i361) :-
    is_a(Entity, n360).
is_a(Entity, j361) :-
    is_a(Entity, n360).
is_a(Entity, n362) :-
    is_a(Entity, n361).
is_a(Entity, i362) :-
    is_a(Entity, n361).
is_a(Entity, j362) :-
    is_a(Entity, n361).
is_a(Entity, n363) :-
    is_a(Entity, n362).
is_a(Entity, i363) :-
    is_a(Entity, n362).
is_a(Entity, j363) :-
    is_a(Entity, n362).
is_a(Entity, n364) :-
    is_a(Entity, n363).
is_a(Entity, i364) :-
    is_a(Entity, n363).
is_a(Entity, j364) :-
    is_a(Entity, n363).
is_a(Entity, n365) :-
    is_a(Entity, n364).
is_a(Entity, i365) :-
    is_a(Entity, n364).
is_a(Entity, j365) :-
    is_a(Entity, n364).
is_a(Entity, n366) :-
    is_a(Entity, n365).
is_a(Entity, i366) :-
    is_a(Entity, n365).
is_a(Entity, j366) :-
    is_a(Entity, n365).
is_a(Entity, n367) :-
    is_a(Entity, n366).
is_a(Entity, i367) :-
    is_a(Entity, n366).
is_a(Entity, j367) :-
    is_a(Entity, n366).
is_a(Entity, n368) :-
    is_a(Entity, n367).
is_a(Entity, i368) :-
    is_a(Entity, n367).
is_a(Entity, j368) :-
    is_a(Entity, n367).
is_a(Entity, n369) :-
    is_a(Entity, n368).
is_a(Entity, i369) :-
    is_a(Entity, n368).
is_a(Entity, j369) :-
    is_a(Entity, n368).
is_a(Entity, n370) :-
    is_a(Entity, n369).
is_a(Entity, i370) :-
    is_a(Entity, n369).
is_a(Entity, j370) :-
    is_a(Entity, n369).
is_a(Entity, n371) :-
    is_a(Entity, n370).
is_a(Entity, i371) :-
    is_a(Entity, n370).
is_a(Entity, j371) :-
    is_a(Entity, n370).
is_a(Entity, n372) :-
    is_a(Entity, n371).
is_a(Entity, i372) :-
    is_a(Entity, n371).
is_a(Entity, j372) :-
    is_a(Entity, n371).
is_a(Entity, n373) :-
    is_a(Entity, n372).
is_a(Entity, i373) :-
    is_a(Entity, n372).
is_a(Entity, j373) :-
    is_a(Entity, n372).
is_a(Entity, n374) :-
    is_a(Entity, n373).
is_a(Entity, i374) :-
    is_a(Entity, n373).
is_a(Entity, j374) :-
    is_a(Entity, n373).
is_a(Entity, n375) :-
    is_a(Entity, n374).
is_a(Entity, i375) :-
    is_a(Entity, n374).
is_a(Entity, j375) :-
    is_a(Entity, n374).
is_a(Entity, n376) :-
    is_a(Entity, n375).
is_a(Entity, i376) :-
    is_a(Entity, n375).
is_a(Entity, j376) :-
    is_a(Entity, n375).
is_a(Entity, n377) :-
    is_a(Entity, n376).
is_a(Entity, i377) :-
    is_a(Entity, n376).
is_a(Entity, j377) :-
    is_a(Entity, n376).
is_a(Entity, n378) :-
    is_a(Entity, n377).
is_a(Entity, i378) :-
    is_a(Entity, n377).
is_a(Entity, j378) :-
    is_a(Entity, n377).
is_a(Entity, n379) :-
    is_a(Entity, n378).
is_a(Entity, i379) :-
    is_a(Entity, n378).
is_a(Entity, j379) :-
    is_a(Entity, n378).
is_a(Entity, n380) :-
    is_a(Entity, n379).
is_a(Entity, i380) :-
    is_a(Entity, n379).
is_a(Entity, j380) :-
    is_a(Entity, n379).
is_a(Entity, n381) :-
    is_a(Entity, n380).
is_a(Entity, i381) :-
    is_a(Entity, n380).
is_a(Entity, j381) :-
    is_a(Entity, n380).
is_a(Entity, n382) :-
    is_a(Entity, n381).
is_a(Entity, i382) :-
    is_a(Entity, n381).
is_a(Entity, j382) :-
    is_a(Entity, n381).
is_a(Entity, n383) :-
    is_a(Entity, n382).
is_a(Entity, i383) :-
    is_a(Entity, n382).
is_a(Entity, j383) :-
    is_a(Entity, n382).
is_a(Entity, n384) :-
    is_a(Entity, n383).
is_a(Entity, i384) :-
    is_a(Entity, n383).
is_a(Entity, j384) :-
    is_a(Entity, n383).
is_a(Entity, n385) :-
    is_a(Entity, n384).
is_a(Entity, i385) :-
    is_a(Entity, n384).
is_a(Entity, j385) :-
    is_a(Entity, n384).
is_a(Entity, n386) :-
    is_a(Entity, n385).
is_a(Entity, i386) :-
    is_a(Entity, n385).
is_a(Entity, j386) :-
    is_a(Entity, n385).
is_a(Entity, n387) :-
    is_a(Entity, n386).
is_a(Entity, i387) :-
    is_a(Entity, n386).
is_a(Entity, j387) :-
    is_a(Entity, n386).
is_a(Entity, n388) :-
    is_a(Entity, n387).
is_a(Entity, i388) :-
    is_a(Entity, n387).
is_a(Entity, j388) :-
    is_a(Entity, n387).
is_a(Entity, n389) :-
    is_a(Entity, n388).
is_a(Entity, i389) :-
    is_a(Entity, n388).
is_a(Entity, j389) :-
    is_a(Entity, n388).
is_a(Entity, n390) :-
    is_a(Entity, n389).
is_a(Entity, i390) :-
    is_a(Entity, n389).
is_a(Entity, j390) :-
    is_a(Entity, n389).
is_a(Entity, n391) :-
    is_a(Entity, n390).
is_a(Entity, i391) :-
    is_a(Entity, n390).
is_a(Entity, j391) :-
    is_a(Entity, n390).
is_a(Entity, n392) :-
    is_a(Entity, n391).
is_a(Entity, i392) :-
    is_a(Entity, n391).
is_a(Entity, j392) :-
    is_a(Entity, n391).
is_a(Entity, n393) :-
    is_a(Entity, n392).
is_a(Entity, i393) :-
    is_a(Entity, n392).
is_a(Entity, j393) :-
    is_a(Entity, n392).
is_a(Entity, n394) :-
    is_a(Entity, n393).
is_a(Entity, i394) :-
    is_a(Entity, n393).
is_a(Entity, j394) :-
    is_a(Entity, n393).
is_a(Entity, n395) :-
    is_a(Entity, n394).
is_a(Entity, i395) :-
    is_a(Entity, n394).
is_a(Entity, j395) :-
    is_a(Entity, n394).
is_a(Entity, n396) :-
    is_a(Entity, n395).
is_a(Entity, i396) :-
    is_a(Entity, n395).
is_a(Entity, j396) :-
    is_a(Entity, n395).
is_a(Entity, n397) :-
    is_a(Entity, n396).
is_a(Entity, i397) :-
    is_a(Entity, n396).
is_a(Entity, j397) :-
    is_a(Entity, n396).
is_a(Entity, n398) :-
    is_a(Entity, n397).
is_a(Entity, i398) :-
    is_a(Entity, n397).
is_a(Entity, j398) :-
    is_a(Entity, n397).
is_a(Entity, n399) :-
    is_a(Entity, n398).
is_a(Entity, i399) :-
    is_a(Entity, n398).
is_a(Entity, j399) :-
    is_a(Entity, n398).
is_a(Entity, n400) :-
    is_a(Entity, n399).
is_a(Entity, i400) :-
    is_a(Entity, n399).
is_a(Entity, j400) :-
    is_a(Entity, n399).
is_a(Entity, n401) :-
    is_a(Entity, n400).
is_a(Entity, i401) :-
    is_a(Entity, n400).
is_a(Entity, j401) :-
    is_a(Entity, n400).
is_a(Entity, n402) :-
    is_a(Entity, n401).
is_a(Entity, i402) :-
    is_a(Entity, n401).
is_a(Entity, j402) :-
    is_a(Entity, n401).
is_a(Entity, n403) :-
    is_a(Entity, n402).
is_a(Entity, i403) :-
    is_a(Entity, n402).
is_a(Entity, j403) :-
    is_a(Entity, n402).
is_a(Entity, n404) :-
    is_a(Entity, n403).
is_a(Entity, i404) :-
    is_a(Entity, n403).
is_a(Entity, j404) :-
    is_a(Entity, n403).
is_a(Entity, n405) :-
    is_a(Entity, n404).
is_a(Entity, i405) :-
    is_a(Entity, n404).
is_a(Entity, j405) :-
    is_a(Entity, n404).
is_a(Entity, n406) :-
    is_a(Entity, n405).
is_a(Entity, i406) :-
    is_a(Entity, n405).
is_a(Entity, j406) :-
    is_a(Entity, n405).
is_a(Entity, n407) :-
    is_a(Entity, n406).
is_a(Entity, i407) :-
    is_a(Entity, n406).
is_a(Entity, j407) :-
    is_a(Entity, n406).
is_a(Entity, n408) :-
    is_a(Entity, n407).
is_a(Entity, i408) :-
    is_a(Entity, n407).
is_a(Entity, j408) :-
    is_a(Entity, n407).
is_a(Entity, n409) :-
    is_a(Entity, n408).
is_a(Entity, i409) :-
    is_a(Entity, n408).
is_a(Entity, j409) :-
    is_a(Entity, n408).
is_a(Entity, n410) :-
    is_a(Entity, n409).
is_a(Entity, i410) :-
    is_a(Entity, n409).
is_a(Entity, j410) :-
    is_a(Entity, n409).
is_a(Entity, n411) :-
    is_a(Entity, n410).
is_a(Entity, i411) :-
    is_a(Entity, n410).
is_a(Entity, j411) :-
    is_a(Entity, n410).
is_a(Entity, n412) :-
    is_a(Entity, n411).
is_a(Entity, i412) :-
    is_a(Entity, n411).
is_a(Entity, j412) :-
    is_a(Entity, n411).
is_a(Entity, n413) :-
    is_a(Entity, n412).
is_a(Entity, i413) :-
    is_a(Entity, n412).
is_a(Entity, j413) :-
    is_a(Entity, n412).
is_a(Entity, n414) :-
    is_a(Entity, n413).
is_a(Entity, i414) :-
    is_a(Entity, n413).
is_a(Entity, j414) :-
    is_a(Entity, n413).
is_a(Entity, n415) :-
    is_a(Entity, n414).
is_a(Entity, i415) :-
    is_a(Entity, n414).
is_a(Entity, j415) :-
    is_a(Entity, n414).
is_a(Entity, n416) :-
    is_a(Entity, n415).
is_a(Entity, i416) :-
    is_a(Entity, n415).
is_a(Entity, j416) :-
    is_a(Entity, n415).
is_a(Entity, n417) :-
    is_a(Entity, n416).
is_a(Entity, i417) :-
    is_a(Entity, n416).
is_a(Entity, j417) :-
    is_a(Entity, n416).
is_a(Entity, n418) :-
    is_a(Entity, n417).
is_a(Entity, i418) :-
    is_a(Entity, n417).
is_a(Entity, j418) :-
    is_a(Entity, n417).
is_a(Entity, n419) :-
    is_a(Entity, n418).
is_a(Entity, i419) :-
    is_a(Entity, n418).
is_a(Entity, j419) :-
    is_a(Entity, n418).
is_a(Entity, n420) :-
    is_a(Entity, n419).
is_a(Entity, i420) :-
    is_a(Entity, n419).
is_a(Entity, j420) :-
    is_a(Entity, n419).
is_a(Entity, n421) :-
    is_a(Entity, n420).
is_a(Entity, i421) :-
    is_a(Entity, n420).
is_a(Entity, j421) :-
    is_a(Entity, n420).
is_a(Entity, n422) :-
    is_a(Entity, n421).
is_a(Entity, i422) :-
    is_a(Entity, n421).
is_a(Entity, j422) :-
    is_a(Entity, n421).
is_a(Entity, n423) :-
    is_a(Entity, n422).
is_a(Entity, i423) :-
    is_a(Entity, n422).
is_a(Entity, j423) :-
    is_a(Entity, n422).
is_a(Entity, n424) :-
    is_a(Entity, n423).
is_a(Entity, i424) :-
    is_a(Entity, n423).
is_a(Entity, j424) :-
    is_a(Entity, n423).
is_a(Entity, n425) :-
    is_a(Entity, n424).
is_a(Entity, i425) :-
    is_a(Entity, n424).
is_a(Entity, j425) :-
    is_a(Entity, n424).
is_a(Entity, n426) :-
    is_a(Entity, n425).
is_a(Entity, i426) :-
    is_a(Entity, n425).
is_a(Entity, j426) :-
    is_a(Entity, n425).
is_a(Entity, n427) :-
    is_a(Entity, n426).
is_a(Entity, i427) :-
    is_a(Entity, n426).
is_a(Entity, j427) :-
    is_a(Entity, n426).
is_a(Entity, n428) :-
    is_a(Entity, n427).
is_a(Entity, i428) :-
    is_a(Entity, n427).
is_a(Entity, j428) :-
    is_a(Entity, n427).
is_a(Entity, n429) :-
    is_a(Entity, n428).
is_a(Entity, i429) :-
    is_a(Entity, n428).
is_a(Entity, j429) :-
    is_a(Entity, n428).
is_a(Entity, n430) :-
    is_a(Entity, n429).
is_a(Entity, i430) :-
    is_a(Entity, n429).
is_a(Entity, j430) :-
    is_a(Entity, n429).
is_a(Entity, n431) :-
    is_a(Entity, n430).
is_a(Entity, i431) :-
    is_a(Entity, n430).
is_a(Entity, j431) :-
    is_a(Entity, n430).
is_a(Entity, n432) :-
    is_a(Entity, n431).
is_a(Entity, i432) :-
    is_a(Entity, n431).
is_a(Entity, j432) :-
    is_a(Entity, n431).
is_a(Entity, n433) :-
    is_a(Entity, n432).
is_a(Entity, i433) :-
    is_a(Entity, n432).
is_a(Entity, j433) :-
    is_a(Entity, n432).
is_a(Entity, n434) :-
    is_a(Entity, n433).
is_a(Entity, i434) :-
    is_a(Entity, n433).
is_a(Entity, j434) :-
    is_a(Entity, n433).
is_a(Entity, n435) :-
    is_a(Entity, n434).
is_a(Entity, i435) :-
    is_a(Entity, n434).
is_a(Entity, j435) :-
    is_a(Entity, n434).
is_a(Entity, n436) :-
    is_a(Entity, n435).
is_a(Entity, i436) :-
    is_a(Entity, n435).
is_a(Entity, j436) :-
    is_a(Entity, n435).
is_a(Entity, n437) :-
    is_a(Entity, n436).
is_a(Entity, i437) :-
    is_a(Entity, n436).
is_a(Entity, j437) :-
    is_a(Entity, n436).
is_a(Entity, n438) :-
    is_a(Entity, n437).
is_a(Entity, i438) :-
    is_a(Entity, n437).
is_a(Entity, j438) :-
    is_a(Entity, n437).
is_a(Entity, n439) :-
    is_a(Entity, n438).
is_a(Entity, i439) :-
    is_a(Entity, n438).
is_a(Entity, j439) :-
    is_a(Entity, n438).
is_a(Entity, n440) :-
    is_a(Entity, n439).
is_a(Entity, i440) :-
    is_a(Entity, n439).
is_a(Entity, j440) :-
    is_a(Entity, n439).
is_a(Entity, n441) :-
    is_a(Entity, n440).
is_a(Entity, i441) :-
    is_a(Entity, n440).
is_a(Entity, j441) :-
    is_a(Entity, n440).
is_a(Entity, n442) :-
    is_a(Entity, n441).
is_a(Entity, i442) :-
    is_a(Entity, n441).
is_a(Entity, j442) :-
    is_a(Entity, n441).
is_a(Entity, n443) :-
    is_a(Entity, n442).
is_a(Entity, i443) :-
    is_a(Entity, n442).
is_a(Entity, j443) :-
    is_a(Entity, n442).
is_a(Entity, n444) :-
    is_a(Entity, n443).
is_a(Entity, i444) :-
    is_a(Entity, n443).
is_a(Entity, j444) :-
    is_a(Entity, n443).
is_a(Entity, n445) :-
    is_a(Entity, n444).
is_a(Entity, i445) :-
    is_a(Entity, n444).
is_a(Entity, j445) :-
    is_a(Entity, n444).
is_a(Entity, n446) :-
    is_a(Entity, n445).
is_a(Entity, i446) :-
    is_a(Entity, n445).
is_a(Entity, j446) :-
    is_a(Entity, n445).
is_a(Entity, n447) :-
    is_a(Entity, n446).
is_a(Entity, i447) :-
    is_a(Entity, n446).
is_a(Entity, j447) :-
    is_a(Entity, n446).
is_a(Entity, n448) :-
    is_a(Entity, n447).
is_a(Entity, i448) :-
    is_a(Entity, n447).
is_a(Entity, j448) :-
    is_a(Entity, n447).
is_a(Entity, n449) :-
    is_a(Entity, n448).
is_a(Entity, i449) :-
    is_a(Entity, n448).
is_a(Entity, j449) :-
    is_a(Entity, n448).
is_a(Entity, n450) :-
    is_a(Entity, n449).
is_a(Entity, i450) :-
    is_a(Entity, n449).
is_a(Entity, j450) :-
    is_a(Entity, n449).
is_a(Entity, n451) :-
    is_a(Entity, n450).
is_a(Entity, i451) :-
    is_a(Entity, n450).
is_a(Entity, j451) :-
    is_a(Entity, n450).
is_a(Entity, n452) :-
    is_a(Entity, n451).
is_a(Entity, i452) :-
    is_a(Entity, n451).
is_a(Entity, j452) :-
    is_a(Entity, n451).
is_a(Entity, n453) :-
    is_a(Entity, n452).
is_a(Entity, i453) :-
    is_a(Entity, n452).
is_a(Entity, j453) :-
    is_a(Entity, n452).
is_a(Entity, n454) :-
    is_a(Entity, n453).
is_a(Entity, i454) :-
    is_a(Entity, n453).
is_a(Entity, j454) :-
    is_a(Entity, n453).
is_a(Entity, n455) :-
    is_a(Entity, n454).
is_a(Entity, i455) :-
    is_a(Entity, n454).
is_a(Entity, j455) :-
    is_a(Entity, n454).
is_a(Entity, n456) :-
    is_a(Entity, n455).
is_a(Entity, i456) :-
    is_a(Entity, n455).
is_a(Entity, j456) :-
    is_a(Entity, n455).
is_a(Entity, n457) :-
    is_a(Entity, n456).
is_a(Entity, i457) :-
    is_a(Entity, n456).
is_a(Entity, j457) :-
    is_a(Entity, n456).
is_a(Entity, n458) :-
    is_a(Entity, n457).
is_a(Entity, i458) :-
    is_a(Entity, n457).
is_a(Entity, j458) :-
    is_a(Entity, n457).
is_a(Entity, n459) :-
    is_a(Entity, n458).
is_a(Entity, i459) :-
    is_a(Entity, n458).
is_a(Entity, j459) :-
    is_a(Entity, n458).
is_a(Entity, n460) :-
    is_a(Entity, n459).
is_a(Entity, i460) :-
    is_a(Entity, n459).
is_a(Entity, j460) :-
    is_a(Entity, n459).
is_a(Entity, n461) :-
    is_a(Entity, n460).
is_a(Entity, i461) :-
    is_a(Entity, n460).
is_a(Entity, j461) :-
    is_a(Entity, n460).
is_a(Entity, n462) :-
    is_a(Entity, n461).
is_a(Entity, i462) :-
    is_a(Entity, n461).
is_a(Entity, j462) :-
    is_a(Entity, n461).
is_a(Entity, n463) :-
    is_a(Entity, n462).
is_a(Entity, i463) :-
    is_a(Entity, n462).
is_a(Entity, j463) :-
    is_a(Entity, n462).
is_a(Entity, n464) :-
    is_a(Entity, n463).
is_a(Entity, i464) :-
    is_a(Entity, n463).
is_a(Entity, j464) :-
    is_a(Entity, n463).
is_a(Entity, n465) :-
    is_a(Entity, n464).
is_a(Entity, i465) :-
    is_a(Entity, n464).
is_a(Entity, j465) :-
    is_a(Entity, n464).
is_a(Entity, n466) :-
    is_a(Entity, n465).
is_a(Entity, i466) :-
    is_a(Entity, n465).
is_a(Entity, j466) :-
    is_a(Entity, n465).
is_a(Entity, n467) :-
    is_a(Entity, n466).
is_a(Entity, i467) :-
    is_a(Entity, n466).
is_a(Entity, j467) :-
    is_a(Entity, n466).
is_a(Entity, n468) :-
    is_a(Entity, n467).
is_a(Entity, i468) :-
    is_a(Entity, n467).
is_a(Entity, j468) :-
    is_a(Entity, n467).
is_a(Entity, n469) :-
    is_a(Entity, n468).
is_a(Entity, i469) :-
    is_a(Entity, n468).
is_a(Entity, j469) :-
    is_a(Entity, n468).
is_a(Entity, n470) :-
    is_a(Entity, n469).
is_a(Entity, i470) :-
    is_a(Entity, n469).
is_a(Entity, j470) :-
    is_a(Entity, n469).
is_a(Entity, n471) :-
    is_a(Entity, n470).
is_a(Entity, i471) :-
    is_a(Entity, n470).
is_a(Entity, j471) :-
    is_a(Entity, n470).
is_a(Entity, n472) :-
    is_a(Entity, n471).
is_a(Entity, i472) :-
    is_a(Entity, n471).
is_a(Entity, j472) :-
    is_a(Entity, n471).
is_a(Entity, n473) :-
    is_a(Entity, n472).
is_a(Entity, i473) :-
    is_a(Entity, n472).
is_a(Entity, j473) :-
    is_a(Entity, n472).
is_a(Entity, n474) :-
    is_a(Entity, n473).
is_a(Entity, i474) :-
    is_a(Entity, n473).
is_a(Entity, j474) :-
    is_a(Entity, n473).
is_a(Entity, n475) :-
    is_a(Entity, n474).
is_a(Entity, i475) :-
    is_a(Entity, n474).
is_a(Entity, j475) :-
    is_a(Entity, n474).
is_a(Entity, n476) :-
    is_a(Entity, n475).
is_a(Entity, i476) :-
    is_a(Entity, n475).
is_a(Entity, j476) :-
    is_a(Entity, n475).
is_a(Entity, n477) :-
    is_a(Entity, n476).
is_a(Entity, i477) :-
    is_a(Entity, n476).
is_a(Entity, j477) :-
    is_a(Entity, n476).
is_a(Entity, n478) :-
    is_a(Entity, n477).
is_a(Entity, i478) :-
    is_a(Entity, n477).
is_a(Entity, j478) :-
    is_a(Entity, n477).
is_a(Entity, n479) :-
    is_a(Entity, n478).
is_a(Entity, i479) :-
    is_a(Entity, n478).
is_a(Entity, j479) :-
    is_a(Entity, n478).
is_a(Entity, n480) :-
    is_a(Entity, n479).
is_a(Entity, i480) :-
    is_a(Entity, n479).
is_a(Entity, j480) :-
    is_a(Entity, n479).
is_a(Entity, n481) :-
    is_a(Entity, n480).
is_a(Entity, i481) :-
    is_a(Entity, n480).
is_a(Entity, j481) :-
    is_a(Entity, n480).
is_a(Entity, n482) :-
    is_a(Entity, n481).
is_a(Entity, i482) :-
    is_a(Entity, n481).
is_a(Entity, j482) :-
    is_a(Entity, n481).
is_a(Entity, n483) :-
    is_a(Entity, n482).
is_a(Entity, i483) :-
    is_a(Entity, n482).
is_a(Entity, j483) :-
    is_a(Entity, n482).
is_a(Entity, n484) :-
    is_a(Entity, n483).
is_a(Entity, i484) :-
    is_a(Entity, n483).
is_a(Entity, j484) :-
    is_a(Entity, n483).
is_a(Entity, n485) :-
    is_a(Entity, n484).
is_a(Entity, i485) :-
    is_a(Entity, n484).
is_a(Entity, j485) :-
    is_a(Entity, n484).
is_a(Entity, n486) :-
    is_a(Entity, n485).
is_a(Entity, i486) :-
    is_a(Entity, n485).
is_a(Entity, j486) :-
    is_a(Entity, n485).
is_a(Entity, n487) :-
    is_a(Entity, n486).
is_a(Entity, i487) :-
    is_a(Entity, n486).
is_a(Entity, j487) :-
    is_a(Entity, n486).
is_a(Entity, n488) :-
    is_a(Entity, n487).
is_a(Entity, i488) :-
    is_a(Entity, n487).
is_a(Entity, j488) :-
    is_a(Entity, n487).
is_a(Entity, n489) :-
    is_a(Entity, n488).
is_a(Entity, i489) :-
    is_a(Entity, n488).
is_a(Entity, j489) :-
    is_a(Entity, n488).
is_a(Entity, n490) :-
    is_a(Entity, n489).
is_a(Entity, i490) :-
    is_a(Entity, n489).
is_a(Entity, j490) :-
    is_a(Entity, n489).
is_a(Entity, n491) :-
    is_a(Entity, n490).
is_a(Entity, i491) :-
    is_a(Entity, n490).
is_a(Entity, j491) :-
    is_a(Entity, n490).
is_a(Entity, n492) :-
    is_a(Entity, n491).
is_a(Entity, i492) :-
    is_a(Entity, n491).
is_a(Entity, j492) :-
    is_a(Entity, n491).
is_a(Entity, n493) :-
    is_a(Entity, n492).
is_a(Entity, i493) :-
    is_a(Entity, n492).
is_a(Entity, j493) :-
    is_a(Entity, n492).
is_a(Entity, n494) :-
    is_a(Entity, n493).
is_a(Entity, i494) :-
    is_a(Entity, n493).
is_a(Entity, j494) :-
    is_a(Entity, n493).
is_a(Entity, n495) :-
    is_a(Entity, n494).
is_a(Entity, i495) :-
    is_a(Entity, n494).
is_a(Entity, j495) :-
    is_a(Entity, n494).
is_a(Entity, n496) :-
    is_a(Entity, n495).
is_a(Entity, i496) :-
    is_a(Entity, n495).
is_a(Entity, j496) :-
    is_a(Entity, n495).
is_a(Entity, n497) :-
    is_a(Entity, n496).
is_a(Entity, i497) :-
    is_a(Entity, n496).
is_a(Entity, j497) :-
    is_a(Entity, n496).
is_a(Entity, n498) :-
    is_a(Entity, n497).
is_a(Entity, i498) :-
    is_a(Entity, n497).
is_a(Entity, j498) :-
    is_a(Entity, n497).
is_a(Entity, n499) :-
    is_a(Entity, n498).
is_a(Entity, i499) :-
    is_a(Entity, n498).
is_a(Entity, j499) :-
    is_a(Entity, n498).
is_a(Entity, n500) :-
    is_a(Entity, n499).
is_a(Entity, i500) :-
    is_a(Entity, n499).
is_a(Entity, j500) :-
    is_a(Entity, n499).
is_a(Entity, n501) :-
    is_a(Entity, n500).
is_a(Entity, i501) :-
    is_a(Entity, n500).
is_a(Entity, j501) :-
    is_a(Entity, n500).
is_a(Entity, n502) :-
    is_a(Entity, n501).
is_a(Entity, i502) :-
    is_a(Entity, n501).
is_a(Entity, j502) :-
    is_a(Entity, n501).
is_a(Entity, n503) :-
    is_a(Entity, n502).
is_a(Entity, i503) :-
    is_a(Entity, n502).
is_a(Entity, j503) :-
    is_a(Entity, n502).
is_a(Entity, n504) :-
    is_a(Entity, n503).
is_a(Entity, i504) :-
    is_a(Entity, n503).
is_a(Entity, j504) :-
    is_a(Entity, n503).
is_a(Entity, n505) :-
    is_a(Entity, n504).
is_a(Entity, i505) :-
    is_a(Entity, n504).
is_a(Entity, j505) :-
    is_a(Entity, n504).
is_a(Entity, n506) :-
    is_a(Entity, n505).
is_a(Entity, i506) :-
    is_a(Entity, n505).
is_a(Entity, j506) :-
    is_a(Entity, n505).
is_a(Entity, n507) :-
    is_a(Entity, n506).
is_a(Entity, i507) :-
    is_a(Entity, n506).
is_a(Entity, j507) :-
    is_a(Entity, n506).
is_a(Entity, n508) :-
    is_a(Entity, n507).
is_a(Entity, i508) :-
    is_a(Entity, n507).
is_a(Entity, j508) :-
    is_a(Entity, n507).
is_a(Entity, n509) :-
    is_a(Entity, n508).
is_a(Entity, i509) :-
    is_a(Entity, n508).
is_a(Entity, j509) :-
    is_a(Entity, n508).
is_a(Entity, n510) :-
    is_a(Entity, n509).
is_a(Entity, i510) :-
    is_a(Entity, n509).
is_a(Entity, j510) :-
    is_a(Entity, n509).
is_a(Entity, n511) :-
    is_a(Entity, n510).
is_a(Entity, i511) :-
    is_a(Entity, n510).
is_a(Entity, j511) :-
    is_a(Entity, n510).
is_a(Entity, n512) :-
    is_a(Entity, n511).
is_a(Entity, i512) :-
    is_a(Entity, n511).
is_a(Entity, j512) :-
    is_a(Entity, n511).
is_a(Entity, n513) :-
    is_a(Entity, n512).
is_a(Entity, i513) :-
    is_a(Entity, n512).
is_a(Entity, j513) :-
    is_a(Entity, n512).
is_a(Entity, n514) :-
    is_a(Entity, n513).
is_a(Entity, i514) :-
    is_a(Entity, n513).
is_a(Entity, j514) :-
    is_a(Entity, n513).
is_a(Entity, n515) :-
    is_a(Entity, n514).
is_a(Entity, i515) :-
    is_a(Entity, n514).
is_a(Entity, j515) :-
    is_a(Entity, n514).
is_a(Entity, n516) :-
    is_a(Entity, n515).
is_a(Entity, i516) :-
    is_a(Entity, n515).
is_a(Entity, j516) :-
    is_a(Entity, n515).
is_a(Entity, n517) :-
    is_a(Entity, n516).
is_a(Entity, i517) :-
    is_a(Entity, n516).
is_a(Entity, j517) :-
    is_a(Entity, n516).
is_a(Entity, n518) :-
    is_a(Entity, n517).
is_a(Entity, i518) :-
    is_a(Entity, n517).
is_a(Entity, j518) :-
    is_a(Entity, n517).
is_a(Entity, n519) :-
    is_a(Entity, n518).
is_a(Entity, i519) :-
    is_a(Entity, n518).
is_a(Entity, j519) :-
    is_a(Entity, n518).
is_a(Entity, n520) :-
    is_a(Entity, n519).
is_a(Entity, i520) :-
    is_a(Entity, n519).
is_a(Entity, j520) :-
    is_a(Entity, n519).
is_a(Entity, n521) :-
    is_a(Entity, n520).
is_a(Entity, i521) :-
    is_a(Entity, n520).
is_a(Entity, j521) :-
    is_a(Entity, n520).
is_a(Entity, n522) :-
    is_a(Entity, n521).
is_a(Entity, i522) :-
    is_a(Entity, n521).
is_a(Entity, j522) :-
    is_a(Entity, n521).
is_a(Entity, n523) :-
    is_a(Entity, n522).
is_a(Entity, i523) :-
    is_a(Entity, n522).
is_a(Entity, j523) :-
    is_a(Entity, n522).
is_a(Entity, n524) :-
    is_a(Entity, n523).
is_a(Entity, i524) :-
    is_a(Entity, n523).
is_a(Entity, j524) :-
    is_a(Entity, n523).
is_a(Entity, n525) :-
    is_a(Entity, n524).
is_a(Entity, i525) :-
    is_a(Entity, n524).
is_a(Entity, j525) :-
    is_a(Entity, n524).
is_a(Entity, n526) :-
    is_a(Entity, n525).
is_a(Entity, i526) :-
    is_a(Entity, n525).
is_a(Entity, j526) :-
    is_a(Entity, n525).
is_a(Entity, n527) :-
    is_a(Entity, n526).
is_a(Entity, i527) :-
    is_a(Entity, n526).
is_a(Entity, j527) :-
    is_a(Entity, n526).
is_a(Entity, n528) :-
    is_a(Entity, n527).
is_a(Entity, i528) :-
    is_a(Entity, n527).
is_a(Entity, j528) :-
    is_a(Entity, n527).
is_a(Entity, n529) :-
    is_a(Entity, n528).
is_a(Entity, i529) :-
    is_a(Entity, n528).
is_a(Entity, j529) :-
    is_a(Entity, n528).
is_a(Entity, n530) :-
    is_a(Entity, n529).
is_a(Entity, i530) :-
    is_a(Entity, n529).
is_a(Entity, j530) :-
    is_a(Entity, n529).
is_a(Entity, n531) :-
    is_a(Entity, n530).
is_a(Entity, i531) :-
    is_a(Entity, n530).
is_a(Entity, j531) :-
    is_a(Entity, n530).
is_a(Entity, n532) :-
    is_a(Entity, n531).
is_a(Entity, i532) :-
    is_a(Entity, n531).
is_a(Entity, j532) :-
    is_a(Entity, n531).
is_a(Entity, n533) :-
    is_a(Entity, n532).
is_a(Entity, i533) :-
    is_a(Entity, n532).
is_a(Entity, j533) :-
    is_a(Entity, n532).
is_a(Entity, n534) :-
    is_a(Entity, n533).
is_a(Entity, i534) :-
    is_a(Entity, n533).
is_a(Entity, j534) :-
    is_a(Entity, n533).
is_a(Entity, n535) :-
    is_a(Entity, n534).
is_a(Entity, i535) :-
    is_a(Entity, n534).
is_a(Entity, j535) :-
    is_a(Entity, n534).
is_a(Entity, n536) :-
    is_a(Entity, n535).
is_a(Entity, i536) :-
    is_a(Entity, n535).
is_a(Entity, j536) :-
    is_a(Entity, n535).
is_a(Entity, n537) :-
    is_a(Entity, n536).
is_a(Entity, i537) :-
    is_a(Entity, n536).
is_a(Entity, j537) :-
    is_a(Entity, n536).
is_a(Entity, n538) :-
    is_a(Entity, n537).
is_a(Entity, i538) :-
    is_a(Entity, n537).
is_a(Entity, j538) :-
    is_a(Entity, n537).
is_a(Entity, n539) :-
    is_a(Entity, n538).
is_a(Entity, i539) :-
    is_a(Entity, n538).
is_a(Entity, j539) :-
    is_a(Entity, n538).
is_a(Entity, n540) :-
    is_a(Entity, n539).
is_a(Entity, i540) :-
    is_a(Entity, n539).
is_a(Entity, j540) :-
    is_a(Entity, n539).
is_a(Entity, n541) :-
    is_a(Entity, n540).
is_a(Entity, i541) :-
    is_a(Entity, n540).
is_a(Entity, j541) :-
    is_a(Entity, n540).
is_a(Entity, n542) :-
    is_a(Entity, n541).
is_a(Entity, i542) :-
    is_a(Entity, n541).
is_a(Entity, j542) :-
    is_a(Entity, n541).
is_a(Entity, n543) :-
    is_a(Entity, n542).
is_a(Entity, i543) :-
    is_a(Entity, n542).
is_a(Entity, j543) :-
    is_a(Entity, n542).
is_a(Entity, n544) :-
    is_a(Entity, n543).
is_a(Entity, i544) :-
    is_a(Entity, n543).
is_a(Entity, j544) :-
    is_a(Entity, n543).
is_a(Entity, n545) :-
    is_a(Entity, n544).
is_a(Entity, i545) :-
    is_a(Entity, n544).
is_a(Entity, j545) :-
    is_a(Entity, n544).
is_a(Entity, n546) :-
    is_a(Entity, n545).
is_a(Entity, i546) :-
    is_a(Entity, n545).
is_a(Entity, j546) :-
    is_a(Entity, n545).
is_a(Entity, n547) :-
    is_a(Entity, n546).
is_a(Entity, i547) :-
    is_a(Entity, n546).
is_a(Entity, j547) :-
    is_a(Entity, n546).
is_a(Entity, n548) :-
    is_a(Entity, n547).
is_a(Entity, i548) :-
    is_a(Entity, n547).
is_a(Entity, j548) :-
    is_a(Entity, n547).
is_a(Entity, n549) :-
    is_a(Entity, n548).
is_a(Entity, i549) :-
    is_a(Entity, n548).
is_a(Entity, j549) :-
    is_a(Entity, n548).
is_a(Entity, n550) :-
    is_a(Entity, n549).
is_a(Entity, i550) :-
    is_a(Entity, n549).
is_a(Entity, j550) :-
    is_a(Entity, n549).
is_a(Entity, n551) :-
    is_a(Entity, n550).
is_a(Entity, i551) :-
    is_a(Entity, n550).
is_a(Entity, j551) :-
    is_a(Entity, n550).
is_a(Entity, n552) :-
    is_a(Entity, n551).
is_a(Entity, i552) :-
    is_a(Entity, n551).
is_a(Entity, j552) :-
    is_a(Entity, n551).
is_a(Entity, n553) :-
    is_a(Entity, n552).
is_a(Entity, i553) :-
    is_a(Entity, n552).
is_a(Entity, j553) :-
    is_a(Entity, n552).
is_a(Entity, n554) :-
    is_a(Entity, n553).
is_a(Entity, i554) :-
    is_a(Entity, n553).
is_a(Entity, j554) :-
    is_a(Entity, n553).
is_a(Entity, n555) :-
    is_a(Entity, n554).
is_a(Entity, i555) :-
    is_a(Entity, n554).
is_a(Entity, j555) :-
    is_a(Entity, n554).
is_a(Entity, n556) :-
    is_a(Entity, n555).
is_a(Entity, i556) :-
    is_a(Entity, n555).
is_a(Entity, j556) :-
    is_a(Entity, n555).
is_a(Entity, n557) :-
    is_a(Entity, n556).
is_a(Entity, i557) :-
    is_a(Entity, n556).
is_a(Entity, j557) :-
    is_a(Entity, n556).
is_a(Entity, n558) :-
    is_a(Entity, n557).
is_a(Entity, i558) :-
    is_a(Entity, n557).
is_a(Entity, j558) :-
    is_a(Entity, n557).
is_a(Entity, n559) :-
    is_a(Entity, n558).
is_a(Entity, i559) :-
    is_a(Entity, n558).
is_a(Entity, j559) :-
    is_a(Entity, n558).
is_a(Entity, n560) :-
    is_a(Entity, n559).
is_a(Entity, i560) :-
    is_a(Entity, n559).
is_a(Entity, j560) :-
    is_a(Entity, n559).
is_a(Entity, n561) :-
    is_a(Entity, n560).
is_a(Entity, i561) :-
    is_a(Entity, n560).
is_a(Entity, j561) :-
    is_a(Entity, n560).
is_a(Entity, n562) :-
    is_a(Entity, n561).
is_a(Entity, i562) :-
    is_a(Entity, n561).
is_a(Entity, j562) :-
    is_a(Entity, n561).
is_a(Entity, n563) :-
    is_a(Entity, n562).
is_a(Entity, i563) :-
    is_a(Entity, n562).
is_a(Entity, j563) :-
    is_a(Entity, n562).
is_a(Entity, n564) :-
    is_a(Entity, n563).
is_a(Entity, i564) :-
    is_a(Entity, n563).
is_a(Entity, j564) :-
    is_a(Entity, n563).
is_a(Entity, n565) :-
    is_a(Entity, n564).
is_a(Entity, i565) :-
    is_a(Entity, n564).
is_a(Entity, j565) :-
    is_a(Entity, n564).
is_a(Entity, n566) :-
    is_a(Entity, n565).
is_a(Entity, i566) :-
    is_a(Entity, n565).
is_a(Entity, j566) :-
    is_a(Entity, n565).
is_a(Entity, n567) :-
    is_a(Entity, n566).
is_a(Entity, i567) :-
    is_a(Entity, n566).
is_a(Entity, j567) :-
    is_a(Entity, n566).
is_a(Entity, n568) :-
    is_a(Entity, n567).
is_a(Entity, i568) :-
    is_a(Entity, n567).
is_a(Entity, j568) :-
    is_a(Entity, n567).
is_a(Entity, n569) :-
    is_a(Entity, n568).
is_a(Entity, i569) :-
    is_a(Entity, n568).
is_a(Entity, j569) :-
    is_a(Entity, n568).
is_a(Entity, n570) :-
    is_a(Entity, n569).
is_a(Entity, i570) :-
    is_a(Entity, n569).
is_a(Entity, j570) :-
    is_a(Entity, n569).
is_a(Entity, n571) :-
    is_a(Entity, n570).
is_a(Entity, i571) :-
    is_a(Entity, n570).
is_a(Entity, j571) :-
    is_a(Entity, n570).
is_a(Entity, n572) :-
    is_a(Entity, n571).
is_a(Entity, i572) :-
    is_a(Entity, n571).
is_a(Entity, j572) :-
    is_a(Entity, n571).
is_a(Entity, n573) :-
    is_a(Entity, n572).
is_a(Entity, i573) :-
    is_a(Entity, n572).
is_a(Entity, j573) :-
    is_a(Entity, n572).
is_a(Entity, n574) :-
    is_a(Entity, n573).
is_a(Entity, i574) :-
    is_a(Entity, n573).
is_a(Entity, j574) :-
    is_a(Entity, n573).
is_a(Entity, n575) :-
    is_a(Entity, n574).
is_a(Entity, i575) :-
    is_a(Entity, n574).
is_a(Entity, j575) :-
    is_a(Entity, n574).
is_a(Entity, n576) :-
    is_a(Entity, n575).
is_a(Entity, i576) :-
    is_a(Entity, n575).
is_a(Entity, j576) :-
    is_a(Entity, n575).
is_a(Entity, n577) :-
    is_a(Entity, n576).
is_a(Entity, i577) :-
    is_a(Entity, n576).
is_a(Entity, j577) :-
    is_a(Entity, n576).
is_a(Entity, n578) :-
    is_a(Entity, n577).
is_a(Entity, i578) :-
    is_a(Entity, n577).
is_a(Entity, j578) :-
    is_a(Entity, n577).
is_a(Entity, n579) :-
    is_a(Entity, n578).
is_a(Entity, i579) :-
    is_a(Entity, n578).
is_a(Entity, j579) :-
    is_a(Entity, n578).
is_a(Entity, n580) :-
    is_a(Entity, n579).
is_a(Entity, i580) :-
    is_a(Entity, n579).
is_a(Entity, j580) :-
    is_a(Entity, n579).
is_a(Entity, n581) :-
    is_a(Entity, n580).
is_a(Entity, i581) :-
    is_a(Entity, n580).
is_a(Entity, j581) :-
    is_a(Entity, n580).
is_a(Entity, n582) :-
    is_a(Entity, n581).
is_a(Entity, i582) :-
    is_a(Entity, n581).
is_a(Entity, j582) :-
    is_a(Entity, n581).
is_a(Entity, n583) :-
    is_a(Entity, n582).
is_a(Entity, i583) :-
    is_a(Entity, n582).
is_a(Entity, j583) :-
    is_a(Entity, n582).
is_a(Entity, n584) :-
    is_a(Entity, n583).
is_a(Entity, i584) :-
    is_a(Entity, n583).
is_a(Entity, j584) :-
    is_a(Entity, n583).
is_a(Entity, n585) :-
    is_a(Entity, n584).
is_a(Entity, i585) :-
    is_a(Entity, n584).
is_a(Entity, j585) :-
    is_a(Entity, n584).
is_a(Entity, n586) :-
    is_a(Entity, n585).
is_a(Entity, i586) :-
    is_a(Entity, n585).
is_a(Entity, j586) :-
    is_a(Entity, n585).
is_a(Entity, n587) :-
    is_a(Entity, n586).
is_a(Entity, i587) :-
    is_a(Entity, n586).
is_a(Entity, j587) :-
    is_a(Entity, n586).
is_a(Entity, n588) :-
    is_a(Entity, n587).
is_a(Entity, i588) :-
    is_a(Entity, n587).
is_a(Entity, j588) :-
    is_a(Entity, n587).
is_a(Entity, n589) :-
    is_a(Entity, n588).
is_a(Entity, i589) :-
    is_a(Entity, n588).
is_a(Entity, j589) :-
    is_a(Entity, n588).
is_a(Entity, n590) :-
    is_a(Entity, n589).
is_a(Entity, i590) :-
    is_a(Entity, n589).
is_a(Entity, j590) :-
    is_a(Entity, n589).
is_a(Entity, n591) :-
    is_a(Entity, n590).
is_a(Entity, i591) :-
    is_a(Entity, n590).
is_a(Entity, j591) :-
    is_a(Entity, n590).
is_a(Entity, n592) :-
    is_a(Entity, n591).
is_a(Entity, i592) :-
    is_a(Entity, n591).
is_a(Entity, j592) :-
    is_a(Entity, n591).
is_a(Entity, n593) :-
    is_a(Entity, n592).
is_a(Entity, i593) :-
    is_a(Entity, n592).
is_a(Entity, j593) :-
    is_a(Entity, n592).
is_a(Entity, n594) :-
    is_a(Entity, n593).
is_a(Entity, i594) :-
    is_a(Entity, n593).
is_a(Entity, j594) :-
    is_a(Entity, n593).
is_a(Entity, n595) :-
    is_a(Entity, n594).
is_a(Entity, i595) :-
    is_a(Entity, n594).
is_a(Entity, j595) :-
    is_a(Entity, n594).
is_a(Entity, n596) :-
    is_a(Entity, n595).
is_a(Entity, i596) :-
    is_a(Entity, n595).
is_a(Entity, j596) :-
    is_a(Entity, n595).
is_a(Entity, n597) :-
    is_a(Entity, n596).
is_a(Entity, i597) :-
    is_a(Entity, n596).
is_a(Entity, j597) :-
    is_a(Entity, n596).
is_a(Entity, n598) :-
    is_a(Entity, n597).
is_a(Entity, i598) :-
    is_a(Entity, n597).
is_a(Entity, j598) :-
    is_a(Entity, n597).
is_a(Entity, n599) :-
    is_a(Entity, n598).
is_a(Entity, i599) :-
    is_a(Entity, n598).
is_a(Entity, j599) :-
    is_a(Entity, n598).
is_a(Entity, n600) :-
    is_a(Entity, n599).
is_a(Entity, i600) :-
    is_a(Entity, n599).
is_a(Entity, j600) :-
    is_a(Entity, n599).
is_a(Entity, n601) :-
    is_a(Entity, n600).
is_a(Entity, i601) :-
    is_a(Entity, n600).
is_a(Entity, j601) :-
    is_a(Entity, n600).
is_a(Entity, n602) :-
    is_a(Entity, n601).
is_a(Entity, i602) :-
    is_a(Entity, n601).
is_a(Entity, j602) :-
    is_a(Entity, n601).
is_a(Entity, n603) :-
    is_a(Entity, n602).
is_a(Entity, i603) :-
    is_a(Entity, n602).
is_a(Entity, j603) :-
    is_a(Entity, n602).
is_a(Entity, n604) :-
    is_a(Entity, n603).
is_a(Entity, i604) :-
    is_a(Entity, n603).
is_a(Entity, j604) :-
    is_a(Entity, n603).
is_a(Entity, n605) :-
    is_a(Entity, n604).
is_a(Entity, i605) :-
    is_a(Entity, n604).
is_a(Entity, j605) :-
    is_a(Entity, n604).
is_a(Entity, n606) :-
    is_a(Entity, n605).
is_a(Entity, i606) :-
    is_a(Entity, n605).
is_a(Entity, j606) :-
    is_a(Entity, n605).
is_a(Entity, n607) :-
    is_a(Entity, n606).
is_a(Entity, i607) :-
    is_a(Entity, n606).
is_a(Entity, j607) :-
    is_a(Entity, n606).
is_a(Entity, n608) :-
    is_a(Entity, n607).
is_a(Entity, i608) :-
    is_a(Entity, n607).
is_a(Entity, j608) :-
    is_a(Entity, n607).
is_a(Entity, n609) :-
    is_a(Entity, n608).
is_a(Entity, i609) :-
    is_a(Entity, n608).
is_a(Entity, j609) :-
    is_a(Entity, n608).
is_a(Entity, n610) :-
    is_a(Entity, n609).
is_a(Entity, i610) :-
    is_a(Entity, n609).
is_a(Entity, j610) :-
    is_a(Entity, n609).
is_a(Entity, n611) :-
    is_a(Entity, n610).
is_a(Entity, i611) :-
    is_a(Entity, n610).
is_a(Entity, j611) :-
    is_a(Entity, n610).
is_a(Entity, n612) :-
    is_a(Entity, n611).
is_a(Entity, i612) :-
    is_a(Entity, n611).
is_a(Entity, j612) :-
    is_a(Entity, n611).
is_a(Entity, n613) :-
    is_a(Entity, n612).
is_a(Entity, i613) :-
    is_a(Entity, n612).
is_a(Entity, j613) :-
    is_a(Entity, n612).
is_a(Entity, n614) :-
    is_a(Entity, n613).
is_a(Entity, i614) :-
    is_a(Entity, n613).
is_a(Entity, j614) :-
    is_a(Entity, n613).
is_a(Entity, n615) :-
    is_a(Entity, n614).
is_a(Entity, i615) :-
    is_a(Entity, n614).
is_a(Entity, j615) :-
    is_a(Entity, n614).
is_a(Entity, n616) :-
    is_a(Entity, n615).
is_a(Entity, i616) :-
    is_a(Entity, n615).
is_a(Entity, j616) :-
    is_a(Entity, n615).
is_a(Entity, n617) :-
    is_a(Entity, n616).
is_a(Entity, i617) :-
    is_a(Entity, n616).
is_a(Entity, j617) :-
    is_a(Entity, n616).
is_a(Entity, n618) :-
    is_a(Entity, n617).
is_a(Entity, i618) :-
    is_a(Entity, n617).
is_a(Entity, j618) :-
    is_a(Entity, n617).
is_a(Entity, n619) :-
    is_a(Entity, n618).
is_a(Entity, i619) :-
    is_a(Entity, n618).
is_a(Entity, j619) :-
    is_a(Entity, n618).
is_a(Entity, n620) :-
    is_a(Entity, n619).
is_a(Entity, i620) :-
    is_a(Entity, n619).
is_a(Entity, j620) :-
    is_a(Entity, n619).
is_a(Entity, n621) :-
    is_a(Entity, n620).
is_a(Entity, i621) :-
    is_a(Entity, n620).
is_a(Entity, j621) :-
    is_a(Entity, n620).
is_a(Entity, n622) :-
    is_a(Entity, n621).
is_a(Entity, i622) :-
    is_a(Entity, n621).
is_a(Entity, j622) :-
    is_a(Entity, n621).
is_a(Entity, n623) :-
    is_a(Entity, n622).
is_a(Entity, i623) :-
    is_a(Entity, n622).
is_a(Entity, j623) :-
    is_a(Entity, n622).
is_a(Entity, n624) :-
    is_a(Entity, n623).
is_a(Entity, i624) :-
    is_a(Entity, n623).
is_a(Entity, j624) :-
    is_a(Entity, n623).
is_a(Entity, n625) :-
    is_a(Entity, n624).
is_a(Entity, i625) :-
    is_a(Entity, n624).
is_a(Entity, j625) :-
    is_a(Entity, n624).
is_a(Entity, n626) :-
    is_a(Entity, n625).
is_a(Entity, i626) :-
    is_a(Entity, n625).
is_a(Entity, j626) :-
    is_a(Entity, n625).
is_a(Entity, n627) :-
    is_a(Entity, n626).
is_a(Entity, i627) :-
    is_a(Entity, n626).
is_a(Entity, j627) :-
    is_a(Entity, n626).
is_a(Entity, n628) :-
    is_a(Entity, n627).
is_a(Entity, i628) :-
    is_a(Entity, n627).
is_a(Entity, j628) :-
    is_a(Entity, n627).
is_a(Entity, n629) :-
    is_a(Entity, n628).
is_a(Entity, i629) :-
    is_a(Entity, n628).
is_a(Entity, j629) :-
    is_a(Entity, n628).
is_a(Entity, n630) :-
    is_a(Entity, n629).
is_a(Entity, i630) :-
    is_a(Entity, n629).
is_a(Entity, j630) :-
    is_a(Entity, n629).
is_a(Entity, n631) :-
    is_a(Entity, n630).
is_a(Entity, i631) :-
    is_a(Entity, n630).
is_a(Entity, j631) :-
    is_a(Entity, n630).
is_a(Entity, n632) :-
    is_a(Entity, n631).
is_a(Entity, i632) :-
    is_a(Entity, n631).
is_a(Entity, j632) :-
    is_a(Entity, n631).
is_a(Entity, n633) :-
    is_a(Entity, n632).
is_a(Entity, i633) :-
    is_a(Entity, n632).
is_a(Entity, j633) :-
    is_a(Entity, n632).
is_a(Entity, n634) :-
    is_a(Entity, n633).
is_a(Entity, i634) :-
    is_a(Entity, n633).
is_a(Entity, j634) :-
    is_a(Entity, n633).
is_a(Entity, n635) :-
    is_a(Entity, n634).
is_a(Entity, i635) :-
    is_a(Entity, n634).
is_a(Entity, j635) :-
    is_a(Entity, n634).
is_a(Entity, n636) :-
    is_a(Entity, n635).
is_a(Entity, i636) :-
    is_a(Entity, n635).
is_a(Entity, j636) :-
    is_a(Entity, n635).
is_a(Entity, n637) :-
    is_a(Entity, n636).
is_a(Entity, i637) :-
    is_a(Entity, n636).
is_a(Entity, j637) :-
    is_a(Entity, n636).
is_a(Entity, n638) :-
    is_a(Entity, n637).
is_a(Entity, i638) :-
    is_a(Entity, n637).
is_a(Entity, j638) :-
    is_a(Entity, n637).
is_a(Entity, n639) :-
    is_a(Entity, n638).
is_a(Entity, i639) :-
    is_a(Entity, n638).
is_a(Entity, j639) :-
    is_a(Entity, n638).
is_a(Entity, n640) :-
    is_a(Entity, n639).
is_a(Entity, i640) :-
    is_a(Entity, n639).
is_a(Entity, j640) :-
    is_a(Entity, n639).
is_a(Entity, n641) :-
    is_a(Entity, n640).
is_a(Entity, i641) :-
    is_a(Entity, n640).
is_a(Entity, j641) :-
    is_a(Entity, n640).
is_a(Entity, n642) :-
    is_a(Entity, n641).
is_a(Entity, i642) :-
    is_a(Entity, n641).
is_a(Entity, j642) :-
    is_a(Entity, n641).
is_a(Entity, n643) :-
    is_a(Entity, n642).
is_a(Entity, i643) :-
    is_a(Entity, n642).
is_a(Entity, j643) :-
    is_a(Entity, n642).
is_a(Entity, n644) :-
    is_a(Entity, n643).
is_a(Entity, i644) :-
    is_a(Entity, n643).
is_a(Entity, j644) :-
    is_a(Entity, n643).
is_a(Entity, n645) :-
    is_a(Entity, n644).
is_a(Entity, i645) :-
    is_a(Entity, n644).
is_a(Entity, j645) :-
    is_a(Entity, n644).
is_a(Entity, n646) :-
    is_a(Entity, n645).
is_a(Entity, i646) :-
    is_a(Entity, n645).
is_a(Entity, j646) :-
    is_a(Entity, n645).
is_a(Entity, n647) :-
    is_a(Entity, n646).
is_a(Entity, i647) :-
    is_a(Entity, n646).
is_a(Entity, j647) :-
    is_a(Entity, n646).
is_a(Entity, n648) :-
    is_a(Entity, n647).
is_a(Entity, i648) :-
    is_a(Entity, n647).
is_a(Entity, j648) :-
    is_a(Entity, n647).
is_a(Entity, n649) :-
    is_a(Entity, n648).
is_a(Entity, i649) :-
    is_a(Entity, n648).
is_a(Entity, j649) :-
    is_a(Entity, n648).
is_a(Entity, n650) :-
    is_a(Entity, n649).
is_a(Entity, i650) :-
    is_a(Entity, n649).
is_a(Entity, j650) :-
    is_a(Entity, n649).
is_a(Entity, n651) :-
    is_a(Entity, n650).
is_a(Entity, i651) :-
    is_a(Entity, n650).
is_a(Entity, j651) :-
    is_a(Entity, n650).
is_a(Entity, n652) :-
    is_a(Entity, n651).
is_a(Entity, i652) :-
    is_a(Entity, n651).
is_a(Entity, j652) :-
    is_a(Entity, n651).
is_a(Entity, n653) :-
    is_a(Entity, n652).
is_a(Entity, i653) :-
    is_a(Entity, n652).
is_a(Entity, j653) :-
    is_a(Entity, n652).
is_a(Entity, n654) :-
    is_a(Entity, n653).
is_a(Entity, i654) :-
    is_a(Entity, n653).
is_a(Entity, j654) :-
    is_a(Entity, n653).
is_a(Entity, n655) :-
    is_a(Entity, n654).
is_a(Entity, i655) :-
    is_a(Entity, n654).
is_a(Entity, j655) :-
    is_a(Entity, n654).
is_a(Entity, n656) :-
    is_a(Entity, n655).
is_a(Entity, i656) :-
    is_a(Entity, n655).
is_a(Entity, j656) :-
    is_a(Entity, n655).
is_a(Entity, n657) :-
    is_a(Entity, n656).
is_a(Entity, i657) :-
    is_a(Entity, n656).
is_a(Entity, j657) :-
    is_a(Entity, n656).
is_a(Entity, n658) :-
    is_a(Entity, n657).
is_a(Entity, i658) :-
    is_a(Entity, n657).
is_a(Entity, j658) :-
    is_a(Entity, n657).
is_a(Entity, n659) :-
    is_a(Entity, n658).
is_a(Entity, i659) :-
    is_a(Entity, n658).
is_a(Entity, j659) :-
    is_a(Entity, n658).
is_a(Entity, n660) :-
    is_a(Entity, n659).
is_a(Entity, i660) :-
    is_a(Entity, n659).
is_a(Entity, j660) :-
    is_a(Entity, n659).
is_a(Entity, n661) :-
    is_a(Entity, n660).
is_a(Entity, i661) :-
    is_a(Entity, n660).
is_a(Entity, j661) :-
    is_a(Entity, n660).
is_a(Entity, n662) :-
    is_a(Entity, n661).
is_a(Entity, i662) :-
    is_a(Entity, n661).
is_a(Entity, j662) :-
    is_a(Entity, n661).
is_a(Entity, n663) :-
    is_a(Entity, n662).
is_a(Entity, i663) :-
    is_a(Entity, n662).
is_a(Entity, j663) :-
    is_a(Entity, n662).
is_a(Entity, n664) :-
    is_a(Entity, n663).
is_a(Entity, i664) :-
    is_a(Entity, n663).
is_a(Entity, j664) :-
    is_a(Entity, n663).
is_a(Entity, n665) :-
    is_a(Entity, n664).
is_a(Entity, i665) :-
    is_a(Entity, n664).
is_a(Entity, j665) :-
    is_a(Entity, n664).
is_a(Entity, n666) :-
    is_a(Entity, n665).
is_a(Entity, i666) :-
    is_a(Entity, n665).
is_a(Entity, j666) :-
    is_a(Entity, n665).
is_a(Entity, n667) :-
    is_a(Entity, n666).
is_a(Entity, i667) :-
    is_a(Entity, n666).
is_a(Entity, j667) :-
    is_a(Entity, n666).
is_a(Entity, n668) :-
    is_a(Entity, n667).
is_a(Entity, i668) :-
    is_a(Entity, n667).
is_a(Entity, j668) :-
    is_a(Entity, n667).
is_a(Entity, n669) :-
    is_a(Entity, n668).
is_a(Entity, i669) :-
    is_a(Entity, n668).
is_a(Entity, j669) :-
    is_a(Entity, n668).
is_a(Entity, n670) :-
    is_a(Entity, n669).
is_a(Entity, i670) :-
    is_a(Entity, n669).
is_a(Entity, j670) :-
    is_a(Entity, n669).
is_a(Entity, n671) :-
    is_a(Entity, n670).
is_a(Entity, i671) :-
    is_a(Entity, n670).
is_a(Entity, j671) :-
    is_a(Entity, n670).
is_a(Entity, n672) :-
    is_a(Entity, n671).
is_a(Entity, i672) :-
    is_a(Entity, n671).
is_a(Entity, j672) :-
    is_a(Entity, n671).
is_a(Entity, n673) :-
    is_a(Entity, n672).
is_a(Entity, i673) :-
    is_a(Entity, n672).
is_a(Entity, j673) :-
    is_a(Entity, n672).
is_a(Entity, n674) :-
    is_a(Entity, n673).
is_a(Entity, i674) :-
    is_a(Entity, n673).
is_a(Entity, j674) :-
    is_a(Entity, n673).
is_a(Entity, n675) :-
    is_a(Entity, n674).
is_a(Entity, i675) :-
    is_a(Entity, n674).
is_a(Entity, j675) :-
    is_a(Entity, n674).
is_a(Entity, n676) :-
    is_a(Entity, n675).
is_a(Entity, i676) :-
    is_a(Entity, n675).
is_a(Entity, j676) :-
    is_a(Entity, n675).
is_a(Entity, n677) :-
    is_a(Entity, n676).
is_a(Entity, i677) :-
    is_a(Entity, n676).
is_a(Entity, j677) :-
    is_a(Entity, n676).
is_a(Entity, n678) :-
    is_a(Entity, n677).
is_a(Entity, i678) :-
    is_a(Entity, n677).
is_a(Entity, j678) :-
    is_a(Entity, n677).
is_a(Entity, n679) :-
    is_a(Entity, n678).
is_a(Entity, i679) :-
    is_a(Entity, n678).
is_a(Entity, j679) :-
    is_a(Entity, n678).
is_a(Entity, n680) :-
    is_a(Entity, n679).
is_a(Entity, i680) :-
    is_a(Entity, n679).
is_a(Entity, j680) :-
    is_a(Entity, n679).
is_a(Entity, n681) :-
    is_a(Entity, n680).
is_a(Entity, i681) :-
    is_a(Entity, n680).
is_a(Entity, j681) :-
    is_a(Entity, n680).
is_a(Entity, n682) :-
    is_a(Entity, n681).
is_a(Entity, i682) :-
    is_a(Entity, n681).
is_a(Entity, j682) :-
    is_a(Entity, n681).
is_a(Entity, n683) :-
    is_a(Entity, n682).
is_a(Entity, i683) :-
    is_a(Entity, n682).
is_a(Entity, j683) :-
    is_a(Entity, n682).
is_a(Entity, n684) :-
    is_a(Entity, n683).
is_a(Entity, i684) :-
    is_a(Entity, n683).
is_a(Entity, j684) :-
    is_a(Entity, n683).
is_a(Entity, n685) :-
    is_a(Entity, n684).
is_a(Entity, i685) :-
    is_a(Entity, n684).
is_a(Entity, j685) :-
    is_a(Entity, n684).
is_a(Entity, n686) :-
    is_a(Entity, n685).
is_a(Entity, i686) :-
    is_a(Entity, n685).
is_a(Entity, j686) :-
    is_a(Entity, n685).
is_a(Entity, n687) :-
    is_a(Entity, n686).
is_a(Entity, i687) :-
    is_a(Entity, n686).
is_a(Entity, j687) :-
    is_a(Entity, n686).
is_a(Entity, n688) :-
    is_a(Entity, n687).
is_a(Entity, i688) :-
    is_a(Entity, n687).
is_a(Entity, j688) :-
    is_a(Entity, n687).
is_a(Entity, n689) :-
    is_a(Entity, n688).
is_a(Entity, i689) :-
    is_a(Entity, n688).
is_a(Entity, j689) :-
    is_a(Entity, n688).
is_a(Entity, n690) :-
    is_a(Entity, n689).
is_a(Entity, i690) :-
    is_a(Entity, n689).
is_a(Entity, j690) :-
    is_a(Entity, n689).
is_a(Entity, n691) :-
    is_a(Entity, n690).
is_a(Entity, i691) :-
    is_a(Entity, n690).
is_a(Entity, j691) :-
    is_a(Entity, n690).
is_a(Entity, n692) :-
    is_a(Entity, n691).
is_a(Entity, i692) :-
    is_a(Entity, n691).
is_a(Entity, j692) :-
    is_a(Entity, n691).
is_a(Entity, n693) :-
    is_a(Entity, n692).
is_a(Entity, i693) :-
    is_a(Entity, n692).
is_a(Entity, j693) :-
    is_a(Entity, n692).
is_a(Entity, n694) :-
    is_a(Entity, n693).
is_a(Entity, i694) :-
    is_a(Entity, n693).
is_a(Entity, j694) :-
    is_a(Entity, n693).
is_a(Entity, n695) :-
    is_a(Entity, n694).
is_a(Entity, i695) :-
    is_a(Entity, n694).
is_a(Entity, j695) :-
    is_a(Entity, n694).
is_a(Entity, n696) :-
    is_a(Entity, n695).
is_a(Entity, i696) :-
    is_a(Entity, n695).
is_a(Entity, j696) :-
    is_a(Entity, n695).
is_a(Entity, n697) :-
    is_a(Entity, n696).
is_a(Entity, i697) :-
    is_a(Entity, n696).
is_a(Entity, j697) :-
    is_a(Entity, n696).
is_a(Entity, n698) :-
    is_a(Entity, n697).
is_a(Entity, i698) :-
    is_a(Entity, n697).
is_a(Entity, j698) :-
    is_a(Entity, n697).
is_a(Entity, n699) :-
    is_a(Entity, n698).
is_a(Entity, i699) :-
    is_a(Entity, n698).
is_a(Entity, j699) :-
    is_a(Entity, n698).
is_a(Entity, n700) :-
    is_a(Entity, n699).
is_a(Entity, i700) :-
    is_a(Entity, n699).
is_a(Entity, j700) :-
    is_a(Entity, n699).
is_a(Entity, n701) :-
    is_a(Entity, n700).
is_a(Entity, i701) :-
    is_a(Entity, n700).
is_a(Entity, j701) :-
    is_a(Entity, n700).
is_a(Entity, n702) :-
    is_a(Entity, n701).
is_a(Entity, i702) :-
    is_a(Entity, n701).
is_a(Entity, j702) :-
    is_a(Entity, n701).
is_a(Entity, n703) :-
    is_a(Entity, n702).
is_a(Entity, i703) :-
    is_a(Entity, n702).
is_a(Entity, j703) :-
    is_a(Entity, n702).
is_a(Entity, n704) :-
    is_a(Entity, n703).
is_a(Entity, i704) :-
    is_a(Entity, n703).
is_a(Entity, j704) :-
    is_a(Entity, n703).
is_a(Entity, n705) :-
    is_a(Entity, n704).
is_a(Entity, i705) :-
    is_a(Entity, n704).
is_a(Entity, j705) :-
    is_a(Entity, n704).
is_a(Entity, n706) :-
    is_a(Entity, n705).
is_a(Entity, i706) :-
    is_a(Entity, n705).
is_a(Entity, j706) :-
    is_a(Entity, n705).
is_a(Entity, n707) :-
    is_a(Entity, n706).
is_a(Entity, i707) :-
    is_a(Entity, n706).
is_a(Entity, j707) :-
    is_a(Entity, n706).
is_a(Entity, n708) :-
    is_a(Entity, n707).
is_a(Entity, i708) :-
    is_a(Entity, n707).
is_a(Entity, j708) :-
    is_a(Entity, n707).
is_a(Entity, n709) :-
    is_a(Entity, n708).
is_a(Entity, i709) :-
    is_a(Entity, n708).
is_a(Entity, j709) :-
    is_a(Entity, n708).
is_a(Entity, n710) :-
    is_a(Entity, n709).
is_a(Entity, i710) :-
    is_a(Entity, n709).
is_a(Entity, j710) :-
    is_a(Entity, n709).
is_a(Entity, n711) :-
    is_a(Entity, n710).
is_a(Entity, i711) :-
    is_a(Entity, n710).
is_a(Entity, j711) :-
    is_a(Entity, n710).
is_a(Entity, n712) :-
    is_a(Entity, n711).
is_a(Entity, i712) :-
    is_a(Entity, n711).
is_a(Entity, j712) :-
    is_a(Entity, n711).
is_a(Entity, n713) :-
    is_a(Entity, n712).
is_a(Entity, i713) :-
    is_a(Entity, n712).
is_a(Entity, j713) :-
    is_a(Entity, n712).
is_a(Entity, n714) :-
    is_a(Entity, n713).
is_a(Entity, i714) :-
    is_a(Entity, n713).
is_a(Entity, j714) :-
    is_a(Entity, n713).
is_a(Entity, n715) :-
    is_a(Entity, n714).
is_a(Entity, i715) :-
    is_a(Entity, n714).
is_a(Entity, j715) :-
    is_a(Entity, n714).
is_a(Entity, n716) :-
    is_a(Entity, n715).
is_a(Entity, i716) :-
    is_a(Entity, n715).
is_a(Entity, j716) :-
    is_a(Entity, n715).
is_a(Entity, n717) :-
    is_a(Entity, n716).
is_a(Entity, i717) :-
    is_a(Entity, n716).
is_a(Entity, j717) :-
    is_a(Entity, n716).
is_a(Entity, n718) :-
    is_a(Entity, n717).
is_a(Entity, i718) :-
    is_a(Entity, n717).
is_a(Entity, j718) :-
    is_a(Entity, n717).
is_a(Entity, n719) :-
    is_a(Entity, n718).
is_a(Entity, i719) :-
    is_a(Entity, n718).
is_a(Entity, j719) :-
    is_a(Entity, n718).
is_a(Entity, n720) :-
    is_a(Entity, n719).
is_a(Entity, i720) :-
    is_a(Entity, n719).
is_a(Entity, j720) :-
    is_a(Entity, n719).
is_a(Entity, n721) :-
    is_a(Entity, n720).
is_a(Entity, i721) :-
    is_a(Entity, n720).
is_a(Entity, j721) :-
    is_a(Entity, n720).
is_a(Entity, n722) :-
    is_a(Entity, n721).
is_a(Entity, i722) :-
    is_a(Entity, n721).
is_a(Entity, j722) :-
    is_a(Entity, n721).
is_a(Entity, n723) :-
    is_a(Entity, n722).
is_a(Entity, i723) :-
    is_a(Entity, n722).
is_a(Entity, j723) :-
    is_a(Entity, n722).
is_a(Entity, n724) :-
    is_a(Entity, n723).
is_a(Entity, i724) :-
    is_a(Entity, n723).
is_a(Entity, j724) :-
    is_a(Entity, n723).
is_a(Entity, n725) :-
    is_a(Entity, n724).
is_a(Entity, i725) :-
    is_a(Entity, n724).
is_a(Entity, j725) :-
    is_a(Entity, n724).
is_a(Entity, n726) :-
    is_a(Entity, n725).
is_a(Entity, i726) :-
    is_a(Entity, n725).
is_a(Entity, j726) :-
    is_a(Entity, n725).
is_a(Entity, n727) :-
    is_a(Entity, n726).
is_a(Entity, i727) :-
    is_a(Entity, n726).
is_a(Entity, j727) :-
    is_a(Entity, n726).
is_a(Entity, n728) :-
    is_a(Entity, n727).
is_a(Entity, i728) :-
    is_a(Entity, n727).
is_a(Entity, j728) :-
    is_a(Entity, n727).
is_a(Entity, n729) :-
    is_a(Entity, n728).
is_a(Entity, i729) :-
    is_a(Entity, n728).
is_a(Entity, j729) :-
    is_a(Entity, n728).
is_a(Entity, n730) :-
    is_a(Entity, n729).
is_a(Entity, i730) :-
    is_a(Entity, n729).
is_a(Entity, j730) :-
    is_a(Entity, n729).
is_a(Entity, n731) :-
    is_a(Entity, n730).
is_a(Entity, i731) :-
    is_a(Entity, n730).
is_a(Entity, j731) :-
    is_a(Entity, n730).
is_a(Entity, n732) :-
    is_a(Entity, n731).
is_a(Entity, i732) :-
    is_a(Entity, n731).
is_a(Entity, j732) :-
    is_a(Entity, n731).
is_a(Entity, n733) :-
    is_a(Entity, n732).
is_a(Entity, i733) :-
    is_a(Entity, n732).
is_a(Entity, j733) :-
    is_a(Entity, n732).
is_a(Entity, n734) :-
    is_a(Entity, n733).
is_a(Entity, i734) :-
    is_a(Entity, n733).
is_a(Entity, j734) :-
    is_a(Entity, n733).
is_a(Entity, n735) :-
    is_a(Entity, n734).
is_a(Entity, i735) :-
    is_a(Entity, n734).
is_a(Entity, j735) :-
    is_a(Entity, n734).
is_a(Entity, n736) :-
    is_a(Entity, n735).
is_a(Entity, i736) :-
    is_a(Entity, n735).
is_a(Entity, j736) :-
    is_a(Entity, n735).
is_a(Entity, n737) :-
    is_a(Entity, n736).
is_a(Entity, i737) :-
    is_a(Entity, n736).
is_a(Entity, j737) :-
    is_a(Entity, n736).
is_a(Entity, n738) :-
    is_a(Entity, n737).
is_a(Entity, i738) :-
    is_a(Entity, n737).
is_a(Entity, j738) :-
    is_a(Entity, n737).
is_a(Entity, n739) :-
    is_a(Entity, n738).
is_a(Entity, i739) :-
    is_a(Entity, n738).
is_a(Entity, j739) :-
    is_a(Entity, n738).
is_a(Entity, n740) :-
    is_a(Entity, n739).
is_a(Entity, i740) :-
    is_a(Entity, n739).
is_a(Entity, j740) :-
    is_a(Entity, n739).
is_a(Entity, n741) :-
    is_a(Entity, n740).
is_a(Entity, i741) :-
    is_a(Entity, n740).
is_a(Entity, j741) :-
    is_a(Entity, n740).
is_a(Entity, n742) :-
    is_a(Entity, n741).
is_a(Entity, i742) :-
    is_a(Entity, n741).
is_a(Entity, j742) :-
    is_a(Entity, n741).
is_a(Entity, n743) :-
    is_a(Entity, n742).
is_a(Entity, i743) :-
    is_a(Entity, n742).
is_a(Entity, j743) :-
    is_a(Entity, n742).
is_a(Entity, n744) :-
    is_a(Entity, n743).
is_a(Entity, i744) :-
    is_a(Entity, n743).
is_a(Entity, j744) :-
    is_a(Entity, n743).
is_a(Entity, n745) :-
    is_a(Entity, n744).
is_a(Entity, i745) :-
    is_a(Entity, n744).
is_a(Entity, j745) :-
    is_a(Entity, n744).
is_a(Entity, n746) :-
    is_a(Entity, n745).
is_a(Entity, i746) :-
    is_a(Entity, n745).
is_a(Entity, j746) :-
    is_a(Entity, n745).
is_a(Entity, n747) :-
    is_a(Entity, n746).
is_a(Entity, i747) :-
    is_a(Entity, n746).
is_a(Entity, j747) :-
    is_a(Entity, n746).
is_a(Entity, n748) :-
    is_a(Entity, n747).
is_a(Entity, i748) :-
    is_a(Entity, n747).
is_a(Entity, j748) :-
    is_a(Entity, n747).
is_a(Entity, n749) :-
    is_a(Entity, n748).
is_a(Entity, i749) :-
    is_a(Entity, n748).
is_a(Entity, j749) :-
    is_a(Entity, n748).
is_a(Entity, n750) :-
    is_a(Entity, n749).
is_a(Entity, i750) :-
    is_a(Entity, n749).
is_a(Entity, j750) :-
    is_a(Entity, n749).
is_a(Entity, n751) :-
    is_a(Entity, n750).
is_a(Entity, i751) :-
    is_a(Entity, n750).
is_a(Entity, j751) :-
    is_a(Entity, n750).
is_a(Entity, n752) :-
    is_a(Entity, n751).
is_a(Entity, i752) :-
    is_a(Entity, n751).
is_a(Entity, j752) :-
    is_a(Entity, n751).
is_a(Entity, n753) :-
    is_a(Entity, n752).
is_a(Entity, i753) :-
    is_a(Entity, n752).
is_a(Entity, j753) :-
    is_a(Entity, n752).
is_a(Entity, n754) :-
    is_a(Entity, n753).
is_a(Entity, i754) :-
    is_a(Entity, n753).
is_a(Entity, j754) :-
    is_a(Entity, n753).
is_a(Entity, n755) :-
    is_a(Entity, n754).
is_a(Entity, i755) :-
    is_a(Entity, n754).
is_a(Entity, j755) :-
    is_a(Entity, n754).
is_a(Entity, n756) :-
    is_a(Entity, n755).
is_a(Entity, i756) :-
    is_a(Entity, n755).
is_a(Entity, j756) :-
    is_a(Entity, n755).
is_a(Entity, n757) :-
    is_a(Entity, n756).
is_a(Entity, i757) :-
    is_a(Entity, n756).
is_a(Entity, j757) :-
    is_a(Entity, n756).
is_a(Entity, n758) :-
    is_a(Entity, n757).
is_a(Entity, i758) :-
    is_a(Entity, n757).
is_a(Entity, j758) :-
    is_a(Entity, n757).
is_a(Entity, n759) :-
    is_a(Entity, n758).
is_a(Entity, i759) :-
    is_a(Entity, n758).
is_a(Entity, j759) :-
    is_a(Entity, n758).
is_a(Entity, n760) :-
    is_a(Entity, n759).
is_a(Entity, i760) :-
    is_a(Entity, n759).
is_a(Entity, j760) :-
    is_a(Entity, n759).
is_a(Entity, n761) :-
    is_a(Entity, n760).
is_a(Entity, i761) :-
    is_a(Entity, n760).
is_a(Entity, j761) :-
    is_a(Entity, n760).
is_a(Entity, n762) :-
    is_a(Entity, n761).
is_a(Entity, i762) :-
    is_a(Entity, n761).
is_a(Entity, j762) :-
    is_a(Entity, n761).
is_a(Entity, n763) :-
    is_a(Entity, n762).
is_a(Entity, i763) :-
    is_a(Entity, n762).
is_a(Entity, j763) :-
    is_a(Entity, n762).
is_a(Entity, n764) :-
    is_a(Entity, n763).
is_a(Entity, i764) :-
    is_a(Entity, n763).
is_a(Entity, j764) :-
    is_a(Entity, n763).
is_a(Entity, n765) :-
    is_a(Entity, n764).
is_a(Entity, i765) :-
    is_a(Entity, n764).
is_a(Entity, j765) :-
    is_a(Entity, n764).
is_a(Entity, n766) :-
    is_a(Entity, n765).
is_a(Entity, i766) :-
    is_a(Entity, n765).
is_a(Entity, j766) :-
    is_a(Entity, n765).
is_a(Entity, n767) :-
    is_a(Entity, n766).
is_a(Entity, i767) :-
    is_a(Entity, n766).
is_a(Entity, j767) :-
    is_a(Entity, n766).
is_a(Entity, n768) :-
    is_a(Entity, n767).
is_a(Entity, i768) :-
    is_a(Entity, n767).
is_a(Entity, j768) :-
    is_a(Entity, n767).
is_a(Entity, n769) :-
    is_a(Entity, n768).
is_a(Entity, i769) :-
    is_a(Entity, n768).
is_a(Entity, j769) :-
    is_a(Entity, n768).
is_a(Entity, n770) :-
    is_a(Entity, n769).
is_a(Entity, i770) :-
    is_a(Entity, n769).
is_a(Entity, j770) :-
    is_a(Entity, n769).
is_a(Entity, n771) :-
    is_a(Entity, n770).
is_a(Entity, i771) :-
    is_a(Entity, n770).
is_a(Entity, j771) :-
    is_a(Entity, n770).
is_a(Entity, n772) :-
    is_a(Entity, n771).
is_a(Entity, i772) :-
    is_a(Entity, n771).
is_a(Entity, j772) :-
    is_a(Entity, n771).
is_a(Entity, n773) :-
    is_a(Entity, n772).
is_a(Entity, i773) :-
    is_a(Entity, n772).
is_a(Entity, j773) :-
    is_a(Entity, n772).
is_a(Entity, n774) :-
    is_a(Entity, n773).
is_a(Entity, i774) :-
    is_a(Entity, n773).
is_a(Entity, j774) :-
    is_a(Entity, n773).
is_a(Entity, n775) :-
    is_a(Entity, n774).
is_a(Entity, i775) :-
    is_a(Entity, n774).
is_a(Entity, j775) :-
    is_a(Entity, n774).
is_a(Entity, n776) :-
    is_a(Entity, n775).
is_a(Entity, i776) :-
    is_a(Entity, n775).
is_a(Entity, j776) :-
    is_a(Entity, n775).
is_a(Entity, n777) :-
    is_a(Entity, n776).
is_a(Entity, i777) :-
    is_a(Entity, n776).
is_a(Entity, j777) :-
    is_a(Entity, n776).
is_a(Entity, n778) :-
    is_a(Entity, n777).
is_a(Entity, i778) :-
    is_a(Entity, n777).
is_a(Entity, j778) :-
    is_a(Entity, n777).
is_a(Entity, n779) :-
    is_a(Entity, n778).
is_a(Entity, i779) :-
    is_a(Entity, n778).
is_a(Entity, j779) :-
    is_a(Entity, n778).
is_a(Entity, n780) :-
    is_a(Entity, n779).
is_a(Entity, i780) :-
    is_a(Entity, n779).
is_a(Entity, j780) :-
    is_a(Entity, n779).
is_a(Entity, n781) :-
    is_a(Entity, n780).
is_a(Entity, i781) :-
    is_a(Entity, n780).
is_a(Entity, j781) :-
    is_a(Entity, n780).
is_a(Entity, n782) :-
    is_a(Entity, n781).
is_a(Entity, i782) :-
    is_a(Entity, n781).
is_a(Entity, j782) :-
    is_a(Entity, n781).
is_a(Entity, n783) :-
    is_a(Entity, n782).
is_a(Entity, i783) :-
    is_a(Entity, n782).
is_a(Entity, j783) :-
    is_a(Entity, n782).
is_a(Entity, n784) :-
    is_a(Entity, n783).
is_a(Entity, i784) :-
    is_a(Entity, n783).
is_a(Entity, j784) :-
    is_a(Entity, n783).
is_a(Entity, n785) :-
    is_a(Entity, n784).
is_a(Entity, i785) :-
    is_a(Entity, n784).
is_a(Entity, j785) :-
    is_a(Entity, n784).
is_a(Entity, n786) :-
    is_a(Entity, n785).
is_a(Entity, i786) :-
    is_a(Entity, n785).
is_a(Entity, j786) :-
    is_a(Entity, n785).
is_a(Entity, n787) :-
    is_a(Entity, n786).
is_a(Entity, i787) :-
    is_a(Entity, n786).
is_a(Entity, j787) :-
    is_a(Entity, n786).
is_a(Entity, n788) :-
    is_a(Entity, n787).
is_a(Entity, i788) :-
    is_a(Entity, n787).
is_a(Entity, j788) :-
    is_a(Entity, n787).
is_a(Entity, n789) :-
    is_a(Entity, n788).
is_a(Entity, i789) :-
    is_a(Entity, n788).
is_a(Entity, j789) :-
    is_a(Entity, n788).
is_a(Entity, n790) :-
    is_a(Entity, n789).
is_a(Entity, i790) :-
    is_a(Entity, n789).
is_a(Entity, j790) :-
    is_a(Entity, n789).
is_a(Entity, n791) :-
    is_a(Entity, n790).
is_a(Entity, i791) :-
    is_a(Entity, n790).
is_a(Entity, j791) :-
    is_a(Entity, n790).
is_a(Entity, n792) :-
    is_a(Entity, n791).
is_a(Entity, i792) :-
    is_a(Entity, n791).
is_a(Entity, j792) :-
    is_a(Entity, n791).
is_a(Entity, n793) :-
    is_a(Entity, n792).
is_a(Entity, i793) :-
    is_a(Entity, n792).
is_a(Entity, j793) :-
    is_a(Entity, n792).
is_a(Entity, n794) :-
    is_a(Entity, n793).
is_a(Entity, i794) :-
    is_a(Entity, n793).
is_a(Entity, j794) :-
    is_a(Entity, n793).
is_a(Entity, n795) :-
    is_a(Entity, n794).
is_a(Entity, i795) :-
    is_a(Entity, n794).
is_a(Entity, j795) :-
    is_a(Entity, n794).
is_a(Entity, n796) :-
    is_a(Entity, n795).
is_a(Entity, i796) :-
    is_a(Entity, n795).
is_a(Entity, j796) :-
    is_a(Entity, n795).
is_a(Entity, n797) :-
    is_a(Entity, n796).
is_a(Entity, i797) :-
    is_a(Entity, n796).
is_a(Entity, j797) :-
    is_a(Entity, n796).
is_a(Entity, n798) :-
    is_a(Entity, n797).
is_a(Entity, i798) :-
    is_a(Entity, n797).
is_a(Entity, j798) :-
    is_a(Entity, n797).
is_a(Entity, n799) :-
    is_a(Entity, n798).
is_a(Entity, i799) :-
    is_a(Entity, n798).
is_a(Entity, j799) :-
    is_a(Entity, n798).
is_a(Entity, n800) :-
    is_a(Entity, n799).
is_a(Entity, i800) :-
    is_a(Entity, n799).
is_a(Entity, j800) :-
    is_a(Entity, n799).
is_a(Entity, n801) :-
    is_a(Entity, n800).
is_a(Entity, i801) :-
    is_a(Entity, n800).
is_a(Entity, j801) :-
    is_a(Entity, n800).
is_a(Entity, n802) :-
    is_a(Entity, n801).
is_a(Entity, i802) :-
    is_a(Entity, n801).
is_a(Entity, j802) :-
    is_a(Entity, n801).
is_a(Entity, n803) :-
    is_a(Entity, n802).
is_a(Entity, i803) :-
    is_a(Entity, n802).
is_a(Entity, j803) :-
    is_a(Entity, n802).
is_a(Entity, n804) :-
    is_a(Entity, n803).
is_a(Entity, i804) :-
    is_a(Entity, n803).
is_a(Entity, j804) :-
    is_a(Entity, n803).
is_a(Entity, n805) :-
    is_a(Entity, n804).
is_a(Entity, i805) :-
    is_a(Entity, n804).
is_a(Entity, j805) :-
    is_a(Entity, n804).
is_a(Entity, n806) :-
    is_a(Entity, n805).
is_a(Entity, i806) :-
    is_a(Entity, n805).
is_a(Entity, j806) :-
    is_a(Entity, n805).
is_a(Entity, n807) :-
    is_a(Entity, n806).
is_a(Entity, i807) :-
    is_a(Entity, n806).
is_a(Entity, j807) :-
    is_a(Entity, n806).
is_a(Entity, n808) :-
    is_a(Entity, n807).
is_a(Entity, i808) :-
    is_a(Entity, n807).
is_a(Entity, j808) :-
    is_a(Entity, n807).
is_a(Entity, n809) :-
    is_a(Entity, n808).
is_a(Entity, i809) :-
    is_a(Entity, n808).
is_a(Entity, j809) :-
    is_a(Entity, n808).
is_a(Entity, n810) :-
    is_a(Entity, n809).
is_a(Entity, i810) :-
    is_a(Entity, n809).
is_a(Entity, j810) :-
    is_a(Entity, n809).
is_a(Entity, n811) :-
    is_a(Entity, n810).
is_a(Entity, i811) :-
    is_a(Entity, n810).
is_a(Entity, j811) :-
    is_a(Entity, n810).
is_a(Entity, n812) :-
    is_a(Entity, n811).
is_a(Entity, i812) :-
    is_a(Entity, n811).
is_a(Entity, j812) :-
    is_a(Entity, n811).
is_a(Entity, n813) :-
    is_a(Entity, n812).
is_a(Entity, i813) :-
    is_a(Entity, n812).
is_a(Entity, j813) :-
    is_a(Entity, n812).
is_a(Entity, n814) :-
    is_a(Entity, n813).
is_a(Entity, i814) :-
    is_a(Entity, n813).
is_a(Entity, j814) :-
    is_a(Entity, n813).
is_a(Entity, n815) :-
    is_a(Entity, n814).
is_a(Entity, i815) :-
    is_a(Entity, n814).
is_a(Entity, j815) :-
    is_a(Entity, n814).
is_a(Entity, n816) :-
    is_a(Entity, n815).
is_a(Entity, i816) :-
    is_a(Entity, n815).
is_a(Entity, j816) :-
    is_a(Entity, n815).
is_a(Entity, n817) :-
    is_a(Entity, n816).
is_a(Entity, i817) :-
    is_a(Entity, n816).
is_a(Entity, j817) :-
    is_a(Entity, n816).
is_a(Entity, n818) :-
    is_a(Entity, n817).
is_a(Entity, i818) :-
    is_a(Entity, n817).
is_a(Entity, j818) :-
    is_a(Entity, n817).
is_a(Entity, n819) :-
    is_a(Entity, n818).
is_a(Entity, i819) :-
    is_a(Entity, n818).
is_a(Entity, j819) :-
    is_a(Entity, n818).
is_a(Entity, n820) :-
    is_a(Entity, n819).
is_a(Entity, i820) :-
    is_a(Entity, n819).
is_a(Entity, j820) :-
    is_a(Entity, n819).
is_a(Entity, n821) :-
    is_a(Entity, n820).
is_a(Entity, i821) :-
    is_a(Entity, n820).
is_a(Entity, j821) :-
    is_a(Entity, n820).
is_a(Entity, n822) :-
    is_a(Entity, n821).
is_a(Entity, i822) :-
    is_a(Entity, n821).
is_a(Entity, j822) :-
    is_a(Entity, n821).
is_a(Entity, n823) :-
    is_a(Entity, n822).
is_a(Entity, i823) :-
    is_a(Entity, n822).
is_a(Entity, j823) :-
    is_a(Entity, n822).
is_a(Entity, n824) :-
    is_a(Entity, n823).
is_a(Entity, i824) :-
    is_a(Entity, n823).
is_a(Entity, j824) :-
    is_a(Entity, n823).
is_a(Entity, n825) :-
    is_a(Entity, n824).
is_a(Entity, i825) :-
    is_a(Entity, n824).
is_a(Entity, j825) :-
    is_a(Entity, n824).
is_a(Entity, n826) :-
    is_a(Entity, n825).
is_a(Entity, i826) :-
    is_a(Entity, n825).
is_a(Entity, j826) :-
    is_a(Entity, n825).
is_a(Entity, n827) :-
    is_a(Entity, n826).
is_a(Entity, i827) :-
    is_a(Entity, n826).
is_a(Entity, j827) :-
    is_a(Entity, n826).
is_a(Entity, n828) :-
    is_a(Entity, n827).
is_a(Entity, i828) :-
    is_a(Entity, n827).
is_a(Entity, j828) :-
    is_a(Entity, n827).
is_a(Entity, n829) :-
    is_a(Entity, n828).
is_a(Entity, i829) :-
    is_a(Entity, n828).
is_a(Entity, j829) :-
    is_a(Entity, n828).
is_a(Entity, n830) :-
    is_a(Entity, n829).
is_a(Entity, i830) :-
    is_a(Entity, n829).
is_a(Entity, j830) :-
    is_a(Entity, n829).
is_a(Entity, n831) :-
    is_a(Entity, n830).
is_a(Entity, i831) :-
    is_a(Entity, n830).
is_a(Entity, j831) :-
    is_a(Entity, n830).
is_a(Entity, n832) :-
    is_a(Entity, n831).
is_a(Entity, i832) :-
    is_a(Entity, n831).
is_a(Entity, j832) :-
    is_a(Entity, n831).
is_a(Entity, n833) :-
    is_a(Entity, n832).
is_a(Entity, i833) :-
    is_a(Entity, n832).
is_a(Entity, j833) :-
    is_a(Entity, n832).
is_a(Entity, n834) :-
    is_a(Entity, n833).
is_a(Entity, i834) :-
    is_a(Entity, n833).
is_a(Entity, j834) :-
    is_a(Entity, n833).
is_a(Entity, n835) :-
    is_a(Entity, n834).
is_a(Entity, i835) :-
    is_a(Entity, n834).
is_a(Entity, j835) :-
    is_a(Entity, n834).
is_a(Entity, n836) :-
    is_a(Entity, n835).
is_a(Entity, i836) :-
    is_a(Entity, n835).
is_a(Entity, j836) :-
    is_a(Entity, n835).
is_a(Entity, n837) :-
    is_a(Entity, n836).
is_a(Entity, i837) :-
    is_a(Entity, n836).
is_a(Entity, j837) :-
    is_a(Entity, n836).
is_a(Entity, n838) :-
    is_a(Entity, n837).
is_a(Entity, i838) :-
    is_a(Entity, n837).
is_a(Entity, j838) :-
    is_a(Entity, n837).
is_a(Entity, n839) :-
    is_a(Entity, n838).
is_a(Entity, i839) :-
    is_a(Entity, n838).
is_a(Entity, j839) :-
    is_a(Entity, n838).
is_a(Entity, n840) :-
    is_a(Entity, n839).
is_a(Entity, i840) :-
    is_a(Entity, n839).
is_a(Entity, j840) :-
    is_a(Entity, n839).
is_a(Entity, n841) :-
    is_a(Entity, n840).
is_a(Entity, i841) :-
    is_a(Entity, n840).
is_a(Entity, j841) :-
    is_a(Entity, n840).
is_a(Entity, n842) :-
    is_a(Entity, n841).
is_a(Entity, i842) :-
    is_a(Entity, n841).
is_a(Entity, j842) :-
    is_a(Entity, n841).
is_a(Entity, n843) :-
    is_a(Entity, n842).
is_a(Entity, i843) :-
    is_a(Entity, n842).
is_a(Entity, j843) :-
    is_a(Entity, n842).
is_a(Entity, n844) :-
    is_a(Entity, n843).
is_a(Entity, i844) :-
    is_a(Entity, n843).
is_a(Entity, j844) :-
    is_a(Entity, n843).
is_a(Entity, n845) :-
    is_a(Entity, n844).
is_a(Entity, i845) :-
    is_a(Entity, n844).
is_a(Entity, j845) :-
    is_a(Entity, n844).
is_a(Entity, n846) :-
    is_a(Entity, n845).
is_a(Entity, i846) :-
    is_a(Entity, n845).
is_a(Entity, j846) :-
    is_a(Entity, n845).
is_a(Entity, n847) :-
    is_a(Entity, n846).
is_a(Entity, i847) :-
    is_a(Entity, n846).
is_a(Entity, j847) :-
    is_a(Entity, n846).
is_a(Entity, n848) :-
    is_a(Entity, n847).
is_a(Entity, i848) :-
    is_a(Entity, n847).
is_a(Entity, j848) :-
    is_a(Entity, n847).
is_a(Entity, n849) :-
    is_a(Entity, n848).
is_a(Entity, i849) :-
    is_a(Entity, n848).
is_a(Entity, j849) :-
    is_a(Entity, n848).
is_a(Entity, n850) :-
    is_a(Entity, n849).
is_a(Entity, i850) :-
    is_a(Entity, n849).
is_a(Entity, j850) :-
    is_a(Entity, n849).
is_a(Entity, n851) :-
    is_a(Entity, n850).
is_a(Entity, i851) :-
    is_a(Entity, n850).
is_a(Entity, j851) :-
    is_a(Entity, n850).
is_a(Entity, n852) :-
    is_a(Entity, n851).
is_a(Entity, i852) :-
    is_a(Entity, n851).
is_a(Entity, j852) :-
    is_a(Entity, n851).
is_a(Entity, n853) :-
    is_a(Entity, n852).
is_a(Entity, i853) :-
    is_a(Entity, n852).
is_a(Entity, j853) :-
    is_a(Entity, n852).
is_a(Entity, n854) :-
    is_a(Entity, n853).
is_a(Entity, i854) :-
    is_a(Entity, n853).
is_a(Entity, j854) :-
    is_a(Entity, n853).
is_a(Entity, n855) :-
    is_a(Entity, n854).
is_a(Entity, i855) :-
    is_a(Entity, n854).
is_a(Entity, j855) :-
    is_a(Entity, n854).
is_a(Entity, n856) :-
    is_a(Entity, n855).
is_a(Entity, i856) :-
    is_a(Entity, n855).
is_a(Entity, j856) :-
    is_a(Entity, n855).
is_a(Entity, n857) :-
    is_a(Entity, n856).
is_a(Entity, i857) :-
    is_a(Entity, n856).
is_a(Entity, j857) :-
    is_a(Entity, n856).
is_a(Entity, n858) :-
    is_a(Entity, n857).
is_a(Entity, i858) :-
    is_a(Entity, n857).
is_a(Entity, j858) :-
    is_a(Entity, n857).
is_a(Entity, n859) :-
    is_a(Entity, n858).
is_a(Entity, i859) :-
    is_a(Entity, n858).
is_a(Entity, j859) :-
    is_a(Entity, n858).
is_a(Entity, n860) :-
    is_a(Entity, n859).
is_a(Entity, i860) :-
    is_a(Entity, n859).
is_a(Entity, j860) :-
    is_a(Entity, n859).
is_a(Entity, n861) :-
    is_a(Entity, n860).
is_a(Entity, i861) :-
    is_a(Entity, n860).
is_a(Entity, j861) :-
    is_a(Entity, n860).
is_a(Entity, n862) :-
    is_a(Entity, n861).
is_a(Entity, i862) :-
    is_a(Entity, n861).
is_a(Entity, j862) :-
    is_a(Entity, n861).
is_a(Entity, n863) :-
    is_a(Entity, n862).
is_a(Entity, i863) :-
    is_a(Entity, n862).
is_a(Entity, j863) :-
    is_a(Entity, n862).
is_a(Entity, n864) :-
    is_a(Entity, n863).
is_a(Entity, i864) :-
    is_a(Entity, n863).
is_a(Entity, j864) :-
    is_a(Entity, n863).
is_a(Entity, n865) :-
    is_a(Entity, n864).
is_a(Entity, i865) :-
    is_a(Entity, n864).
is_a(Entity, j865) :-
    is_a(Entity, n864).
is_a(Entity, n866) :-
    is_a(Entity, n865).
is_a(Entity, i866) :-
    is_a(Entity, n865).
is_a(Entity, j866) :-
    is_a(Entity, n865).
is_a(Entity, n867) :-
    is_a(Entity, n866).
is_a(Entity, i867) :-
    is_a(Entity, n866).
is_a(Entity, j867) :-
    is_a(Entity, n866).
is_a(Entity, n868) :-
    is_a(Entity, n867).
is_a(Entity, i868) :-
    is_a(Entity, n867).
is_a(Entity, j868) :-
    is_a(Entity, n867).
is_a(Entity, n869) :-
    is_a(Entity, n868).
is_a(Entity, i869) :-
    is_a(Entity, n868).
is_a(Entity, j869) :-
    is_a(Entity, n868).
is_a(Entity, n870) :-
    is_a(Entity, n869).
is_a(Entity, i870) :-
    is_a(Entity, n869).
is_a(Entity, j870) :-
    is_a(Entity, n869).
is_a(Entity, n871) :-
    is_a(Entity, n870).
is_a(Entity, i871) :-
    is_a(Entity, n870).
is_a(Entity, j871) :-
    is_a(Entity, n870).
is_a(Entity, n872) :-
    is_a(Entity, n871).
is_a(Entity, i872) :-
    is_a(Entity, n871).
is_a(Entity, j872) :-
    is_a(Entity, n871).
is_a(Entity, n873) :-
    is_a(Entity, n872).
is_a(Entity, i873) :-
    is_a(Entity, n872).
is_a(Entity, j873) :-
    is_a(Entity, n872).
is_a(Entity, n874) :-
    is_a(Entity, n873).
is_a(Entity, i874) :-
    is_a(Entity, n873).
is_a(Entity, j874) :-
    is_a(Entity, n873).
is_a(Entity, n875) :-
    is_a(Entity, n874).
is_a(Entity, i875) :-
    is_a(Entity, n874).
is_a(Entity, j875) :-
    is_a(Entity, n874).
is_a(Entity, n876) :-
    is_a(Entity, n875).
is_a(Entity, i876) :-
    is_a(Entity, n875).
is_a(Entity, j876) :-
    is_a(Entity, n875).
is_a(Entity, n877) :-
    is_a(Entity, n876).
is_a(Entity, i877) :-
    is_a(Entity, n876).
is_a(Entity, j877) :-
    is_a(Entity, n876).
is_a(Entity, n878) :-
    is_a(Entity, n877).
is_a(Entity, i878) :-
    is_a(Entity, n877).
is_a(Entity, j878) :-
    is_a(Entity, n877).
is_a(Entity, n879) :-
    is_a(Entity, n878).
is_a(Entity, i879) :-
    is_a(Entity, n878).
is_a(Entity, j879) :-
    is_a(Entity, n878).
is_a(Entity, n880) :-
    is_a(Entity, n879).
is_a(Entity, i880) :-
    is_a(Entity, n879).
is_a(Entity, j880) :-
    is_a(Entity, n879).
is_a(Entity, n881) :-
    is_a(Entity, n880).
is_a(Entity, i881) :-
    is_a(Entity, n880).
is_a(Entity, j881) :-
    is_a(Entity, n880).
is_a(Entity, n882) :-
    is_a(Entity, n881).
is_a(Entity, i882) :-
    is_a(Entity, n881).
is_a(Entity, j882) :-
    is_a(Entity, n881).
is_a(Entity, n883) :-
    is_a(Entity, n882).
is_a(Entity, i883) :-
    is_a(Entity, n882).
is_a(Entity, j883) :-
    is_a(Entity, n882).
is_a(Entity, n884) :-
    is_a(Entity, n883).
is_a(Entity, i884) :-
    is_a(Entity, n883).
is_a(Entity, j884) :-
    is_a(Entity, n883).
is_a(Entity, n885) :-
    is_a(Entity, n884).
is_a(Entity, i885) :-
    is_a(Entity, n884).
is_a(Entity, j885) :-
    is_a(Entity, n884).
is_a(Entity, n886) :-
    is_a(Entity, n885).
is_a(Entity, i886) :-
    is_a(Entity, n885).
is_a(Entity, j886) :-
    is_a(Entity, n885).
is_a(Entity, n887) :-
    is_a(Entity, n886).
is_a(Entity, i887) :-
    is_a(Entity, n886).
is_a(Entity, j887) :-
    is_a(Entity, n886).
is_a(Entity, n888) :-
    is_a(Entity, n887).
is_a(Entity, i888) :-
    is_a(Entity, n887).
is_a(Entity, j888) :-
    is_a(Entity, n887).
is_a(Entity, n889) :-
    is_a(Entity, n888).
is_a(Entity, i889) :-
    is_a(Entity, n888).
is_a(Entity, j889) :-
    is_a(Entity, n888).
is_a(Entity, n890) :-
    is_a(Entity, n889).
is_a(Entity, i890) :-
    is_a(Entity, n889).
is_a(Entity, j890) :-
    is_a(Entity, n889).
is_a(Entity, n891) :-
    is_a(Entity, n890).
is_a(Entity, i891) :-
    is_a(Entity, n890).
is_a(Entity, j891) :-
    is_a(Entity, n890).
is_a(Entity, n892) :-
    is_a(Entity, n891).
is_a(Entity, i892) :-
    is_a(Entity, n891).
is_a(Entity, j892) :-
    is_a(Entity, n891).
is_a(Entity, n893) :-
    is_a(Entity, n892).
is_a(Entity, i893) :-
    is_a(Entity, n892).
is_a(Entity, j893) :-
    is_a(Entity, n892).
is_a(Entity, n894) :-
    is_a(Entity, n893).
is_a(Entity, i894) :-
    is_a(Entity, n893).
is_a(Entity, j894) :-
    is_a(Entity, n893).
is_a(Entity, n895) :-
    is_a(Entity, n894).
is_a(Entity, i895) :-
    is_a(Entity, n894).
is_a(Entity, j895) :-
    is_a(Entity, n894).
is_a(Entity, n896) :-
    is_a(Entity, n895).
is_a(Entity, i896) :-
    is_a(Entity, n895).
is_a(Entity, j896) :-
    is_a(Entity, n895).
is_a(Entity, n897) :-
    is_a(Entity, n896).
is_a(Entity, i897) :-
    is_a(Entity, n896).
is_a(Entity, j897) :-
    is_a(Entity, n896).
is_a(Entity, n898) :-
    is_a(Entity, n897).
is_a(Entity, i898) :-
    is_a(Entity, n897).
is_a(Entity, j898) :-
    is_a(Entity, n897).
is_a(Entity, n899) :-
    is_a(Entity, n898).
is_a(Entity, i899) :-
    is_a(Entity, n898).
is_a(Entity, j899) :-
    is_a(Entity, n898).
is_a(Entity, n900) :-
    is_a(Entity, n899).
is_a(Entity, i900) :-
    is_a(Entity, n899).
is_a(Entity, j900) :-
    is_a(Entity, n899).
is_a(Entity, n901) :-
    is_a(Entity, n900).
is_a(Entity, i901) :-
    is_a(Entity, n900).
is_a(Entity, j901) :-
    is_a(Entity, n900).
is_a(Entity, n902) :-
    is_a(Entity, n901).
is_a(Entity, i902) :-
    is_a(Entity, n901).
is_a(Entity, j902) :-
    is_a(Entity, n901).
is_a(Entity, n903) :-
    is_a(Entity, n902).
is_a(Entity, i903) :-
    is_a(Entity, n902).
is_a(Entity, j903) :-
    is_a(Entity, n902).
is_a(Entity, n904) :-
    is_a(Entity, n903).
is_a(Entity, i904) :-
    is_a(Entity, n903).
is_a(Entity, j904) :-
    is_a(Entity, n903).
is_a(Entity, n905) :-
    is_a(Entity, n904).
is_a(Entity, i905) :-
    is_a(Entity, n904).
is_a(Entity, j905) :-
    is_a(Entity, n904).
is_a(Entity, n906) :-
    is_a(Entity, n905).
is_a(Entity, i906) :-
    is_a(Entity, n905).
is_a(Entity, j906) :-
    is_a(Entity, n905).
is_a(Entity, n907) :-
    is_a(Entity, n906).
is_a(Entity, i907) :-
    is_a(Entity, n906).
is_a(Entity, j907) :-
    is_a(Entity, n906).
is_a(Entity, n908) :-
    is_a(Entity, n907).
is_a(Entity, i908) :-
    is_a(Entity, n907).
is_a(Entity, j908) :-
    is_a(Entity, n907).
is_a(Entity, n909) :-
    is_a(Entity, n908).
is_a(Entity, i909) :-
    is_a(Entity, n908).
is_a(Entity, j909) :-
    is_a(Entity, n908).
is_a(Entity, n910) :-
    is_a(Entity, n909).
is_a(Entity, i910) :-
    is_a(Entity, n909).
is_a(Entity, j910) :-
    is_a(Entity, n909).
is_a(Entity, n911) :-
    is_a(Entity, n910).
is_a(Entity, i911) :-
    is_a(Entity, n910).
is_a(Entity, j911) :-
    is_a(Entity, n910).
is_a(Entity, n912) :-
    is_a(Entity, n911).
is_a(Entity, i912) :-
    is_a(Entity, n911).
is_a(Entity, j912) :-
    is_a(Entity, n911).
is_a(Entity, n913) :-
    is_a(Entity, n912).
is_a(Entity, i913) :-
    is_a(Entity, n912).
is_a(Entity, j913) :-
    is_a(Entity, n912).
is_a(Entity, n914) :-
    is_a(Entity, n913).
is_a(Entity, i914) :-
    is_a(Entity, n913).
is_a(Entity, j914) :-
    is_a(Entity, n913).
is_a(Entity, n915) :-
    is_a(Entity, n914).
is_a(Entity, i915) :-
    is_a(Entity, n914).
is_a(Entity, j915) :-
    is_a(Entity, n914).
is_a(Entity, n916) :-
    is_a(Entity, n915).
is_a(Entity, i916) :-
    is_a(Entity, n915).
is_a(Entity, j916) :-
    is_a(Entity, n915).
is_a(Entity, n917) :-
    is_a(Entity, n916).
is_a(Entity, i917) :-
    is_a(Entity, n916).
is_a(Entity, j917) :-
    is_a(Entity, n916).
is_a(Entity, n918) :-
    is_a(Entity, n917).
is_a(Entity, i918) :-
    is_a(Entity, n917).
is_a(Entity, j918) :-
    is_a(Entity, n917).
is_a(Entity, n919) :-
    is_a(Entity, n918).
is_a(Entity, i919) :-
    is_a(Entity, n918).
is_a(Entity, j919) :-
    is_a(Entity, n918).
is_a(Entity, n920) :-
    is_a(Entity, n919).
is_a(Entity, i920) :-
    is_a(Entity, n919).
is_a(Entity, j920) :-
    is_a(Entity, n919).
is_a(Entity, n921) :-
    is_a(Entity, n920).
is_a(Entity, i921) :-
    is_a(Entity, n920).
is_a(Entity, j921) :-
    is_a(Entity, n920).
is_a(Entity, n922) :-
    is_a(Entity, n921).
is_a(Entity, i922) :-
    is_a(Entity, n921).
is_a(Entity, j922) :-
    is_a(Entity, n921).
is_a(Entity, n923) :-
    is_a(Entity, n922).
is_a(Entity, i923) :-
    is_a(Entity, n922).
is_a(Entity, j923) :-
    is_a(Entity, n922).
is_a(Entity, n924) :-
    is_a(Entity, n923).
is_a(Entity, i924) :-
    is_a(Entity, n923).
is_a(Entity, j924) :-
    is_a(Entity, n923).
is_a(Entity, n925) :-
    is_a(Entity, n924).
is_a(Entity, i925) :-
    is_a(Entity, n924).
is_a(Entity, j925) :-
    is_a(Entity, n924).
is_a(Entity, n926) :-
    is_a(Entity, n925).
is_a(Entity, i926) :-
    is_a(Entity, n925).
is_a(Entity, j926) :-
    is_a(Entity, n925).
is_a(Entity, n927) :-
    is_a(Entity, n926).
is_a(Entity, i927) :-
    is_a(Entity, n926).
is_a(Entity, j927) :-
    is_a(Entity, n926).
is_a(Entity, n928) :-
    is_a(Entity, n927).
is_a(Entity, i928) :-
    is_a(Entity, n927).
is_a(Entity, j928) :-
    is_a(Entity, n927).
is_a(Entity, n929) :-
    is_a(Entity, n928).
is_a(Entity, i929) :-
    is_a(Entity, n928).
is_a(Entity, j929) :-
    is_a(Entity, n928).
is_a(Entity, n930) :-
    is_a(Entity, n929).
is_a(Entity, i930) :-
    is_a(Entity, n929).
is_a(Entity, j930) :-
    is_a(Entity, n929).
is_a(Entity, n931) :-
    is_a(Entity, n930).
is_a(Entity, i931) :-
    is_a(Entity, n930).
is_a(Entity, j931) :-
    is_a(Entity, n930).
is_a(Entity, n932) :-
    is_a(Entity, n931).
is_a(Entity, i932) :-
    is_a(Entity, n931).
is_a(Entity, j932) :-
    is_a(Entity, n931).
is_a(Entity, n933) :-
    is_a(Entity, n932).
is_a(Entity, i933) :-
    is_a(Entity, n932).
is_a(Entity, j933) :-
    is_a(Entity, n932).
is_a(Entity, n934) :-
    is_a(Entity, n933).
is_a(Entity, i934) :-
    is_a(Entity, n933).
is_a(Entity, j934) :-
    is_a(Entity, n933).
is_a(Entity, n935) :-
    is_a(Entity, n934).
is_a(Entity, i935) :-
    is_a(Entity, n934).
is_a(Entity, j935) :-
    is_a(Entity, n934).
is_a(Entity, n936) :-
    is_a(Entity, n935).
is_a(Entity, i936) :-
    is_a(Entity, n935).
is_a(Entity, j936) :-
    is_a(Entity, n935).
is_a(Entity, n937) :-
    is_a(Entity, n936).
is_a(Entity, i937) :-
    is_a(Entity, n936).
is_a(Entity, j937) :-
    is_a(Entity, n936).
is_a(Entity, n938) :-
    is_a(Entity, n937).
is_a(Entity, i938) :-
    is_a(Entity, n937).
is_a(Entity, j938) :-
    is_a(Entity, n937).
is_a(Entity, n939) :-
    is_a(Entity, n938).
is_a(Entity, i939) :-
    is_a(Entity, n938).
is_a(Entity, j939) :-
    is_a(Entity, n938).
is_a(Entity, n940) :-
    is_a(Entity, n939).
is_a(Entity, i940) :-
    is_a(Entity, n939).
is_a(Entity, j940) :-
    is_a(Entity, n939).
is_a(Entity, n941) :-
    is_a(Entity, n940).
is_a(Entity, i941) :-
    is_a(Entity, n940).
is_a(Entity, j941) :-
    is_a(Entity, n940).
is_a(Entity, n942) :-
    is_a(Entity, n941).
is_a(Entity, i942) :-
    is_a(Entity, n941).
is_a(Entity, j942) :-
    is_a(Entity, n941).
is_a(Entity, n943) :-
    is_a(Entity, n942).
is_a(Entity, i943) :-
    is_a(Entity, n942).
is_a(Entity, j943) :-
    is_a(Entity, n942).
is_a(Entity, n944) :-
    is_a(Entity, n943).
is_a(Entity, i944) :-
    is_a(Entity, n943).
is_a(Entity, j944) :-
    is_a(Entity, n943).
is_a(Entity, n945) :-
    is_a(Entity, n944).
is_a(Entity, i945) :-
    is_a(Entity, n944).
is_a(Entity, j945) :-
    is_a(Entity, n944).
is_a(Entity, n946) :-
    is_a(Entity, n945).
is_a(Entity, i946) :-
    is_a(Entity, n945).
is_a(Entity, j946) :-
    is_a(Entity, n945).
is_a(Entity, n947) :-
    is_a(Entity, n946).
is_a(Entity, i947) :-
    is_a(Entity, n946).
is_a(Entity, j947) :-
    is_a(Entity, n946).
is_a(Entity, n948) :-
    is_a(Entity, n947).
is_a(Entity, i948) :-
    is_a(Entity, n947).
is_a(Entity, j948) :-
    is_a(Entity, n947).
is_a(Entity, n949) :-
    is_a(Entity, n948).
is_a(Entity, i949) :-
    is_a(Entity, n948).
is_a(Entity, j949) :-
    is_a(Entity, n948).
is_a(Entity, n950) :-
    is_a(Entity, n949).
is_a(Entity, i950) :-
    is_a(Entity, n949).
is_a(Entity, j950) :-
    is_a(Entity, n949).
is_a(Entity, n951) :-
    is_a(Entity, n950).
is_a(Entity, i951) :-
    is_a(Entity, n950).
is_a(Entity, j951) :-
    is_a(Entity, n950).
is_a(Entity, n952) :-
    is_a(Entity, n951).
is_a(Entity, i952) :-
    is_a(Entity, n951).
is_a(Entity, j952) :-
    is_a(Entity, n951).
is_a(Entity, n953) :-
    is_a(Entity, n952).
is_a(Entity, i953) :-
    is_a(Entity, n952).
is_a(Entity, j953) :-
    is_a(Entity, n952).
is_a(Entity, n954) :-
    is_a(Entity, n953).
is_a(Entity, i954) :-
    is_a(Entity, n953).
is_a(Entity, j954) :-
    is_a(Entity, n953).
is_a(Entity, n955) :-
    is_a(Entity, n954).
is_a(Entity, i955) :-
    is_a(Entity, n954).
is_a(Entity, j955) :-
    is_a(Entity, n954).
is_a(Entity, n956) :-
    is_a(Entity, n955).
is_a(Entity, i956) :-
    is_a(Entity, n955).
is_a(Entity, j956) :-
    is_a(Entity, n955).
is_a(Entity, n957) :-
    is_a(Entity, n956).
is_a(Entity, i957) :-
    is_a(Entity, n956).
is_a(Entity, j957) :-
    is_a(Entity, n956).
is_a(Entity, n958) :-
    is_a(Entity, n957).
is_a(Entity, i958) :-
    is_a(Entity, n957).
is_a(Entity, j958) :-
    is_a(Entity, n957).
is_a(Entity, n959) :-
    is_a(Entity, n958).
is_a(Entity, i959) :-
    is_a(Entity, n958).
is_a(Entity, j959) :-
    is_a(Entity, n958).
is_a(Entity, n960) :-
    is_a(Entity, n959).
is_a(Entity, i960) :-
    is_a(Entity, n959).
is_a(Entity, j960) :-
    is_a(Entity, n959).
is_a(Entity, n961) :-
    is_a(Entity, n960).
is_a(Entity, i961) :-
    is_a(Entity, n960).
is_a(Entity, j961) :-
    is_a(Entity, n960).
is_a(Entity, n962) :-
    is_a(Entity, n961).
is_a(Entity, i962) :-
    is_a(Entity, n961).
is_a(Entity, j962) :-
    is_a(Entity, n961).
is_a(Entity, n963) :-
    is_a(Entity, n962).
is_a(Entity, i963) :-
    is_a(Entity, n962).
is_a(Entity, j963) :-
    is_a(Entity, n962).
is_a(Entity, n964) :-
    is_a(Entity, n963).
is_a(Entity, i964) :-
    is_a(Entity, n963).
is_a(Entity, j964) :-
    is_a(Entity, n963).
is_a(Entity, n965) :-
    is_a(Entity, n964).
is_a(Entity, i965) :-
    is_a(Entity, n964).
is_a(Entity, j965) :-
    is_a(Entity, n964).
is_a(Entity, n966) :-
    is_a(Entity, n965).
is_a(Entity, i966) :-
    is_a(Entity, n965).
is_a(Entity, j966) :-
    is_a(Entity, n965).
is_a(Entity, n967) :-
    is_a(Entity, n966).
is_a(Entity, i967) :-
    is_a(Entity, n966).
is_a(Entity, j967) :-
    is_a(Entity, n966).
is_a(Entity, n968) :-
    is_a(Entity, n967).
is_a(Entity, i968) :-
    is_a(Entity, n967).
is_a(Entity, j968) :-
    is_a(Entity, n967).
is_a(Entity, n969) :-
    is_a(Entity, n968).
is_a(Entity, i969) :-
    is_a(Entity, n968).
is_a(Entity, j969) :-
    is_a(Entity, n968).
is_a(Entity, n970) :-
    is_a(Entity, n969).
is_a(Entity, i970) :-
    is_a(Entity, n969).
is_a(Entity, j970) :-
    is_a(Entity, n969).
is_a(Entity, n971) :-
    is_a(Entity, n970).
is_a(Entity, i971) :-
    is_a(Entity, n970).
is_a(Entity, j971) :-
    is_a(Entity, n970).
is_a(Entity, n972) :-
    is_a(Entity, n971).
is_a(Entity, i972) :-
    is_a(Entity, n971).
is_a(Entity, j972) :-
    is_a(Entity, n971).
is_a(Entity, n973) :-
    is_a(Entity, n972).
is_a(Entity, i973) :-
    is_a(Entity, n972).
is_a(Entity, j973) :-
    is_a(Entity, n972).
is_a(Entity, n974) :-
    is_a(Entity, n973).
is_a(Entity, i974) :-
    is_a(Entity, n973).
is_a(Entity, j974) :-
    is_a(Entity, n973).
is_a(Entity, n975) :-
    is_a(Entity, n974).
is_a(Entity, i975) :-
    is_a(Entity, n974).
is_a(Entity, j975) :-
    is_a(Entity, n974).
is_a(Entity, n976) :-
    is_a(Entity, n975).
is_a(Entity, i976) :-
    is_a(Entity, n975).
is_a(Entity, j976) :-
    is_a(Entity, n975).
is_a(Entity, n977) :-
    is_a(Entity, n976).
is_a(Entity, i977) :-
    is_a(Entity, n976).
is_a(Entity, j977) :-
    is_a(Entity, n976).
is_a(Entity, n978) :-
    is_a(Entity, n977).
is_a(Entity, i978) :-
    is_a(Entity, n977).
is_a(Entity, j978) :-
    is_a(Entity, n977).
is_a(Entity, n979) :-
    is_a(Entity, n978).
is_a(Entity, i979) :-
    is_a(Entity, n978).
is_a(Entity, j979) :-
    is_a(Entity, n978).
is_a(Entity, n980) :-
    is_a(Entity, n979).
is_a(Entity, i980) :-
    is_a(Entity, n979).
is_a(Entity, j980) :-
    is_a(Entity, n979).
is_a(Entity, n981) :-
    is_a(Entity, n980).
is_a(Entity, i981) :-
    is_a(Entity, n980).
is_a(Entity, j981) :-
    is_a(Entity, n980).
is_a(Entity, n982) :-
    is_a(Entity, n981).
is_a(Entity, i982) :-
    is_a(Entity, n981).
is_a(Entity, j982) :-
    is_a(Entity, n981).
is_a(Entity, n983) :-
    is_a(Entity, n982).
is_a(Entity, i983) :-
    is_a(Entity, n982).
is_a(Entity, j983) :-
    is_a(Entity, n982).
is_a(Entity, n984) :-
    is_a(Entity, n983).
is_a(Entity, i984) :-
    is_a(Entity, n983).
is_a(Entity, j984) :-
    is_a(Entity, n983).
is_a(Entity, n985) :-
    is_a(Entity, n984).
is_a(Entity, i985) :-
    is_a(Entity, n984).
is_a(Entity, j985) :-
    is_a(Entity, n984).
is_a(Entity, n986) :-
    is_a(Entity, n985).
is_a(Entity, i986) :-
    is_a(Entity, n985).
is_a(Entity, j986) :-
    is_a(Entity, n985).
is_a(Entity, n987) :-
    is_a(Entity, n986).
is_a(Entity, i987) :-
    is_a(Entity, n986).
is_a(Entity, j987) :-
    is_a(Entity, n986).
is_a(Entity, n988) :-
    is_a(Entity, n987).
is_a(Entity, i988) :-
    is_a(Entity, n987).
is_a(Entity, j988) :-
    is_a(Entity, n987).
is_a(Entity, n989) :-
    is_a(Entity, n988).
is_a(Entity, i989) :-
    is_a(Entity, n988).
is_a(Entity, j989) :-
    is_a(Entity, n988).
is_a(Entity, n990) :-
    is_a(Entity, n989).
is_a(Entity, i990) :-
    is_a(Entity, n989).
is_a(Entity, j990) :-
    is_a(Entity, n989).
is_a(Entity, n991) :-
    is_a(Entity, n990).
is_a(Entity, i991) :-
    is_a(Entity, n990).
is_a(Entity, j991) :-
    is_a(Entity, n990).
is_a(Entity, n992) :-
    is_a(Entity, n991).
is_a(Entity, i992) :-
    is_a(Entity, n991).
is_a(Entity, j992) :-
    is_a(Entity, n991).
is_a(Entity, n993) :-
    is_a(Entity, n992).
is_a(Entity, i993) :-
    is_a(Entity, n992).
is_a(Entity, j993) :-
    is_a(Entity, n992).
is_a(Entity, n994) :-
    is_a(Entity, n993).
is_a(Entity, i994) :-
    is_a(Entity, n993).
is_a(Entity, j994) :-
    is_a(Entity, n993).
is_a(Entity, n995) :-
    is_a(Entity, n994).
is_a(Entity, i995) :-
    is_a(Entity, n994).
is_a(Entity, j995) :-
    is_a(Entity, n994).
is_a(Entity, n996) :-
    is_a(Entity, n995).
is_a(Entity, i996) :-
    is_a(Entity, n995).
is_a(Entity, j996) :-
    is_a(Entity, n995).
is_a(Entity, n997) :-
    is_a(Entity, n996).
is_a(Entity, i997) :-
    is_a(Entity, n996).
is_a(Entity, j997) :-
    is_a(Entity, n996).
is_a(Entity, n998) :-
    is_a(Entity, n997).
is_a(Entity, i998) :-
    is_a(Entity, n997).
is_a(Entity, j998) :-
    is_a(Entity, n997).
is_a(Entity, n999) :-
    is_a(Entity, n998).
is_a(Entity, i999) :-
    is_a(Entity, n998).
is_a(Entity, j999) :-
    is_a(Entity, n998).
is_a(Entity, n1000) :-
    is_a(Entity, n999).
is_a(Entity, i1000) :-
    is_a(Entity, n999).
is_a(Entity, j1000) :-
    is_a(Entity, n999).

% Answer
?- is_a(Who, a2).

% Reason
?- why.

% Check
?- check((is_a(ind, a2))).
?- check((is_a(ind, n1000))).
?- check((is_a(ind, i1000))).
?- check((is_a(ind, j1000))).
?- check((\+ (is_a(ind, n1001)))).
