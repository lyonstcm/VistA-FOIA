INSY186 ;slt;19 Aug 1994@090352;compiled gis system data
 ;;3.01;BHL IHS Interfaces with GIS;;JUL 01, 2001
 ;COPYRIGHT 1991-2000 SAIC
 Q
 ;
EN F I=1:2 S %ODD=$E($T(EN+I),4,999) Q:%ODD=""  S %EVEN=$E($T(EN+(I+1)),4,999) S X="^UTILITY(""INHSYS"","_$J_","_$P(%ODD,",",2,99),@X=%EVEN
 ;;^UTILITY(562037788,"SGF",293,0)
 ;;HL RAD ENTERER'S LOCATION^COMPOSITE ID NUMBER AND NAME^80
 ;;^UTILITY(562037788,"SGF",293,1,0)
 ;;1^^1^1^2940322
 ;;^UTILITY(562037788,"SGF",293,1,1,0)
 ;;Requesting location from the radiology exam file (70.5;1.07)
 ;;^UTILITY(562037788,"SGF",293,50)
 ;;HOSPITAL LOCATION
 ;;^UTILITY(562037788,"SGF",293,"C")
 ;;#1.07
 ;;^UTILITY(562037788,"SGF",294,0)
 ;;HL RAD ORDER EFFECTIVE DT^TIME STAMP^26
 ;;^UTILITY(562037788,"SGF",294,1,0)
 ;;1^^1^1^2940322
 ;;^UTILITY(562037788,"SGF",294,1,1,0)
 ;;Order date/time from the radiology exam file (70.5;.07).
 ;;^UTILITY(562037788,"SGF",294,"C")
 ;;#.07
 ;;^UTILITY(562037788,"SGF",295,0)
 ;;HL RAD RESULT CODE^CODED ELEMENT^10
 ;;^UTILITY(562037788,"SGF",295,1,0)
 ;;2^^2^2^2940322
 ;;^UTILITY(562037788,"SGF",295,1,1,0)
 ;;Verified report result code from the radiology reports file (74;8603).  Use
 ;;^UTILITY(562037788,"SGF",295,1,2,0)
 ;;the field HL AMENDED RESULT CODE (RA) for the amended result code.
 ;;^UTILITY(562037788,"SGF",295,"C")
 ;;INTERNAL(#8603)_";78.3"
 ;;^UTILITY(562037788,"SGF",296,0)
 ;;HL RAD AMENDED RESULT CODE^CODED ELEMENT^10
 ;;^UTILITY(562037788,"SGF",296,1,0)
 ;;1^^1^1^2940322
 ;;^UTILITY(562037788,"SGF",296,1,1,0)
 ;;Report result code for amended radiology reports.
 ;;^UTILITY(562037788,"SGF",296,"C")
 ;;INTERNAL(#4)_";78.3"
 ;;^UTILITY(562037788,"SGF",297,0)
 ;;HL RAD REPORT^STRING^300
 ;;^UTILITY(562037788,"SGF",297,1,0)
 ;;1^^1^1^2940322
 ;;^UTILITY(562037788,"SGF",297,1,1,0)
 ;;Radiology report text.
 ;;^UTILITY(562037788,"SGF",297,5)
 ;;S X=$G(^RARPT(INDA(1),"R",INDA,0))
 ;;^UTILITY(562037788,"SGF",297,"C")
 ;;@NULL
 ;;^UTILITY(562037788,"SGF",298,0)
 ;;HL RAD AMENDED REPORT^STRING^300
 ;;^UTILITY(562037788,"SGF",298,1,0)
 ;;1^^1^1^2940322
 ;;^UTILITY(562037788,"SGF",298,1,1,0)
 ;;Amended radiology report text.
 ;;^UTILITY(562037788,"SGF",298,5)
 ;;S X=$G(^RARPT(INDA(2),1,INDA(1),1,INDA,0))
 ;;^UTILITY(562037788,"SGF",298,"C")
 ;;@NULL
 ;;^UTILITY(562037788,"SGF",310,0)
 ;;HL RAD STRING^STRING^2
 ;;^UTILITY(562037788,"SGF",310,"C")
 ;;"ST"
 ;;^UTILITY(562037788,"SGF",311,0)
 ;;HL RAD CODED ELEMENT^STRING^2
 ;;^UTILITY(562037788,"SGF",311,"C")
 ;;"CE"
 ;;^UTILITY(562037788,"SGF",313,0)
 ;;HL RAD RESULT CODE OBS ID^CODED ELEMENT^80
 ;;^UTILITY(562037788,"SGF",313,1,0)
 ;;1^^1^1^2940331
 ;;^UTILITY(562037788,"SGF",313,1,1,0)
 ;;Observation Identifier for radiology result codes.
 ;;^UTILITY(562037788,"SGF",313,10,0)
 ;;^4012.02P^3^3
 ;;^UTILITY(562037788,"SGF",313,10,1,0)
 ;;HL RAD OBS RESULT CODE ID^1^1
 ;;^UTILITY(562037788,"SGF",313,10,2,0)
 ;;HL RAD OBS RESULT CODE^2^1
 ;;^UTILITY(562037788,"SGF",313,10,3,0)
 ;;HL RAD OBS CODE SYSTEM^3^1
 ;;^UTILITY(562037788,"SGF",313,10,"AS",1,1)
 ;;
 ;;^UTILITY(562037788,"SGF",313,10,"AS",2,2)
 ;;
 ;;^UTILITY(562037788,"SGF",313,10,"AS",3,3)
 ;;
 ;;^UTILITY(562037788,"SGF",313,10,"B",316,1)
 ;;
 ;;^UTILITY(562037788,"SGF",313,10,"B",317,2)
 ;;
 ;;^UTILITY(562037788,"SGF",313,10,"B",319,3)
 ;;
 ;;^UTILITY(562037788,"SGF",314,0)
 ;;HL RAD REPORT OBS ID^CODED ELEMENT^80
 ;;^UTILITY(562037788,"SGF",314,1,0)
 ;;1^^1^1^2940331
 ;;^UTILITY(562037788,"SGF",314,1,1,0)
 ;;Observation Identifier for radiology results.
 ;;^UTILITY(562037788,"SGF",314,10,0)
 ;;^4012.02P^3^3
 ;;^UTILITY(562037788,"SGF",314,10,1,0)
 ;;HL RAD OBS REPORT ID^1^1
 ;;^UTILITY(562037788,"SGF",314,10,2,0)
 ;;HL RAD OBS REPORT^2^1
 ;;^UTILITY(562037788,"SGF",314,10,3,0)
 ;;HL RAD OBS CODE SYSTEM^3^1
 ;;^UTILITY(562037788,"SGF",314,10,"AS",1,1)
 ;;
 ;;^UTILITY(562037788,"SGF",314,10,"AS",2,2)
 ;;
 ;;^UTILITY(562037788,"SGF",314,10,"AS",3,3)
 ;;
 ;;^UTILITY(562037788,"SGF",314,10,"B",315,1)
 ;;
 ;;^UTILITY(562037788,"SGF",314,10,"B",318,2)
 ;;
 ;;^UTILITY(562037788,"SGF",314,10,"B",319,3)
 ;;
 ;;^UTILITY(562037788,"SGF",315,0)
 ;;HL RAD OBS REPORT ID^STRING^1
 ;;^UTILITY(562037788,"SGF",315,"C")
 ;;"R"
 ;;^UTILITY(562037788,"SGF",316,0)
 ;;HL RAD OBS RESULT CODE ID^STRING^1
 ;;^UTILITY(562037788,"SGF",316,"C")
 ;;"C"
 ;;^UTILITY(562037788,"SGF",317,0)
 ;;HL RAD OBS RESULT CODE^STRING^10
 ;;^UTILITY(562037788,"SGF",317,"C")
 ;;"RESCODE"
 ;;^UTILITY(562037788,"SGF",318,0)
 ;;HL RAD OBS REPORT^STRING^10
 ;;^UTILITY(562037788,"SGF",318,"C")
 ;;"REPORT"
 ;;^UTILITY(562037788,"SGF",319,0)
 ;;HL RAD OBS CODE SYSTEM^STRING^1
 ;;^UTILITY(562037788,"SGF",319,"C")
 ;;"L"
 ;;^UTILITY(562037788,"SGF",322,0)
 ;;HL PATIENT NUMBER^NUMERIC^15
 ;;^UTILITY(562037788,"SGF",322,50)
 ;;PATIENT
 ;;^UTILITY(562037788,"SGF",322,"C")
 ;;NUMBER
 ;;^UTILITY(562037788,"SGF",323,0)
 ;;HL MTF CODE^STRING^15
 ;;^UTILITY(562037788,"SGF",323,"C")
 ;;INSITE
 ;;^UTILITY(562037788,"SGF",324,0)
 ;;HL PATIENT ID INTERNAL^STRING^60
 ;;^UTILITY(562037788,"SGF",324,10,0)
 ;;^4012.02P^4^4
 ;;^UTILITY(562037788,"SGF",324,10,1,0)
 ;;HL PATIENT NUMBER^1
 ;;^UTILITY(562037788,"SGF",324,10,2,0)
 ;;HL MTF CODE^4
 ;;^UTILITY(562037788,"SGF",324,10,3,0)
 ;;HL NULL^2
 ;;^UTILITY(562037788,"SGF",324,10,4,0)
 ;;HL NULL^3
 ;;^UTILITY(562037788,"SGF",324,10,"AS",1,1)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"AS",2,3)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"AS",3,4)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"AS",4,2)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"B",322,1)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"B",323,2)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"B",325,3)
 ;;
 ;;^UTILITY(562037788,"SGF",324,10,"B",325,4)
 ;;
 ;;^UTILITY(562037788,"SGF",325,0)
 ;;HL NULL^STRING^1
 ;;^UTILITY(562037788,"SGF",335,0)
 ;;HL RAD ORDER TASK TIME^TIME STAMP^26
 ;;^UTILITY(562037788,"SGF",335,1,0)
 ;;1^^1^1^2940407
 ;;^UTILITY(562037788,"SGF",335,1,1,0)
 ;;Radiology Exam Order Task Date/Time
 ;;^UTILITY(562037788,"SGF",335,"C")
 ;;#.06
 ;;^UTILITY(562037788,"SGM",9,0)
 ;;HL RAD RESULT MESSAGE^R01^D^2.2^70.5^ORU^O^0
 ;;^UTILITY(562037788,"SGM",9,1,0)
 ;;^4011.01P^20^9
 ;;^UTILITY(562037788,"SGM",9,1,3,0)
 ;;HL MESSAGE HEADER^10^0^0^^^^^1
 ;;^UTILITY(562037788,"SGM",9,1,4,0)
 ;;HL PATIENT IDENTIFICATION^20^0^1^2^^O^^1
 Q