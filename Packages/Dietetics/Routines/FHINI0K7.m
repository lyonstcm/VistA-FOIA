FHINI0K7	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(114)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,114,512,0)
	;;=APRICOT/ORANGE JUICE, BULK^100^4-FLOZ^^^^1^N
	;;^UTILITY(U,$J,114,512,"I",0)
	;;=^114.01PA^1^1
	;;^UTILITY(U,$J,114,512,"I",1,0)
	;;=575^3.125^1387^27.5125
	;;^UTILITY(U,$J,114,512,"X",0)
	;;=^^1^1^2890804^
	;;^UTILITY(U,$J,114,512,"X",1,0)
	;;=PORTION 4-OZ SERVING OF JUICE INTO CONTAINER.
	;;^UTILITY(U,$J,114,513,0)
	;;=ORANGE/GRPFRT JUICE, IND^100^1-EACH^^^^11^N
	;;^UTILITY(U,$J,114,513,"I",0)
	;;=^114.01PA^1^1
	;;^UTILITY(U,$J,114,513,"I",1,0)
	;;=857^100^1734^27.2
	;;^UTILITY(U,$J,114,513,"X",0)
	;;=^^1^1^2890804^
	;;^UTILITY(U,$J,114,513,"X",1,0)
	;;=PLACE THAWED CONTAINED OF JUICE ON TRAY.