FHINI0BF	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,7505,1)
	;;=6.3^12.6^25^240^54^^^20^1.6^^65^145^494^^^^^65^3^.2
	;;^UTILITY(U,$J,112,7505,2)
	;;=.12^2
	;;^UTILITY(U,$J,112,7505,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7506,0)
	;;=ENTREES,EGG ROLLS,MEAT & SHRIMP,LACHOY^BC-00779^3-med.^37
	;;^UTILITY(U,$J,112,7506,1)
	;;=8.108^8.108^29.73^216.216^^^^24.324^2.162^^^175.676^310.811^^^^^^8.108^.324
	;;^UTILITY(U,$J,112,7506,2)
	;;=.189^2.703^^^^^^^10.811^1.622^^3.243^5.405^^^^0
	;;^UTILITY(U,$J,112,7506,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7507,0)
	;;=ENTREES,EGG ROLLS,PORK,CHUN KING^BC-00780^3-oz.^85
	;;^UTILITY(U,$J,112,7507,1)
	;;=7.059^7.059^27.059^211.765^^^^48.235^1.176^^^294.118^529.412^^^^^732.941^10.588^.435
	;;^UTILITY(U,$J,112,7507,2)
	;;=.188^2.353
	;;^UTILITY(U,$J,112,7507,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7508,0)
	;;=ENTREES,EGG ROLLS,PORK,LACHOY^BC-00781^3-oz.^85
	;;^UTILITY(U,$J,112,7508,1)
	;;=8.235^5.882^23.529^176.471^^^^117.647^2.588^^^411.765^564.706^^^^^^23.529^.282
	;;^UTILITY(U,$J,112,7508,2)
	;;=.235^8.235^^^^^^^8.235^1.176^^2.588^75.294^^^^1.176
	;;^UTILITY(U,$J,112,7508,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7509,0)
	;;=ENTREES,EGG ROLLS,SHRIMP & CHEESE,JENO'S SNACKS^BC-00782^3.5-oz.^100
	;;^UTILITY(U,$J,112,7509,1)
	;;=7.8^9.5^26^221^55^^^53^1.8^^100^183^346^^^^^321^9^.18
	;;^UTILITY(U,$J,112,7509,2)
	;;=.12^2.1
	;;^UTILITY(U,$J,112,7509,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7510,0)
	;;=ENTREES,EGG ROLLS,SHRIMP,CHUN KING^BC-00783^3.6-oz.^102
	;;^UTILITY(U,$J,112,7510,1)
	;;=3.922^5.882^30.392^196.078^^^^22.549^^^^78.431^470.588^^^^^327.451^0^.088
	;;^UTILITY(U,$J,112,7510,2)
	;;=.029^.392
	;;^UTILITY(U,$J,112,7510,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7511,0)
	;;=ENTREES,EGG ROLLS,SHRIMP,LACHOY^BC-00784^3-oz.^85
	;;^UTILITY(U,$J,112,7511,1)
	;;=5.882^4.706^22.353^152.941^^^^32.941^1.765^^^211.765^305.882^^^^^^9.412^.2
	;;^UTILITY(U,$J,112,7511,2)
	;;=.153^1.765^^^^^^^5.882^.941^^2.471^64.706^^^^1.176
	;;^UTILITY(U,$J,112,7511,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7512,0)
	;;=ENTREES,EGG ROLLS,SHRIMP,LACHOY (SMALL)^BC-00785^3-small^37
	;;^UTILITY(U,$J,112,7512,1)
	;;=5.405^5.405^32.432^202.703^^^^29.73^2.162^^^175.676^324.324^^^^^^10.811^.297
	;;^UTILITY(U,$J,112,7512,2)
	;;=.189^2.162^^^^^^^10.811^1.081^^2.973^13.514^^^^0
	;;^UTILITY(U,$J,112,7512,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7513,0)
	;;=ENTREES,EGG ROLLS,SWEET & SOUR,LACHOY^BC-00786^3-oz.^85
	;;^UTILITY(U,$J,112,7513,1)
	;;=7.059^4.706^31.765^188.235^^^^22.353^1.529^^^176.471^376.471^^^^^^16.471^.235
	;;^UTILITY(U,$J,112,7513,2)
	;;=.153^3.059^^^^^^^8.235^.706^^2.353^12.941^^^^0
	;;^UTILITY(U,$J,112,7513,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7514,0)
	;;=ENTREES,ENCHANADA,BEEF & BEANS,LEAN CUISINE^BC-00787^9.2-oz.^262
	;;^UTILITY(U,$J,112,7514,1)
	;;=5.725^3.817^12.214^106.87^^^^57.252^1.031^^^160.305^339.695^^^^^381.679^2.29^.088
	;;^UTILITY(U,$J,112,7514,2)
	;;=.13^1.145^^^^^^^22.901^.763^^.382
	;;^UTILITY(U,$J,112,7514,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7515,0)
	;;=ENTREES,ENCHANADA,CHICKEN,LEAN CUISINE^BC-00788^9.9-oz.^280
	;;^UTILITY(U,$J,112,7515,1)
	;;=6.071^3.214^11.071^96.429^^^^53.571^.964^^^146.429^303.571^^^^^446.429^2.143^.082
	;;^UTILITY(U,$J,112,7515,2)
	;;=.121^1.071^^^^^^^23.214^.714^^.714
	;;^UTILITY(U,$J,112,7515,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7516,0)
	;;=ENTREES,ENCHILADAS,BEEF W/CHILI GRAVY,BANQUET^BC-00789^7-oz.^198
	;;^UTILITY(U,$J,112,7516,1)
	;;=5.051^6.566^14.141^136.364
	;;^UTILITY(U,$J,112,7516,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7517,0)
	;;=ENTREES,ENCHILADAS,CHICKEN,LE MENU LIGHTSTYLE^BC-00790^8.25-oz.^234
	;;^UTILITY(U,$J,112,7517,1)
	;;=8.162^2.821^14.188^114.53^^^^91.88^.769^^^266.667^229.487^^^^^147.009^4.701^.047
	;;^UTILITY(U,$J,112,7517,2)
	;;=.162^1.368^^^^^^^14.103^.855^^.812
	;;^UTILITY(U,$J,112,7517,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7518,0)
	;;=ENTREES,FETTUCINI,ALFREDO,HEALTHY CHOICE^BC-00791^8-oz.^227
	;;^UTILITY(U,$J,112,7518,1)
	;;=4.405^3.084^15.859^105.727^^^^45.374^.881^^65.198^30.837^162.996^^^^^^0^.101
	;;^UTILITY(U,$J,112,7518,2)
	;;=.088^.529^^^^^^^19.824