VENLI003 ; ; 28-NOV-2006
 ;;2.6;PCC+;;NOV 12, 2007
 Q:'DIFQ(9000010.16)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^DD(9000010.16,1204,23,3,0)
 ;;=APCDALVR Variable = APCDALVR("APCDTEPR")
 ;;^DD(9000010.16,1204,"DT")
 ;;=2941219
 ;;^DD(9000010.16,1208,0)
 ;;=PARENT^P9000010.16'^AUPNVPED(^12;8^Q
 ;;^DD(9000010.16,1208,23,0)
 ;;=^^1^1^2960924^
 ;;^DD(9000010.16,1208,23,1,0)
 ;;=APCDALVR Variable = APCDALVR("APCDTPNT")
 ;;^DD(9000010.16,1208,"DT")
 ;;=2960709
 ;;^DD(9000010.16,1209,0)
 ;;=EXTERNAL KEY^F^^12;9^K:$L(X)>20!($L(X)<1) X
 ;;^DD(9000010.16,1209,3)
 ;;=Answer must be 1-20 characters in length.
 ;;^DD(9000010.16,1209,23,0)
 ;;=^^1^1^2960924^
 ;;^DD(9000010.16,1209,23,1,0)
 ;;=APCDALVR Variable = APCDALVR("APCDTEXK")
 ;;^DD(9000010.16,1209,"DT")
 ;;=2960925
 ;;^DD(9000010.16,1210,0)
 ;;=OUTSIDE PROVIDER NAME^F^^12;10^K:$L(X)>30!($L(X)<1) X
 ;;^DD(9000010.16,1210,3)
 ;;=Answer must be 1-30 characters in length.
 ;;^DD(9000010.16,1210,23,0)
 ;;=^^1^1^2960924^
 ;;^DD(9000010.16,1210,23,1,0)
 ;;=APCDALVR Variable = APCDALVR("APCDTOPR")
 ;;^DD(9000010.16,1210,"DT")
 ;;=2960925
 ;;^DD(9000010.16,80101,0)
 ;;=EDITED FLAG^S^1:EDITED;^801;1^Q
 ;;^DD(9000010.16,80101,3)
 ;;=Answer is automatically generated by the PCE filing logic.
 ;;^DD(9000010.16,80101,21,0)
 ;;=^^2^2^2950831^
 ;;^DD(9000010.16,80101,21,1,0)
 ;;=This field is automatically set to 1 if PCE detects that any original exam data
 ;;^DD(9000010.16,80101,21,2,0)
 ;;=is being edited.
 ;;^DD(9000010.16,80101,23,0)
 ;;=^^2^2^2950831^
 ;;^DD(9000010.16,80101,23,1,0)
 ;;=PCE filing logic automatically compares the before and after pictures of the
 ;;^DD(9000010.16,80101,23,2,0)
 ;;=record to determine if the edited flag should be set to "1".
 ;;^DD(9000010.16,80101,"DT")
 ;;=2940401
 ;;^DD(9000010.16,80102,0)
 ;;=AUDIT TRAIL^F^^801;2^K:$L(X)>85!($L(X)<2) X
 ;;^DD(9000010.16,80102,3)
 ;;=Answer is automatically generated by the PCE filing logic.
 ;;^DD(9000010.16,80102,21,0)
 ;;=^^3^3^2950831^
 ;;^DD(9000010.16,80102,21,1,0)
 ;;=This field is populated automatically by the PCE filing logic.  The format of
 ;;^DD(9000010.16,80102,21,2,0)
 ;;=the field is as follows:  Pointer to PCE data source file_"-"_A for Add or E
 ;;^DD(9000010.16,80102,21,3,0)
 ;;=for Edit_" "_DUZ of the person who entered the data_";"...
 ;;^DD(9000010.16,80102,23,0)
 ;;=^^14^14^2950831^
 ;;^DD(9000010.16,80102,23,1,0)
 ;;=The PCE filing logic requires a pointer to the PCE data source file.  If this
 ;;^DD(9000010.16,80102,23,2,0)
 ;;=is not passed, then PCE filing logic will not process the data.
 ;;^DD(9000010.16,80102,23,3,0)
 ;;= 
 ;;^DD(9000010.16,80102,23,4,0)
 ;;=If the record is a new record, then an "A" is used to specify the source that
 ;;^DD(9000010.16,80102,23,5,0)
 ;;=added the data.  If the record existed previously, PCE filing logic compares
 ;;^DD(9000010.16,80102,23,6,0)
 ;;=the old and new records of information.  An "E" will automatically be used if
 ;;^DD(9000010.16,80102,23,7,0)
 ;;=the filing logic finds the data has been edited.  If "E" is used, then the
 ;;^DD(9000010.16,80102,23,8,0)
 ;;=Edited Flag field is automatically set to 1.
 ;;^DD(9000010.16,80102,23,9,0)
 ;;= 
 ;;^DD(9000010.16,80102,23,10,0)
 ;;=The DUZ is stored in its internal format to represent the user who performed
 ;;^DD(9000010.16,80102,23,11,0)
 ;;=the adding or editing of data for this record.
 ;;^DD(9000010.16,80102,23,12,0)
 ;;= 
 ;;^DD(9000010.16,80102,23,13,0)
 ;;=Iterations of editing will be concatenated to the previous data source value,
 ;;^DD(9000010.16,80102,23,14,0)
 ;;=up to 85 characters.
 ;;^DD(9000010.16,80102,"DT")
 ;;=2960509
 ;;^DD(9000010.16,81101,0)
 ;;=COMMENTS^F^^811;1^K:$L(X)>245!($L(X)<1) X
 ;;^DD(9000010.16,81101,3)
 ;;=Enter a comment 1-245 characters in length.
 ;;^DD(9000010.16,81101,21,0)
 ;;=^^2^2^2950901^^
 ;;^DD(9000010.16,81101,21,1,0)
 ;;=This is a comment related to the patient's education.  The provider may enter
 ;;^DD(9000010.16,81101,21,2,0)
 ;;=this manually via the PCE User Interface.
 ;;^DD(9000010.16,81101,"DT")
 ;;=2950711
 ;;^DD(9000010.16,81201,0)
 ;;=VERIFIED^SI^1:ELECTRONICALLY SIGNED;2:VERIFIED BY PACKAGE;^812;1^Q
 ;;^DD(9000010.16,81201,"DT")
 ;;=2960509
 ;;^DD(9000010.16,81202,0)
 ;;=PACKAGE^P9.4'I^DIC(9.4,^812;2^Q
 ;;^DD(9000010.16,81202,"DT")
 ;;=2960509
 ;;^DD(9000010.16,81203,0)
 ;;=DATA SOURCE^P839.7'I^PX(839.7,^812;3^Q
 ;;^DD(9000010.16,81203,"DT")
 ;;=2960509
 ;;^DD(9000010.161,0)
 ;;=SUB-TOPIC SUB-FIELD^^.02^2
 ;;^DD(9000010.161,0,"DT")
 ;;=3060203
 ;;^DD(9000010.161,0,"IX","B",9000010.161,.01)
 ;;=
 ;;^DD(9000010.161,0,"NM","SUB-TOPIC")
 ;;=
 ;;^DD(9000010.161,0,"UP")
 ;;=9000010.16
 ;;^DD(9000010.161,.01,0)
 ;;=SUB-TOPIC^MF^^0;1^K:$L(X)>80!($L(X)<1) X
 ;;^DD(9000010.161,.01,1,0)
 ;;=^.1
 ;;^DD(9000010.161,.01,1,1,0)
 ;;=9000010.161^B
 ;;^DD(9000010.161,.01,1,1,1)
 ;;=S ^AUPNVPED(DA(1),1,"B",$E(X,1,30),DA)=""
 ;;^DD(9000010.161,.01,1,1,2)
 ;;=K ^AUPNVPED(DA(1),1,"B",$E(X,1,30),DA)
 ;;^DD(9000010.161,.01,3)
 ;;=Answer must be 1-80 characters in length.
 ;;^DD(9000010.161,.01,"DT")
 ;;=3060203
 ;;^DD(9000010.161,.02,0)
 ;;=LEVEL OF UNDERSTANDING^S^1:POOR;2:FAIR;3:GOOD;4:GROUP-NO ASSESSMENT;5:REFUSED;^0;2^Q
 ;;^DD(9000010.161,.02,"DT")
 ;;=3060203