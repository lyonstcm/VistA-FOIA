ACPTCXR ; IHS/ASDST/DMJ,SDR - CROSS REF FILE 81 FIELD 50 (DESC) ;    [ 12/31/2003  1:54 PM ]
 ;;2.09;CPT FILES;;JAN 2, 2009
START ;START
 K ^ICPT("C")
 S ACPTEX=^DD(81,2,1,1,1)
 S DA=0
 F  S DA=$O(^ICPT(DA)) Q:'DA!(DA<4848504884&DA>999999)  D
 .I '(DA#100) W "."
 .D ONE
 K ACPTEX,ACPTLINE
 Q
ONE ;X-REF ONE ENTRY
 Q:DA<4848504884&DA>999999
 S ACPTLINE=0 F  S ACPTLINE=$O(^ICPT(DA,"D",ACPTLINE)) Q:'ACPTLINE  D
 .S X=^ICPT(DA,"D",ACPTLINE,0)
 .X ACPTEX
 S X=$P(^ICPT(DA,0),"^",2)
 X ACPTEX
 Q