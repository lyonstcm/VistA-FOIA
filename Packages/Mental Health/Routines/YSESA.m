YSESA ;SLC/DCM-ROUTINE TO RUN A DECISION SYSTEM/ALGORITHM DIRECTLY ; 7/7/89  10:50 ;
 ;;5.01;MENTAL HEALTH;;Dec 30, 1994
 ;RAN DIRECTLY AS AN APPLICATION - BYPASSING THE MAIN MENU DRIVER
 ;DECISION EXPERT SYSTEM (VERSION 1.0) FOR THE MENTAL HEALTH PACKAGE - DWIGHT MCDANIEL / REGION 5 ISC, SLC
 ;THIS ROUTINE WILL GIVE DIRECT ENTRY INTO AN EXPERT SYSTEM OR AN ALGORITHM
 ;TO ENTER AN EXPERT SYSTEM SYSTEM, SET THE VARIABLE A5ASYS=TO THE SYSTEM YOU WANT TO RUN.
 ;TO ENTER DIRECTLY INTO AN ALGORITHM, SET A5ASYS=SYSTEM TO RUN AND ATALG=TO THE ALGORITHM
SYS I '$D(A5ASYS) Q
 D SETSYS S GN=$O(@(ESDBP1_Q_A5ASYS_Q_",0)")) D ^YSESD
 G END
ALG I '$D(A5ASYS)!('$D(A5ALG)) Q
 D SETSYS S A5AFL=1
 S GN=$O(@(ESDBP1_Q_A5ASYS_Q_",0)")),ESDBP=ESDBP_GN_",1,",ESDBP1=ESDBP_"""B"",",GN1=$O(@(ESDBP1_Q_A5ALG_Q_",0)"))
 S A5AND=@(ESDBP_GN1_",1)"),ESDBP=ESDBP_GN1_",2,",ESDBP1=ESDBP_"""B"",",GN2=$O(@(ESDBP1_Q_A5AND_Q_",0)"))
 S XCODE="F EXI=1:1 W $S($P(ANS,"","",EXI)]""0"":$P(ANS,"","",EXI),1:"""") Q:$P(ANS,"","",EXI+1)=""""  W $S($P(ANS,"","",EXI)'=0:""/"",1:"""")"
 S A5AS(0)=ESDBP,A5AS(1)=ESDBP D LOOP^YSESD G END
SETSYS S Q="""",A5ASP=0,ST=0,STR="",$P(STR,"*",79)="" I '$D(IOF) D HOME^%ZIS
 S ESDBP="^YS(628,",ESDBP1=ESDBP_"""B"",",DIC=ESDBP
 Q
END W @IOF
 K C,A5AI,A5AJ,ESI,ESJ,A5AX,Y,P,GN,GN1,GN2,DIC,A5ASYS,A5ALG,ESDBP,ESDBP1,XCODE,EXI,ANS,ST,STR,PROMPT,A5ARES,S,A5AND,T,TB,TC,X,A5AFL
 Q
