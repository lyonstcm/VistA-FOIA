LRCAPDSS ;DALISC/FHS-LAB WORKLOAD DSS EXTRACT (LMIP) ;5/2/91  09:03
 ;;5.2;LAB SERVICE;**127,143,201,221**;Sep 27, 1994
 ;ECX*3 compatible
EN ;
 ; Call with Start Date (LRSDT)  End Date (LREDT) FileMan format
 ; Calling routine should have already purged ^LRO(64.03)
 S:$D(ZTQUEUED) ZTREQ="@"
 I $S($G(LRSDT)'?7N:1,$G(LREDT)'?7N:1,1:0) Q
 N X,I
 L +^LRO(64.03):10 G:'$T END
 I LRSDT>LREDT S X=LRSDT,LRSDT=LREDT,LREDT=X
 S LRX1=(9999999-LRSDT),LRX2=(9999999-LREDT)-1
 S LREDT0=LREDT,X1=LREDT,X2="+35" D C^%DTC S LREDT=X
 S LRSDT0=LRSDT,LRSDT=LRSDT-".9999"
 ;Q
 S LRDPROV=$P($G(^LAB(69.9,1,12)),U) G END:'LRDPROV S $P(^("NITE"),U,6)=""
 S:'$D(^LRO(64.03,0))#2 ^LRO(64.03,0)="WKLD LOG FILE^64.03^"
 S LRNOW=$$NOW^XLFDT
 S LRDSS0=^LRO(64.03,0),LRSNODE=$S($P(LRDSS0,U,3):$P(LRDSS0,U,3),1:1) F LRSNODE=LRSNODE:1 Q:'$D(^LRO(64.03,LRSNODE,0))
 S ^LRO(64.03,LRSNODE,0)=LRSNODE,^(1,0)="^64.317DA^1^1",^(1,0)=LRNOW_U_LRSDT0_U_LREDT0_U_U_$G(DUZ)
 S ^LRO(64.03,"B",LRNOW,LRSNODE,1)=""
INST S LRSDTX=LRSDT,LRIN=0 F  S LRIN=$O(^LRO(64.1,LRIN)) Q:LRIN<1  D
 . S LRSDT=LRSDTX-.0001 F  S LRSDT=$O(^LRO(64.1,LRIN,1,LRSDT)) Q:LRSDT<1!(LRSDT>LREDT)  D
 . . S LRCC=0 F  S LRCC=$O(^LRO(64.1,LRIN,1,LRSDT,1,LRCC)) Q:LRCC<1  S LRCCX=$G(^LAM(LRCC,0)) D
 . . . Q:$P($G(LRCCX),U,2)'?5N1"."4N.5N  Q:$S($P(LRCCX,U,5):0,$P(LRCCX,U,16):0,+$P(LRCCX,".",2)=9999:0,$E($P(LRCCX,".",2))=8:0,1:1)
 . . . S LRTM=0 F  S LRTM=$O(^LRO(64.1,LRIN,1,LRSDT,1,LRCC,1,LRTM)) Q:LRTM'>0  I $D(^(LRTM,0)) D SET
 S $P(^LRO(64.03,LRSNODE,1,1,0),U,4)=$$NOW^XLFDT
END ;
 L -^LRO(64.03) Q:$G(LRDBUG)
 K DFN,LRAA,LRACCDT,LRACCN,LRCC,LRCCX,LRDSS,LRDSS0,LREDT,LRIDT,LRIN
 K LRLOC,LRLOCN,LRLOCTY,LRODT,LRPROV,LRSDT,LRSDTX,LRSNODE,LRSPEC,LRSTR,LRTEST
 K LRTIM,LRTM,LRTS,LRURG,LRX,LRN0,LRNX,X,LRMULT,LREDT0,LRSDT0,LRNOW,LRX1
 K LRX2,X1,X2,LRPFILE
 Q
SET ;
 S LRSTR=$G(^LRO(64.1,LRIN,1,LRSDT,1,LRCC,1,LRTM,0))
 S LRPFILE=$P($P(LRSTR,U,10),";",2) Q:$S(LRPFILE="LRT(67,":0,LRPFILE="DPT(":0,LRPFILE="LRT(67.1,":0,1:1)
 S LRIDT=$P(LRSTR,U,22)
 I '$G(LRDBUG),$S(LRIDT>LRX1:1,LRIDT<LRX2:1,1:0) Q
 S X=LRSTR,LRTEST=$P(X,U,2),LRMULT=$S($P(X,U,3):$P(X,U,3),1:1),LRAA=$P(X,U,7)
 S LRACCN=$P(X,U,9),DFN=$P(X,U,10),LRACCDT=$P(X,U,11),LRODT=$P(X,U,12)
 S LRSPEC=$P(X,U,14),LRLOCN=$P(X,U,15)
 S LRTS=$P(X,U,17)
 S LRLOCTY=$P(X,U,19),LRURG=$P(X,U,23)
 S LRTIM=9999999-LRIDT D
 . I $P($G(^LRO(68,LRAA,0)),U,21) S (LRLOC,LROCTY)="" Q
 . S LRLOC=$P(X,U,21) S:LRLOC LRLOC=LRLOC_";SC("
 S LRPROV=$P(X,U,16)
 I 'LRLOC,LRPFILE="LRT(67,",$P(LRPROV,":",2) S LRLOC=$P(LRPROV,":",2)_";DIC(4,"
 S:'LRPROV LRPROV=LRDPROV
 S LRX=LRPROV_U_DFN_U_LRSDT_U_LRIN_U_LRLOCTY_U_LRAA_U_LRTEST_U_LRURG
 S LRX=LRX_U_LRTS_U_LRCC_U_LRIDT_U_LRTIM_U_LRODT_U_LRLOC_U_LRACCN_U_LRSPEC
 I LRMULT>0 F I=1:1:LRMULT D NEXT
 Q
NEXT S LRN0=^LRO(64.03,0),LRNX=$S($P(LRN0,U,3):$P(LRN0,U,3),1:1) F LRNX=LRNX:1 Q:'$D(^LRO(64.03,LRNX,0))
 S $P(LRN0,U,3)=LRNX,$P(LRN0,U,4)=$P(LRN0,U,4)+1,^LRO(64.03,0)=LRN0
 S ^LRO(64.03,LRNX,0)=LRNX_U_LRX
 Q
LOOP S LRDPROV=$P(^LAB(69.9,1,12),U),LRDBUG=1
 S LRTM=0 F  S LRTM=$O(^LRO(64.1,LRIN,1,LRSDT,1,LRCC,1,LRTM)) Q:LRTM<1  D SET
 K LRDBUG
 Q
