AUFMLK ;DICTIONARY ENTRY LOOK-UP UTILITY (FILE MANAGER COMPATIBLE) [ 12/23/86  1:53 PM ]
 ;IHS-OKLA CITY AREA OFFICE-LMD
L1 S:$D(D0) LKD0=D0 S:$D(X) LKX=X S:$D(Y)#2 LKY=Y K LKPCC,LKPRINT,LKDATA,LKERR,LKGL,LKDENT,LKNEW G END:'$D(LKDR)!'$D(LKDIC)!'$D(LKDA) S LK("I")=1,LKDIC(1)=LKDIC,LKDR(1)=LKDR G END:+LKDR<.01!(+LKDIC<1)!(+LKDA<1)
 S:$D(^DD(LKDIC,LKDR,0)) LKG=^DD(LKDIC,LKDR,0) G COMP:$P(LKG,"^",2)["C" I +$P(LKG,"^",2)>0 S LKERR=5 G END
L2 I '$D(^DD(LKDIC(LK("I")),LKDR(LK("I")),0)) S LKERR=3 G END
 S LKSUB=$P(^DD(LKDIC(LK("I")),LKDR(LK("I")),0),"^",4),LKPC(LK("I"))=$P(LKSUB,";",2),LKSUB(LK("I"))=$P(LKSUB,";",1) I '$D(^DD(LKDIC(LK("I")),0,"UP")) G L4
L3 S LKERR=4 S:$D(LKDRENT1) LKDRENT=0 G END:'$D(LKDRENT) G END:LKDRENT'="0"&(+LKDRENT<0) G END:LKDRENT\1'=LKDRENT S:LKDRENT=0 LKNEW="" K LKERR
 S LK("I")=LK("I")+1,LKDIC(LK("I"))=^DD(LKDIC(LK("I")-1),0,"UP"),LKDR(LK("I"))=0,LKDR(LK("I"))=$O(^DD(LKDIC(LK("I")),"SB",LKDIC(LK("I")-1),LKDR(LK("I")))) G L2
L4 S LKGL=^DIC(LKDIC(LK("I")),0,"GL")_LKDA,LKGL(1)=LKGL_",0)" I '$D(@LKGL(1)) S LKERR=1 G END
 I LK("I")=1 K:$D(LKDRENT) LKDRENT G L5
 F LK("J")=LK("I"):-1:2 S LKGL=LKGL_","_LKSUB(LK("J")) S:LK("J")>2 LKGL=LKGL_",1"
L5 S LKPCC=LKPC(1) I '$D(LKDRENT) S LKDRENT="" G L6
L5A S LKGL(0)=LKGL_",0)" I '$D(@LKGL(0)) S LKERR=6,LKGL=LKGL_",1,0)" G END
L5B S LKDENT=$P(@LKGL(0),"^",4) S:LKDENT="" LKDENT=0 I LKDENT=0!(LKDRENT>LKDENT) S LKERR=2 G END
L5BB I $D(LKDRENT1) D DNT4 G L5E:LKDNT'="" S LKERR=2 G END
L5C I LKDRENT>0 D DNT2 S LKDRENT=LKDNT G L5E:LKDNTT>0 S LKERR=2 G END
L5D S LKGL(0)=LKGL_",0)" D DNT
L5E S LKDRENT=","_LKDRENT
L6 S LKGL=LKGL_LKDRENT_","_LKSUB(1)_")" I LKGL[",," S LKERR=2,LKNEW="" G END
 I '$D(@LKGL) S LKERR=2,LKNEW="" G END
L6A S (LKPRINT,LKDATA)=$P(@LKGL,"^",LKPC(1)) G END:LKPRINT=""
L7 S LKGG=$P(LKG,"^",2),LK("H")=$P(LKG,"^",3) G SET:LKGG["S",DATE:LKGG["D",PTR:LKGG["P",COMP:LKGG["C",TRX:$D(^DD(LKDIC(1),LKDR(1),2))
END S:$D(LKD0) D0=LKD0 S:$D(LKX) X=LKX S:$D(LKY) Y=LKY K LKDIC,LKNEW,LKD0,LKX,LKY,LKDRENT,LKDRENT1,LKDNT,LKDNTT,LK,LKH,LKGG,LKGGG,LKGLL,LKSUB,LKPC,LKDR,LKDA S:'$D(LKPRINT)&'$D(LKERR) LKERR=0 Q
DNT S LKDNT=0
DNT1 S LKGLL=LKGL_",LKDNT)",LKDNT=$O(@LKGLL) Q:LKDNT=""  S LKDRENT=LKDNT G DNT1
DNT2 S (LKDNT,LKDNTT)=0
DNT3 S LKGLL=LKGL_",LKDNT)",LKDNT=$O(@LKGLL) Q:LKDNT=""  S LKDNTT=LKDNTT+1 Q:LKDNTT=LKDRENT  G DNT3
DNT4 S LKDNT=0
DNT5 S LKGLL=LKGL_",LKDNT)",LKDNT=$O(@LKGLL) Q:LKDNT=""  S:LKDNT=LKDRENT1 LKDRENT=LKDNT Q:LKDRENT=LKDNT  G DNT5
SET F LK("I")=1:1 S LKGGG=$P(LK("H"),";",LK("I")) G END:LKGGG="" S:$P(LKGGG,":",1)=LKDATA LKPRINT=$P(LKGGG,":",2)
 G END
DATE S Y=LKDATA X ^DD("DD") S LKPRINT=Y G END
PTR S LKGGG="^"_LK("H")_LKDATA_",0)" I '$D(@LKGGG) S LKERR=7 G END
 S LKPRINT=$P(@LKGGG,"^",1) G END
COMP S LKH=$E($P(LKG,";",2),3,999),D0=LKDA X LKH S LKPRINT=X G END
TRX S Y=LKDATA X ^DD(LKDIC(1),LKDR(1),2) S LKPRINT=X G END