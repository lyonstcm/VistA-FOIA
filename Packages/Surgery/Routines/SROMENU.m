SROMENU ;B'HAM ISC/MAM - OPERATION MENU OPTIONS ;10/13/04
 ;;3.0; Surgery ;**52,67,69,104,107,100,134**;24 Jun 93
TECH ; sromen-anes tech
 G:'$G(SRTN) NO D ^SROLOCK G:SROLOCK END
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR,SRODR S DR="[SROMEN-ANES TECH]",DIE=130,DA=SRTN D ^DIE I $D(SRODR) D ^SROCON1
 G END
OP ; sromen-op
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S SRDTIME=DTIME,DTIME=3600,DIE=130,DR="[SROMEN-OPER]",DA=SRTN,ST="OPERATION"_$S(SROLOCK:" **LOCKED",1:"") D EN2^SROVAR,^SRCUSS S DTIME=SRDTIME I $D(Q3("VIEW")) K Q3("VIEW") G END
 I '$P(^SRF(SRTN,0),"^",20) D ^SROPCE1
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN G END
COMP ; sromen-comp
 K SRODR
 G:'$G(SRTN) NO D ^SROLOCK G:SROLOCK END
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR W @IOF,! S DIE=130,DA=SRTN,DR="[SROMEN-COMP]" D ^DIE
 I $D(SRODR) D ^SROCON1
 G END
SHORT ; sromen-out
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S SRDTIME=DTIME,DTIME=3600,DIE=130,DA=SRTN,DR="[SROMEN-OUT]",ST="SHORT SCREEN"_$S(SROLOCK:" **LOCKED",1:"") D EN2^SROVAR,^SRCUSS S DTIME=SRDTIME I $D(Q3("VIEW")) K Q3("VIEW") G END
 I '$P(^SRF(SRTN,0),"^",20) D ^SROPCE1
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN G END
PACU ; sromen-pacu
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S DIE=130,DA=SRTN,ST="PACU"_$S(SROLOCK:" **LOCKED",1:""),DR="[SROMEN-PACU]" D EN2^SROVAR,^SRCUSS I $D(Q3("VIEW")) K Q3("VIEW") G END
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN D ^SROERR0
 G END
POST ; sromen-post
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S SRDTIME=DTIME,DTIME=3600,DIE=130,DA=SRTN,ST="POST OPERATION"_$S(SROLOCK:" **LOCKED",1:""),DR="[SROMEN-POST]" D EN2^SROVAR,^SRCUSS S DTIME=SRDTIME I $D(Q3("VIEW")) K Q3("VIEW") G END
 I '$P(^SRF(SRTN,0),"^",20) D ^SROPCE1
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN G END
REF ; sromen-refer
 K SRODR
 G:'$G(SRTN) NO D ^SROLOCK G:SROLOCK END
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 W @IOF K DR S DIE=130,DA=SRTN,DR="[SROMEN-REFER]" W !! D ^DIE
 I $D(SRODR) D ^SROCON1
 G END
STAFF ; sromen-staff
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S SRDTIME=DTIME,DTIME=3600,DIE=130,DA=SRTN,ST="SURGICAL STAFF"_$S(SROLOCK:" **LOCKED",1:""),DR="[SROMEN-STAFF]" D EN2^SROVAR,^SRCUSS S DTIME=SRDTIME I $D(Q3("VIEW")) K Q3("VIEW") G END
 I '$P(^SRF(SRTN,0),"^",20) D ^SROPCE1
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN G END
START ; sromen-start
 D RT K SRODR
 G:'$G(SRTN) NO D ^SROLOCK I SROLOCK S Q3("VIEW")=""
 N SRLCK S SRLCK=$$LOCK^SROUTL(SRTN) I 'SRLCK G END
 K DR S SRDTIME=DTIME,DTIME=3600,DIE=130,DA=SRTN,ST="STARTUP"_$S(SROLOCK:" **LOCKED",1:""),DR="[SROMEN-START]" D EN2^SROVAR,^SRCUSS S DTIME=SRDTIME I $D(Q3("VIEW")) K Q3("VIEW") G END
 I '$P(^SRF(SRTN,0),"^",20) D ^SROPCE1
 I $D(SRODR) D ^SROCON1
 S SROERR=SRTN G END
REV ; review request information (request menu)
 K SRNEWOP D ^SROPS D RT G:'$G(SRTN) END
 K Y,DR S Q3("VIEW")="",ST="REVIEW REQUEST",DIC=130,DA=SRTN,DR="[SRSREQV]" D EN2^SROVAR,^SRCUSS K DR,SRTN
 G END
NO ;
 W !!,"An operative procedure must be selected to use this option.",!
 W !!,"Press RETURN to continue  " R X:DTIME
END ;
 I $D(SROERR) D ^SROERR0
 I $G(SRTN) D UNLOCK^SROUTL(SRTN)
 K SRDTIME D ^SRSKILL W @IOF
 Q
RT ; start RT logging
 I $G(SRTN),$D(XRTL) S XRTN="SROMENU" D T0^%ZOSV
 Q
