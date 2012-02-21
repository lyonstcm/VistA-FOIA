ORWGAPIR	; SLC/STAFF - Graph API Router ;8/21/06  07:52
	;;3.0;ORDER ENTRY/RESULTS REPORTING;**215,260,243**;Dec 17, 1997;Build 242
	;
DATA(DATA,ITEM,FILE,START,DFN,CNT,TMP,BACKTO)	; from ORWGAPI
	S DFN=+$G(DFN) I 'DFN Q
	S FILE=$G(FILE) I '$L(FILE) Q
	S ITEM=$G(ITEM) I '$L(ITEM) Q
	S BACKTO=+$G(BACKTO)
	I FILE=52 D OUTRX^ORWGAPI7(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=53.79 D BCMA^ORWGAPI7(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=55 D INRX^ORWGAPI7(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE="55NVA" D NVA^ORWGAPI7(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=63 D LAB^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE="63AP" D LAB^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	;I FILE="63BB" D BBDATA^ORWGAPIB(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE="63MI" D LAB^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=70 D RAD^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=100 D ORDER^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=120.5 D VITAL^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=120.8 D ADVERSE^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=601.2 D MH^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.07 D POV^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.11 D IMM^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.12 D SKIN^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.13 D EXAM^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.16 D EDU^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.18 D PROC^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010.23 D HF^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000011 D PROB^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9999911 D PROBX^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE="45OP" D OP^ORWGAPI4(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE="45DX" D DX^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=9000010 D VISIT^ORWGAPI8(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=405 D ADMIT^ORWGAPI8(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=130 D SURG^ORWGAPI8(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=8925 D NOTE^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	I FILE=690 D MED^ORWGAPI3(.DATA,ITEM,START,DFN,.CNT,TMP,BACKTO) Q
	Q
	;
ITEMS(ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,CNT,TMP)	; from ORWGAPI
	S FMT=$G(FMT,3),OLDEST=+$G(OLDEST),NEWEST=+$G(NEWEST),CNT=+$G(CNT)
	I (TYPE=70)!(TYPE=100)!(TYPE=120.5)!(TYPE=601.2) D STD(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I (TYPE=9000010.11)!(TYPE=9000010.12)!(TYPE=9000010.13) D STD(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I (TYPE=9000010.16)!(TYPE=9000010.23) D STD(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I (TYPE=9000010.07)!(TYPE=9000010.18) D STD1(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I (TYPE=52)!(TYPE=55) D STD2(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=63 D LAB^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=9000010 D VISITS^ORWGAPI6(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=9000011 D PL^ORWGAPI2(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=9999911 D PLX^ORWGAPI2(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=405 D ADMITS^ORWGAPI6(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=50.605 D DC^ORWGAPI5(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=68 D AA^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=8925.1 D TITLE^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=53.79 D BCMA^ORWGAPI5(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=120.8 D ADVERSE^ORWGAPI2(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=130 D SURGERY^ORWGAPI6(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=8925 D NOTES^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE=690 D MED^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	S TYPE=$$UP^ORWGAPIX(TYPE)
	I $E(TYPE,1,2)=45 D REG^ORWGAPI2(.ITEMS,DFN,TYPE,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE="55NVA" D NVA^ORWGAPI5(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE="63AP" D AP^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE="63BB" D BBITEM^ORWGAPIB(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	I TYPE="63MI" D MI^ORWGAPI1(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,TMP) Q
	Q
	;
STD(ITEMS,DFN,FILE,FMT,OLDEST,NEWEST,CNT,TMP)	;
	N DATE,ITEM,OK,RESULT
	S ITEM=""
	F  S ITEM=$O(^PXRMINDX(FILE,"PI",DFN,ITEM)) Q:ITEM=""  D
	. S OK=0
	. I FMT=6 D
	.. S DATE=OLDEST
	.. F  S DATE=$O(^PXRMINDX(FILE,"PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
	... S CNT=CNT+1
	... S OK=1
	... S RESULT=FILE_U_ITEM
	. I FMT=3 D
	.. S DATE=$O(^PXRMINDX(FILE,"PI",DFN,ITEM,""),-1)
	.. I 'DATE Q
	.. S CNT=CNT+1
	.. S OK=1
	.. S RESULT=FILE_U_ITEM_"^^"_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)_"^^"_DATE
	.. I FILE=100 S RESULT=RESULT_U_$$OGROUP^ORWGAPIW(ITEM)
	. I FMT=0 D
	.. S CNT=CNT+1
	.. S OK=1
	.. S RESULT=FILE_U_ITEM_U_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)
	. I OK D SETUP^ORWGAPIW(.ITEMS,RESULT,TMP,.CNT)
	I FILE=120.5 D BMIITEMS^ORWGAPIX(.ITEMS,.CNT,TMP) Q
	Q
	;
STD1(ITEMS,DFN,FILE,FMT,OLDEST,NEWEST,CNT,TMP)	;
	N DATE,ITEM,OK,RESULT,TYPE
	K ^TMP("ORWGRPC TEMP",$J)
	S TYPE=""
	F  S TYPE=$O(^PXRMINDX(FILE,"PPI",DFN,TYPE)) Q:TYPE=""  D
	. S ITEM=""
	. F  S ITEM=$O(^PXRMINDX(FILE,"PPI",DFN,TYPE,ITEM)) Q:ITEM=""  D
	.. S OK=0
	.. I FMT=6 D
	... S DATE=OLDEST
	... F  S DATE=$O(^PXRMINDX(FILE,"PPI",DFN,TYPE,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
	.... S CNT=CNT+1
	.... S OK=1
	.... S RESULT=FILE_U_ITEM
	.. I FMT=3 D
	... S DATE=$O(^PXRMINDX(FILE,"PPI",DFN,TYPE,ITEM,""),-1)
	... I DATE S ^TMP("ORWGRPC TEMP",$J,ITEM,DATE)=""
	.. I FMT=0 D
	... S CNT=CNT+1
	... S OK=1
	... S RESULT=FILE_U_ITEM_U_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)
	.. I OK D SETUP^ORWGAPIW(.ITEMS,RESULT,TMP,.CNT)
	I FMT=3 D
	. S ITEM=""
	. F  S ITEM=$O(^TMP("ORWGRPC TEMP",$J,ITEM)) Q:ITEM=""  D
	.. S DATE=$O(^TMP("ORWGRPC TEMP",$J,ITEM,""),-1)
	.. I 'DATE Q
	.. S CNT=CNT+1
	.. S RESULT=FILE_U_ITEM_"^^"_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)_"^^"_DATE
	.. D SETUP^ORWGAPIW(.ITEMS,RESULT,TMP,.CNT)
	K ^TMP("ORWGRPC TEMP",$J)
	Q
	;
STD2(ITEMS,DFN,FILE,FMT,OLDEST,NEWEST,CNT,TMP)	;
	N DATE,DATE2,ITEM,OK,RESULT
	S ITEM=""
	F  S ITEM=$O(^PXRMINDX(FILE,"PI",DFN,ITEM)) Q:ITEM=""  D
	. S OK=0
	. I FMT=6 D
	.. S DATE=0
	.. F  S DATE=$O(^PXRMINDX(FILE,"PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
	... S DATE2=""
	... F  S DATE2=$O(^PXRMINDX(FILE,"PI",DFN,ITEM,DATE,DATE2)) Q:DATE2=""  D
	.... I DATE2<OLDEST Q
	.... S CNT=CNT+1
	.... S OK=1
	.... S RESULT=FILE_U_ITEM
	. I FMT=3 D
	.. S DATE=$O(^PXRMINDX(FILE,"PI",DFN,ITEM,""),-1)
	.. I 'DATE Q
	.. S CNT=CNT+1
	.. S OK=1
	.. S RESULT=FILE_U_ITEM_"^^"_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)_"^^"_DATE
	.. S RESULT=RESULT_U_$$DRGCLASS^ORWGAPIC(ITEM)
	. I FMT=0 D
	.. S CNT=CNT+1
	.. S OK=1
	.. S RESULT=FILE_U_ITEM_U_$$EVALUE^ORWGAPIU(ITEM,FILE,.01)
	.. S RESULT=RESULT_U_$$DRGCLASS^ORWGAPIC(ITEM)
	. I OK D SETUP^ORWGAPIW(.ITEMS,RESULT,TMP,.CNT)
	Q
	;
