ABMER40 ; IHS/ASDST/DMJ - UB92 EMC RECORD 40 (Claim Data) ; 
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;DMJ;08/18/95 10:39 AM
 ;
 ; IHS/SD/SDR - v2.5 p11 - NPI
 ;
START ;START HERE
 K ABMR(40),ABMREC(40)
 S ABME("RTYPE")=40
 D SET^ABMERUTL
 S ABME("S#")=1
 D LOOP
 D S90^ABMERUTL
 K ABM
 Q
 ;
LOOP ;LOOP HERE
 D ^ABMER40A
 F I=180:10:340 D
 .D @I
 .I $D(^ABMEXLM("AA",+$G(ABMP("INS")),+$G(ABMP("EXP")),40,I)) D @(^(I))
 .I '$G(ABMP("NOFMT")) S ABMREC(40,ABME("S#"))=$G(ABMREC(40,ABME("S#")))_ABMR(40,I)
 Q
 ;
180 ;Occurrence Code 6 (SOURCE: FILE=9002274.4051, FIELD=.01)
 ; form locator #33b
 D GET51
 S ABMR(40,180)=$P($G(ABM(51,6)),U)
 S ABMR(40,180)=$$FMT^ABMERUTL(ABMR(40,180),"2")
 Q
 ;
190 ;Occurrence Date 6 (SOURCE: FILE=9002274.4051, FIELD=.02)     
 ; form locator #33b
 D GET51
 S Y=$P($G(ABM(51,6)),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,190)=Y
 S ABMR(40,190)=$$FMT^ABMERUTL(ABMR(40,190),"6")
 Q
 ;
200 ;Occurrence Code 7 (SOURCE: FILE=9002274.4051, FIELD=.01)
 ; form locator #34b
 D GET51
 S ABMR(40,200)=$P($G(ABM(51,7)),U)
 S ABMR(40,200)=$$FMT^ABMERUTL(ABMR(40,200),"2")
 Q
 ;
210 ;Occurrence Date 7 (SOURCE: FILE=9002274.4051, FIELD=.02)
 ; form locator #34b
 D GET51
 S Y=$P($G(ABM(51,7)),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,210)=Y
 S ABMR(40,210)=$$FMT^ABMERUTL(ABMR(40,210),"6")
 Q
 ;
220 ;Occurrence Code 8 (SOURCE: FILE=9002274.4051, FIELD=.01)
 ; form locator #35b
 D GET51
 S ABMR(40,220)=$P($G(ABM(51,8)),U)
 S ABMR(40,220)=$$FMT^ABMERUTL(ABMR(40,220),"2")
 Q
 ;
230 ;Occurrence Date 8 (SOURCE: FILE=9002274.4051, FIELD=.01)
 ; form locator #35b
 D GET51
 S Y=$P($G(ABM(51,8)),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,230)=Y
 S ABMR(40,230)=$$FMT^ABMERUTL(ABMR(40,230),"6")
 Q
 ;
240 ;Occurrence Code 9 (SOURCE: FILE=9002274.4051, FIELD=.01)
 D GET51
 S ABMR(40,240)=$P($G(ABM(51,9)),U)
 S ABMR(40,240)=$$FMT^ABMERUTL(ABMR(40,240),"2")
 Q
 ;
250 ;Occurrence Date 9 (SOURCE: FILE=9002274.4051, FIELD=.02)
 D GET51
 S Y=$P($G(ABM(51,9)),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,250)=Y
 S ABMR(40,250)=$$FMT^ABMERUTL(ABMR(40,250),"6")
 Q
 ;
260 ;Occurrence Code 10 (SOURCE: FILE=9002274.4051, FIELD=.01)
 D GET51
 S ABMR(40,260)=$P($G(ABM(51,10)),U)
 S ABMR(40,260)=$$FMT^ABMERUTL(ABMR(40,260),"2")
 Q
 ;
270 ;Occurrence Date 10 (SOURCE FILE=9002274.4051, FIELD=.02)
 D GET51
 S Y=$P($G(ABM(51,10)),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,270)=Y
 S ABMR(40,270)=$$FMT^ABMERUTL(ABMR(40,270),"6")
 Q
 ;
280 ;Occurrence Span Code 1 (SOURCE: FILE=9002274.4057, FIELD=.01)
 ; form locator #35a
 D GET57
 S ABMR(40,280)=$P(ABM(57,1),U)
 S ABMR(40,280)=$$FMT^ABMERUTL(ABMR(40,280),2)
 Q
 ;
290 ;Occurrence Span From Date 1 (SOURCE: FILE=9002274.4057, FIELD=.02)
 ; form locator #35a
 D GET57
 S Y=$P(ABM(57,1),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,290)=Y
 S ABMR(40,290)=$$FMT^ABMERUTL(ABMR(40,290),"6")
 Q
 ;
300 ;Occurrence Span Through Date 1 (SOURCE: FILE=9002274.4057, FIELD=.03)
 ; form locator #35a
 D GET57
 S Y=$P(ABM(57,1),"^",3)
 D DFMT^ABMERUTL
 S ABMR(40,300)=Y
 S ABMR(40,300)=$$FMT^ABMERUTL(ABMR(40,300),"6")
 Q
 ;
310 ;Occurrence Span Code 2 (SOURCE: FILE=9002274.4057, FIELD=.01)
 ; form locator #36a
 D GET57
 S ABMR(40,310)=$P(ABM(57,2),U)
 S ABMR(40,310)=$$FMT^ABMERUTL(ABMR(40,310),2)
 Q
 ;
320 ;Occurrence Span From Date 2 (SOURCE: FILE=9002274.4057, FIELD=.02)
 ; form locator #36a
 D GET57
 S Y=$P(ABM(57,2),"^",2)
 D DFMT^ABMERUTL
 S ABMR(40,320)=Y
 S ABMR(40,320)=$$FMT^ABMERUTL(ABMR(40,320),"6")
 Q
 ;
330 ;Occurrence Span Through Date 2 (SOURCE: FILE=9002274.4057, FIELD=.03)
 ; form locator #36a
 D GET57
 S Y=$P(ABM(57,2),"^",3)
 D DFMT^ABMERUTL
 S ABMR(40,330)=Y
 S ABMR(40,330)=$$FMT^ABMERUTL(ABMR(40,330),"6")
 Q
 ;
340 ;Filler (National Use)
 S ABMR(40,340)=""
 S ABMR(40,340)=$$FMT^ABMERUTL(ABMR(40,340),3)
 Q
 ;
350 ;Occurrence Span Code 3 (SOURCE: FILE=9002274.4057, FIELD=.01)
 ; form locator #35b
 D GET57
 S ABMR(40,350)=$P($G(ABM(57,3)),U)
 S ABMR(40,350)=$$FMT^ABMERUTL(ABMR(40,350),2)
 Q
 ;
360 ;Occurrence Span From Date 2 (SOURCE: FILE=9002274.4057, FIELD=.02)
 ; form locator #35b
 D GET57
 S Y=$P($G(ABM(57,3)),U,2)
 D DFMT^ABMERUTL
 S ABMR(40,360)=Y
 S ABMR(40,360)=$$FMT^ABMERUTL(ABMR(40,360),"6")
 Q
 ;
370 ;Occurrence Span Through Date 2 (SOURCE: FILE=9002274.4057, FIELD=.03)
 ; form locator #35b
 D GET57
 S Y=$P($G(ABM(57,3)),U,3)
 D DFMT^ABMERUTL
 S ABMR(40,370)=Y
 S ABMR(40,370)=$$FMT^ABMERUTL(ABMR(40,370),"6")
 Q
 ;
380 ;Occurrence Span Code 2 (SOURCE: FILE=9002274.4057, FIELD=.01)
 ; form locator #36b
 D GET57
 S ABMR(40,380)=$P($G(ABM(57,4)),U)
 S ABMR(40,380)=$$FMT^ABMERUTL(ABMR(40,380),2)
 Q
 ;
390 ;Occurrence Span From Date 2 (SOURCE: FILE=9002274.4057, FIELD=.02)
 ; form locator #36b
 D GET57
 S Y=$P($G(ABM(57,4)),U,2)
 D DFMT^ABMERUTL
 S ABMR(40,390)=Y
 S ABMR(40,390)=$$FMT^ABMERUTL(ABMR(40,390),"6")
 Q
 ;
400 ;Occurrence Span Through Date 2 (SOURCE: FILE=9002274.4057, FIELD=.03)
 ; form locator #36b
 D GET57
 S Y=$P($G(ABM(57,4)),U,3)
 D DFMT^ABMERUTL
 S ABMR(40,400)=Y
 S ABMR(40,400)=$$FMT^ABMERUTL(ABMR(40,400),"6")
 Q
 ;
DIQ1 ;PULL POLICY HOLDER DATA VIA DIQ1
 Q:$D(ABM(9002274.4,ABMP("BDFN"),ABME("FLD")))
 N I
 S DIQ="ABM("
 S DIQ(0)="EI"
 S DIC="^ABMDBILL(DUZ(2),"
 S DA=ABMP("BDFN")
 S DR=".02;.54;.55;.56;.58;.76;.77;.78;.79"
 D EN^DIQ1
 K DIQ
 Q
 ;
EX(ABMX,ABMY) ;EXTRINSIC FUNCTION HERE
 ;
 ;  INPUT: ABMX = data element
 ;            Y = bill internal entry number
 ;
 ; OUTPUT:    Y = bill internal entry number
 ;
 S ABMP("BDFN")=ABMY
 D SET^ABMERUTL
 I '$G(ABMP("NOFMT")) S ABMP("FMT")=0
 D @ABMX
 S Y=ABMR(40,ABMX)
 I $D(ABMP("FMT")) S ABMP("FMT")=1
 K ABMR(40,ABMX),ABME,ABMX,ABMY,ABMZ,ABM
 Q Y
 ;
GET51 ;GET OCCURANCE CODES
 Q:$D(ABM(51))
 N I
 S I=0,CNT=0
 F  S I=$O(^ABMDBILL(DUZ(2),ABMP("BDFN"),51,I)) Q:'I  D
 .S CNT=CNT+1
 .S ABM(51,CNT)=^ABMDBILL(DUZ(2),ABMP("BDFN"),51,I,0)
 .S $P(ABM(51,CNT),U)=$P($G(^ABMDCODE(+ABM(51,CNT),0)),U)
 .S:$L(ABM(51,CNT))=1 ABM(51,CNT)="0"_ABM(51,CNT)
 F I=1:1:10 I '$D(ABM(51,I)) S ABM(51,I)=""
 Q
 ;
GET57 ;GET OCCURRENCE SPAN CODES
 Q:$D(ABM(57))
 N I
 S I=0,CNT=0
 F  S I=$O(^ABMDBILL(DUZ(2),ABMP("BDFN"),57,I)) Q:'I  D
 .S CNT=CNT+1
 .S ABM(57,CNT)=^ABMDBILL(DUZ(2),ABMP("BDFN"),57,I,0)
 .S $P(ABM(57,CNT),U)=$P($G(^ABMDCODE(+ABM(57,CNT),0)),U)
 F I=1,2 I '$D(ABM(57,I)) S ABM(57,I)=""
 Q