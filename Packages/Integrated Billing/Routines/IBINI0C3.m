IBINI0C3	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	Q:'DIFQR(399.5)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,399.5,194,0)
	;;=2901001^5^101^314^1^i
	;;^UTILITY(U,$J,399.5,195,0)
	;;=2901001^5^240^180^1^i
	;;^UTILITY(U,$J,399.5,196,0)
	;;=2901001^5^960^70^1^i
	;;^UTILITY(U,$J,399.5,197,0)
	;;=2901001^10^1^461^1^opc
	;;^UTILITY(U,$J,399.5,198,0)
	;;=2901001^10^101^266^1^i
	;;^UTILITY(U,$J,399.5,199,0)
	;;=2901001^10^240^141^1^i
	;;^UTILITY(U,$J,399.5,200,0)
	;;=2901001^10^960^54^1^i
	;;^UTILITY(U,$J,399.5,201,0)
	;;=2901001^1^1^233^1^opc
	;;^UTILITY(U,$J,399.5,202,0)
	;;=2901001^1^101^141^1^i
	;;^UTILITY(U,$J,399.5,203,0)
	;;=2901001^1^240^49^1^i
	;;^UTILITY(U,$J,399.5,204,0)
	;;=2901001^1^960^43^1^i
	;;^UTILITY(U,$J,399.5,205,0)
	;;=2901001^2^1^541^1^opc
	;;^UTILITY(U,$J,399.5,206,0)
	;;=2901001^2^101^203^1^i
	;;^UTILITY(U,$J,399.5,207,0)
	;;=2901001^2^240^266^1^i
	;;^UTILITY(U,$J,399.5,208,0)
	;;=2901001^2^960^72^1^i
	;;^UTILITY(U,$J,399.5,209,0)
	;;=2901001^6^1^185^1^opc
	;;^UTILITY(U,$J,399.5,210,0)
	;;=2901001^6^101^150^1^i
	;;^UTILITY(U,$J,399.5,211,0)
	;;=2901001^6^240^26^1^i
	;;^UTILITY(U,$J,399.5,212,0)
	;;=2901001^6^960^9^1^i
	;;^UTILITY(U,$J,399.5,213,0)
	;;=2901001^11^1^592^1^c
	;;^UTILITY(U,$J,399.5,214,0)
	;;=2901001^11^1^663^1^op
	;;^UTILITY(U,$J,399.5,215,0)
	;;=2901001^11^101^390^1^i
	;;^UTILITY(U,$J,399.5,216,0)
	;;=2901001^11^240^195^1^i
	;;^UTILITY(U,$J,399.5,217,0)
	;;=2901001^11^960^78^1^i
	;;^UTILITY(U,$J,399.5,218,0)
	;;=2901001^7^500^26^1^c
	;;^UTILITY(U,$J,399.5,219,0)
	;;=2901001^7^500^130^1^iop
	;;^UTILITY(U,$J,399.5,220,0)
	;;=2901001^8^250^19^1^iop
	;;^UTILITY(U,$J,399.5,221,0)
	;;=2901201^3^1^568^1^o
	;;^UTILITY(U,$J,399.5,222,0)
	;;=2901201^12^1^865^1^o
	;;^UTILITY(U,$J,399.5,223,0)
	;;=2901201^11^1^585^1^o
	;;^UTILITY(U,$J,399.5,224,0)
	;;=2901201^2^1^475^1^o
	;;^UTILITY(U,$J,399.5,225,0)
	;;=2901201^5^1^498^1^o
	;;^UTILITY(U,$J,399.5,226,0)
	;;=2901201^10^1^406^1^o
	;;^UTILITY(U,$J,399.5,227,0)
	;;=2901201^9^1^257^1^o
	;;^UTILITY(U,$J,399.5,228,0)
	;;=2901201^4^1^184^1^o
	;;^UTILITY(U,$J,399.5,229,0)
	;;=2901201^6^1^164^1^o
	;;^UTILITY(U,$J,399.5,230,0)
	;;=2901201^1^1^205^1^o
	;;^UTILITY(U,$J,399.5,231,0)
	;;=2901201^7^500^116^1^o
	;;^UTILITY(U,$J,399.5,232,0)
	;;=2901201^8^250^17^1^o
	;;^UTILITY(U,$J,399.5,233,0)
	;;=2911001^3^1^628^1^c
	;;^UTILITY(U,$J,399.5,234,0)
	;;=2911001^3^1^687^1^op
	;;^UTILITY(U,$J,399.5,235,0)
	;;=2911001^3^101^386^1^i
	;;^UTILITY(U,$J,399.5,236,0)
	;;=2911001^3^240^169^1^i
	;;^UTILITY(U,$J,399.5,237,0)
	;;=2911001^3^960^132^1^i
	;;^UTILITY(U,$J,399.5,238,0)
	;;=2911001^12^1^628^1^c
	;;^UTILITY(U,$J,399.5,239,0)
	;;=2911001^12^1^982^1^op
	;;^UTILITY(U,$J,399.5,240,0)
	;;=2911001^12^101^542^1^i
	;;^UTILITY(U,$J,399.5,241,0)
	;;=2911001^12^240^257^1^i
	;;^UTILITY(U,$J,399.5,242,0)
	;;=2911001^12^960^183^1^i
	;;^UTILITY(U,$J,399.5,243,0)
	;;=2911001^9^1^297^1^opc
	;;^UTILITY(U,$J,399.5,244,0)
	;;=2911001^9^101^211^1^i
	;;^UTILITY(U,$J,399.5,245,0)
	;;=2911001^9^240^46^1^i
	;;^UTILITY(U,$J,399.5,246,0)
	;;=2911001^9^960^40^1^i
	;;^UTILITY(U,$J,399.5,247,0)
	;;=2911001^4^1^250^1^opc
	;;^UTILITY(U,$J,399.5,248,0)
	;;=2911001^4^101^180^1^i
	;;^UTILITY(U,$J,399.5,249,0)
	;;=2911001^4^240^34^1^i
	;;^UTILITY(U,$J,399.5,250,0)
	;;=2911001^4^960^36^1^i
	;;^UTILITY(U,$J,399.5,251,0)
	;;=2911001^5^1^584^1^opc
	;;^UTILITY(U,$J,399.5,252,0)
	;;=2911001^5^101^326^1^i
	;;^UTILITY(U,$J,399.5,253,0)
	;;=2911001^5^240^186^1^i
	;;^UTILITY(U,$J,399.5,254,0)
	;;=2911001^5^960^72^1^i
	;;^UTILITY(U,$J,399.5,255,0)
	;;=2911001^10^1^476^1^opc
	;;^UTILITY(U,$J,399.5,256,0)
	;;=2911001^10^101^275^1^i
	;;^UTILITY(U,$J,399.5,257,0)
	;;=2911001^10^240^145^1^i
	;;^UTILITY(U,$J,399.5,258,0)
	;;=2911001^10^960^56^1^i