BGP9D731 ; IHS/CMI/LAB - measure AHR.A ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
 ;
IPAMT ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPN7,BGPN8,BGPN9,BGPN10,BGPN11,BGPN12,BGPN13,BGPN14,BGPN15,BGPN16,BGPN17,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 S BGPVALUE=""
 I BGPAGEB<35 S BGPSTOP=1 Q
 I 'BGPACTCL S BGPSTOP=1 Q  ;must be active clinical
 S BGPAMI=$$AMI(DFN,$$FMADD^XLFDT(BGPBDATE,-180),$$FMADD^XLFDT(BGPBDATE,180))
 I '$P(BGPAMI,U) S BGPSTOP=1 Q  ;no ami
 S BGPD1=1
 I $P(^DPT(DFN,0),U,2)="M" S BGPD2=1
 I $P(^DPT(DFN,0),U,2)="F" S BGPD3=1
 S BGPADDAT=$S($P(BGPAMI,U,4)]"":$P(BGPAMI,U,4),1:$P(BGPAMI,U,2))
 K BGPBETA
 S BGPBETA("RX")=$$BETA^BGP9D721(DFN,BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180),134)
 I BGPBETA("RX") S BGPN2=1  ;pt has 135 days of beta blocker
 I 'BGPN2 S BGPBETA("REF")=$$BETAREF^BGP9D721(DFN,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPBETA("REF") S BGPN3=1
 I 'BGPN2 S BGPBETA("CONTRA")=$$BETACONT^BGP9D721(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPBETA("CONTRA") S BGPN4=1 ;beta contraindication
 I 'BGPN2 S BGPBETA("ADR")=$$BETAALG1^BGP9D72(DFN,$$FMADD^XLFDT(BGPADDAT,180)) I BGPBETA("ADR") S BGPN4=1
 I (BGPN2+BGPN3+BGPN4) S BGPN1=1
 K BGPASA
 S BGPASA("RX")=$$ASA^BGP9D721(DFN,BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180),134)  ;get 1_U_# days
 I BGPASA("RX") S BGPN6=1  ;pt has 135 days of beta blocker
 I 'BGPN6 S BGPASA("REF")=$$ASAREF^BGP9D721(DFN,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPASA("REF") S BGPN7=1
 I 'BGPN6 S BGPASA("CONTRA")=$$ASACONTR(DFN,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180),$$DOB^AUPNPAT(DFN),BGPEDATE) I BGPASA("CONTRA") S BGPN8=1 ;beta contraindication
 I 'BGPN6 S BGPASA("ADR")=$$ASAALLEG^BGP9D721(DFN,$$FMADD^XLFDT(BGPADDAT,180)) I BGPASA("ADR") S BGPN8=1
 I (BGPN6+BGPN7+BGPN8) S BGPN5=1
 K BGPACE
 S BGPACE("RX")=$$ACERX^BGP9D722(DFN,BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180),134)  ;get 1_U_# days
 I BGPACE("RX") S BGPN10=1  ;pt has 135 days of ACE
 I 'BGPN10 S BGPACE("REF")=$$ACEREF^BGP9D722(DFN,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPACE("REF") S BGPN11=1
 I 'BGPN10 S BGPACE("CONTRA")=$$ACECONT^BGP9D722(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPACE("CONTRA") S BGPN12=1 ;beta contraindication
 I 'BGPN10 S BGPACE("ADR")=$$ACEALG^BGP9D722(DFN,BGPBDATE,$$FMADD^XLFDT(BGPADDAT,180)) I BGPACE("ADR") S BGPN12=1
 I (BGPN10+BGPN11+BGPN12) S BGPN9=1
 K BGPSTAT
 S BGPSTAT("RX")=$$STATRX^BGP9D722(DFN,BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180),134)  ;get 1_U_# days
 I BGPSTAT("RX") S BGPN14=1  ;pt has 135 days of STAT
 I 'BGPN14 S BGPSTAT("REF")=$$STATREF^BGP9D722(DFN,$P(BGPAMI,U,2),$$FMADD^XLFDT(BGPADDAT,180)) I BGPSTAT("REF") S BGPN15=1
 I 'BGPN14 S BGPSTAT("CONTRA")=$$STATCON^BGP9D722(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180)) I BGPSTAT("CONTRA") S BGPN16=1 ;beta contraindication
 I 'BGPN14 S BGPSTAT("ADR")=$$STATALG^BGP9D722(DFN,$$DOB^AUPNPAT(DFN),$$FMADD^XLFDT(BGPADDAT,180),BGPADDAT,$$FMADD^XLFDT(BGPADDAT,180)) I BGPSTAT("ADR") S BGPN16=1
 I (BGPN14+BGPN15+BGPN16) S BGPN13=1
 I BGPN1,BGPN5,BGPN9,BGPN13 S BGPN17=1
 S BGPVALUE="AC|||"
 S BGPVALUE=BGPVALUE_$S(BGPN17:"ALL MEDS; ",1:"")
 S BGPVALUE=BGPVALUE_" BETA: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPBETA(X)),U,1),$P($G(BGPBETA(X)),U,2)]"" S BGPVALUE=BGPVALUE_$P(BGPBETA(X),U,2)_" "
 S BGPVALUE=BGPVALUE_" ; ASA: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPASA(X)),U,1),$P($G(BGPASA(X)),U,2)]"" S BGPVALUE=BGPVALUE_$P(BGPASA(X),U,2)_" "
 S BGPVALUE=BGPVALUE_" ; ACEI/ARB: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPACE(X)),U,1),$P($G(BGPACE(X)),U,2)]"" S BGPVALUE=BGPVALUE_$P(BGPACE(X),U,2)_" "
 S BGPVALUE=BGPVALUE_" ; STATIN: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPSTAT(X)),U,1),$P($G(BGPSTAT(X)),U,2)]"" S BGPVALUE=BGPVALUE_$P(BGPSTAT(X),U,2)_" "
 K BGPIHD,BGPBETA,BGPMEDS1,BGPASA,BGPACE,BGPSTAT
 K ^TMP($J)
 Q
AMI(P,BDATE,EDATE) ;
 ;look for any H with AMI discharge dx
 K ^TMP($J,"A"),G
 S A="^TMP($J,""A"",",B=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(B,A)
 I '$D(^TMP($J,"A",1)) Q 0
 S T=$O(^ATXAX("B","BGP AMI DXS PAMT",0))
 S (BGPX,G,M,D,E)=0 F  S BGPX=$O(^TMP($J,"A",BGPX)) Q:BGPX'=+BGPX  S V=$P(^TMP($J,"A",BGPX),U,5) D
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:'$P(^AUPNVSIT(V,0),U,9)
 .Q:$P(^AUPNVSIT(V,0),U,11)
 .Q:"AOSH"'[$P(^AUPNVSIT(V,0),U,7)
 .S H=0
 .I $P(^AUPNVSIT(V,0),U,7)="H" S H=$O(^AUPNVINP("AD",V,0)) D  Q:'B
 ..S B=0
 ..I 'H Q
 ..Q:$$AMA^BGP9D72(H)  ;ama
 ..Q:$$TRANS^BGP9D72(H)  ;transferred
 ..Q:$$EXPIRED^BGP9D72(H)  ;died
 ..S B=1
 .S (D,Y)=0 F  S Y=$O(^AUPNVPOV("AD",V,Y)) Q:Y'=+Y!(D)  I $D(^AUPNVPOV(Y,0))  D
 ..S %=$P(^AUPNVPOV(Y,0),U) Q:'$$ICD^ATXCHK(%,T,9)
 ..I $P(^AUPNVPOV(Y,0),U,6)]"",$P(^AUPNVPOV(Y,0),U,6)'="F" Q  ;modifier
 ..S N=$$VAL^XBDIQ1(9000010.07,Y,.04)
 ..S N=$$UP^XLFSTR(N)
 ..I $E(N,1,8)="CONSIDER" Q
 ..I $E(N,1,8)="DOUBTFUL" Q
 ..I $E(N,1,5)="MAYBE" Q
 ..I $E(N,1,8)="POSSIBLE" Q
 ..I $E(N,1,7)="PERHAPS" Q
 ..I $E(N,1,8)="RULE OUT" Q
 ..I $E(N,1,3)="R/O" Q
 ..I $E(N,1,8)="PROBABLE" Q
 ..I $E(N,1,8)="RESOLVED" Q
 ..I $E(N,1,7)="SUSPECT" Q
 ..I $E(N,1,10)="SUSPICIOUS" Q
 ..I $E(N,1,11)="STATUS POST" Q
 ..S D=1
 .I D S G=G+1,G($P($P(^AUPNVSIT(V,0),U),"."))=V ;got one visit
 I 'G Q G
 S D=$O(G(0)),V=G(D),H=$O(^AUPNVINP("AD",V,0))
 Q 1_U_$O(G(0))_U_V_U_$S(H:$P($P(^AUPNVINP(H,0),U),"."),1:"")_U_H
ASACONTR(P,BGPADM,BGPDD,BDATE,EDATE) ;does patient have an aspirin allergy
 K BGPMEDS1
 S K=0,R="",BGPG=""
 D GETMEDS^BGP9UTL2(P,$$FMADD^XLFDT(BGPADM,-90),BGPDD,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) Q ""
 S T=$O(^ATXAX("B","BGP CMS WARFARIN MEDS",0))
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G WAR71
 .S N=$P($G(^PSDRUG(D,0)),U,1)
 .I N["WARFARIN" S G=1 G WAR71
 .Q:'G
WAR71 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .;S IS DAYS SUPPLY, J IS DATE DISCONTINUED
 .I J]"" Q:J<BGPADM  ;discontinued before admission
 .S E=$P($P(^AUPNVSIT(V,0),U),".")
 .I E'<BGPADM,E'>BGPDD S BGPG=1_U_$$DATE^BGP9UTL(E)_U_$P(^PSDRUG(D,0),U)
 .S S=$P(^AUPNVMED(Y,0),U,7)
 .S Z=$$FMDIFF^XLFDT(BGPADM,$P($P(^AUPNVSIT(V,0),U),"."))
 .I S>Z S BGPG=1_U_$$DATE^BGP9UTL($P($P(^AUPNVSIT(V,0),U),"."))_U_$P(^PSDRUG(D,0),U)
 .Q
 I BGPG Q 1_U_"asa contra warfarin rx "_$P(BGPG,U,2)_" "_$P(BGPG,U,3)
 ;now check for dx 459
 K BGPG S BGPG=$$LASTDXI^BGP9UTL1(P,"459.0",BDATE,EDATE)
 I BGPG Q 1_U_"asa contra 459.0 "_$$DATE^BGP9UTL($P(BGPG,U,3))
 ;
 ;nmi in refusal file for aspirin
 S BGPG=""
 S T=$O(^ATXAX("B","DM AUDIT ASPIRIN DRUGS",0))
 S X=0 F  S X=$O(^AUPNPREF("AA",P,50,X)) Q:X'=+X  D
 .Q:'$D(^ATXAX(T,21,"B",X))  ;not an aspirin
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,50,X,D)) Q:D'=+D  D
 ..I Y>EDATE Q  ;documented EDATE OF REPORT PERIOD
 ..S N=0 F  S N=$O(^AUPNPREF("AA",P,50,X,D,N)) Q:N'=+N  D
 ...Q:$P($G(^AUPNPREF(N,0)),U,7)'="N"
 ...S BGPG=1_U_"asa contra NMI Aspirin:  "_$$VAL^XBDIQ1(9000022,N,.04)_" "_$$DATE^BGP9UTL($P(^AUPNPREF(N,0),U,3))_" "_$$VAL^XBDIQ1(9000022,X,1101)
 ..Q
 .Q
 I BGPG Q BGPG
 ;now check for CPT code G8008
 S X=$$CPTI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G8008"))
 I X Q 1_U_"asa contra CPT code G8008: "_$$DATE^BGP9UTL($P(X,U,2))
 S X=$$TRANI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G8008"))
 I X Q 1_U_"asa contra Tran Code G8008: "_$$DATE^BGP9UTL($P(X,U,2))
 Q ""