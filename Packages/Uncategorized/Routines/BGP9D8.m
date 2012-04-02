BGP9D8 ; IHS/CMI/LAB - measure C 03 Jul 2008 7:05 AM ; 
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
IE2 ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 ;I 'BGPACTCL S BGPSTOP=1 Q  ;not active clinical pt
 ;I BGPSEX'="F" S BGPSTOP=1 Q
 S BGPNO2=0
 S BGPNO2=$$HIVDX(DFN,BGPEDATE) I BGPNO2]"" S BGPD3=1
 I BGPACTCL,BGPSEX="F",$$PREG^BGP9D7(DFN,$$FMADD^XLFDT(BGPEDATE,-600),BGPEDATE),BGPNO2="" S BGPD1=1  ;not pregnant
 ;I BGPACTCL,BGPSEX="F",$$PREG^BGP9D7(DFN,$$FMADD^XLFDT(BGPEDATE,-600),BGPEDATE,1),BGPNO2="" S BGPD4=1  ;not pregnant
 I BGPACTUP,BGPAGEB>12,BGPAGEB<65,BGPNO2="" S BGPD2=1
 I '(BGPD1+BGPD2+BGPD3) S BGPSTOP=1 Q  ;not in either denominator
 S BGPHIV=$$HIVTEST(DFN,$$FMADD^XLFDT(BGPEDATE,$S(BGPD1:-600,1:-365)),$S(BGPNO2]"":BGPNO2,1:BGPEDATE))
 I $P(BGPHIV,U) S BGPN1=1
 I $P(BGPHIV,U)=2 S BGPN2=1
 S BGPN3=$P(BGPHIV,U,3)
 I BGPD3,'BGPN3 S BGPSTOP=1 Q  ;screen count only but no screens
 I $P(BGPHIV,U)=1 S BGPN4=1
 ;S BGPEDUC=$$HIVEDUC(DFN,$$FMADD^XLFDT(BGPEDATE,-600),BGPEDATE)
 ;I $P(BGPEDUC,U)=1 S BGPN3=1
 I BGPRTYPE=1 S BGPVALUE="AC PREG|||"_$S(BGPD2&(BGPHIV):"HIV SCREEN MEASURE (NO HIV DX EVER): "_$P(BGPHIV,U,4),1:"") I 1
 E  S BGPVALUE=$S(BGPNO2="":"UP",1:"")_$S(BGPD1:";AC PREG",1:"")_" "_$S(BGPD4:"/AC PREG (NO RX/CHR)",1:"")_"|||"_$S(BGPD2&(BGPHIV):"HIV SCREEN MEASURE (NO HIV DX EVER): "_$P(BGPHIV,U,4)_" ; ",1:"")_$P(BGPHIV,U,2)
 ;I $P(BGPEDUC,U)=1 S BGPVALUE=BGPVALUE_" EDUC: "_$P(BGPEDUC,U,2)_" "_$P(BGPEDUC,U,3)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,T
 Q:$G(BGPIISO)
 K BGPEDUC,BGPHIV
 Q
IE1 ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9,BGPCD4,BGPPCR)=0
 I BGPAGEB<13 S BGPSTOP=1 Q
 I 'BGPACTCL S BGPSTOP=1 Q  ;not active clinical pt
 I '$$V2HIV(DFN,BGP365,BGPEDATE) S BGPSTOP=1 Q
 I BGPACTCL S BGPD1=1
 I 'BGPD1 S BGPSTOP=1 Q
 S BGPCD4=$$CD4(DFN,BGP365,BGPEDATE)
 S BGPPCR=$$PCR(DFN,BGP365,BGPEDATE)
 I BGPCD4,'BGPPCR S BGPN1=1
 I BGPPCR,'BGPCD4 S BGPN2=1
 I BGPPCR,BGPCD4 S BGPN3=1
 I (BGPN1+BGPN2+BGPN3) S BGPN4=1
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,T
 K ^TMP($J,"A")
 Q
HIVDX(P,EDATE) ; any HIV dx ever or problem list HIV dx
 K BGPG
 S Y="BGPG("
 S BDATE=$P(^DPT(P,0),U,3)  ;dob
 S X=P_"^LAST DX [BGP HIV/AIDS DXS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q $P(BGPG(1),U)
 S T=$O(^ATXAX("B","BGP HIV/AIDS DXS",0))
 S X=0,G="" F  S X=$O(^AUPNPROB("AC",P,X)) Q:X'=+X!(G]"")  D
 .Q:$P(^AUPNPROB(X,0),U,8)>EDATE
 .S Y=$P(^AUPNPROB(X,0),U)
 .Q:'$$ICD^ATXCHK(Y,T,9)
 .S G=$P(^AUPNPROB(X,0),U,8)
 .Q
 Q G
HIVTEST(P,BDATE,EDATE) ;
 NEW BGPC,BGPT,T,X,BGPLT,E,D,B,L,J,G,BGPT1,BGPA
 NEW BD,ED,Y,D,V
 K BGPA
 S BGPC=0
 S T=$O(^ATXAX("B","BGP CPT HIV TESTS",0))
 I T D
 .;go through visits in a date range for this patient, check cpts
 .S ED=(9999999-EDATE),BD=9999999-BDATE,G=0
 .F  S ED=$O(^AUPNVSIT("AA",P,ED)) Q:ED=""!($P(ED,".")>BD)  D
 ..S V=0 F  S V=$O(^AUPNVSIT("AA",P,ED,V)) Q:V'=+V  D
 ...Q:'$D(^AUPNVSIT(V,0))
 ...Q:'$D(^AUPNVCPT("AD",V))
 ...S X=0 F  S X=$O(^AUPNVCPT("AD",V,X)) Q:X'=+X  D
 ....I $$ICD^ATXCHK($P(^AUPNVCPT(X,0),U),T,1) I '$D(BGPA((9999999-$P(ED,".")))) S BGPC=BGPC+1,BGPC(BGPC)=1_U_$$DATE^BGP9UTL((9999999-$P(ED,".")))_" CPT "_$$VAL^XBDIQ1(9000010.18,X,.01),BGPA((9999999-$P(ED,".")))=""
 ....Q
 ...Q
 ..Q
 S T=$O(^ATXAX("B","BGP HIV TEST LOINC CODES",0))
 S BGPLT=$O(^ATXLAB("B","BGP HIV TEST TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...S V=$P(^AUPNVLAB(X,0),U,3)
 ...I BGPLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(BGPLT,21,"B",$P(^AUPNVLAB(X,0),U))),'$D(BGPA((9999999-D))) S BGPC=BGPC+1,BGPC(BGPC)=1_U_$$DATE^BGP9UTL((9999999-D))_" LAB",BGPA((9999999-D))="" Q
 ...Q:'T
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC^BGP9D21(J,T)
 ...I '$D(BGPA((9999999-D))) S BGPC=BGPC+1,BGPC(BGPC)=1_U_$$DATE^BGP9UTL((9999999-D))_"  LAB "_$P($G(^LAB(95.3,J,0)),U)_"-"_$P($G(^LAB(95.3,J,0)),U,15),BGPA((9999999-D))=""
 ...Q
 I BGPC>0 D  S $P(X,U,2)=X,$P(X,U,1)=1,$P(X,U,3)=BGPC,$P(X,U,4)=$P(BGPC(1),U,2) Q X
 .S X=""
 .S T=0 F  S T=$O(BGPC(T)) Q:T'=+T  S:X]"" X=X_" " S X=X_T_") HIV SCREEN COUNT (NO PRIOR HIV DX): "_$P(BGPC(T),U,2)
 ;now check for refusal of an HIV test
 S BGPT=$O(^ATXLAB("B","BGP HIV TEST TAX",0))
 I 'BGPT Q ""
 S (G,BGPT1)=0,G="" F  S BGPT1=$O(^ATXLAB(BGPT,21,"B",BGPT1)) Q:BGPT1=""!(G)  D
 .S T=$$REFUSAL^BGP9UTL1(P,60,BGPT1,BDATE,EDATE) I $P(T,U)=1 S G=2_U_U_U_$$DATE^BGP9UTL($P(T,U,2))_" lab refusal"
 Q G
HIVEDUC(P,BDATE,EDATE) ;
 K BGPG
 S Y="BGPG("
 S X=P_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) Q ""
 S X=0,G="",%="",T="" F  S X=$O(BGPG(X)) Q:X'=+X!($P(G,U))  D
 .S T=$P(^AUPNVPED(+$P(BGPG(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I $P(T,"-",1)="HIV"!($P(T,"-",1)["042")!($P(T,"-",1)["043")!($P(T,"-",1)["044")!($P(T,"-",1)="V08.")!($P(T,"-",1)["795.71")!($P(T,"-",2)="HIV") S G=1_U_$$DATE^BGP9UTL($P(BGPG(X),U))_U_T
 I $P(G,U)=1 Q G
 ;
 K BGPG
 S Y="BGPG("
 S X=P_"^LAST DX V65.44;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1_U_$$DATE^BGP9UTL($P(BGPG(1),U))_"V65.44"  ;has a dx
 Q ""
 ;
CD4(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [BGP CD4 TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S E=+$$CODEN^ICPTCOD(86361),%=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86361"
 S E=+$$CODEN^ICPTCOD(86360),%=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86360"
 S E=+$$CODEN^ICPTCOD(86359),%=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86359"
 ;tran codes
 S E=+$$CODEN^ICPTCOD(86361),%=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86361 TRAN"
 S E=+$$CODEN^ICPTCOD(86360),%=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86360 TRAN"
 S E=+$$CODEN^ICPTCOD(86359),%=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^86359 TRAN"
 ;now go through all labs and check loinc codes
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",%=P_"^ALL LAB;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,A)
 I '$D(^TMP($J,"A",1)) Q ""
 ;now go through all lab tests and see if any are the loinc codes in the taxonomy
 S T=$O(^ATXAX("B","BGP CD4 LOINC CODES",0))
 I 'T Q ""
 S (X,G)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X!(G)  S I=+$P(^TMP($J,"A",X),U,4) I $P($G(^AUPNVLAB(I,11)),U,13)]"" D
 .S J=$P(^AUPNVLAB(I,11),U,13)
 .I $$LOINC^BGP9D21(J,T) S G=1
 Q G
PCR(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [BGP HIV VIRAL LOAD TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S E=+$$CODEN^ICPTCOD(87536),%=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^87536"
 S E=+$$CODEN^ICPTCOD(87539),%=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^87539"
 S E=+$$CODEN^ICPTCOD(87536),%=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^87536 TRAN"
 S E=+$$CODEN^ICPTCOD(87539),%=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I %]"" Q $P(%,U)_"^87539 TRAN"
 ;now go through all labs and check loinc codes
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",%=P_"^ALL LAB;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,A)
 I '$D(^TMP($J,"A",1)) Q ""
 ;now go through all lab tests and see if any are the loinc codes in the taxonomy
 S T=$O(^ATXAX("B","BGP VIRAL LOAD LOINC CODES",0))
 I 'T Q ""
 S (X,G)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X!(G)  S I=+$P(^TMP($J,"A",X),U,4) I $P($G(^AUPNVLAB(I,11)),U,13)]"" D
 .S J=$P(^AUPNVLAB(I,11),U,13)
 .I $$LOINC^BGP9D21(J,T) S G=1
 Q G
V2HIV(P,BDATE,EDATE) ;
 I '$G(P) Q ""
 I '$D(^AUPNVSIT("AC",P)) Q ""
 NEW BGP9M
 S BGP9M=$$FMADD^XLFDT(EDATE,-(6*30))
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",B=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(B,A)
 I '$D(^TMP($J,"A",1)) Q ""
 S T=$O(^ATXAX("B","BGP HIV/AIDS DXS",0))
 I 'T Q ""
 S (X,G,H)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X  S V=$P(^TMP($J,"A",X),U,5) D
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:'$P(^AUPNVSIT(V,0),U,9)
 .Q:$P(^AUPNVSIT(V,0),U,11)
 .Q:"SAHO"'[$P(^AUPNVSIT(V,0),U,7)
 .Q:"CV"[$P(^AUPNVSIT(V,0),U,3)  ;eliminate contract health
 .S (D,Y)=0 F  S Y=$O(^AUPNVPOV("AD",V,Y)) Q:Y'=+Y!(D)  I $D(^AUPNVPOV(Y,0)) S %=$P(^AUPNVPOV(Y,0),U) I $$ICD^ATXCHK(%,T,9) S D=1
 .Q:'D
 .I $P($P(^AUPNVSIT(V,0),U),".")'<BGP9M S H=1
 .S G=G+1
 .Q
 I G>1,H=1 Q 1
 Q ""
 ;
LOINC(A,B) ;
 NEW %
 S %=$P($G(^LAB(95.3,A,9999999)),U,2)
 I %]"",$D(^ATXAX(B,21,"B",%)) Q 1
 S %=$P($G(^LAB(95.3,A,0)),U)_"-"_$P($G(^LAB(95.3,A,0)),U,15)
 I $D(^ATXAX(B,21,"B",%)) Q 1
 Q ""