FHINI066	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,2120,1)
	;;=7.26^76.52^12.9^718^1.67^^^45^1.8^117^200^329^260^1.1^.3^.595^^9^0^.213
	;;^UTILITY(U,$J,112,2120,2)
	;;=.109^2.02^.442^.198^15.7^0^1.319^^0^11.456^60.378^1.319^1^1.65^^^9.3
	;;^UTILITY(U,$J,112,2120,3)
	;;=.186^.23^.214^.404^.284^.081^.084^.227^.295^.281^.786^.147^.288^.723^1.559^.325^.347^.307
	;;^UTILITY(U,$J,112,2120,4)
	;;=^^.486^6.484^16.567^2.807^42.725
	;;^UTILITY(U,$J,112,2120,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2121,0)
	;;=MIXED NUTS, WITH PEANUTS, DRY ROASTED, W/SALT^12-635^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2121,1)
	;;=17.3^51.45^25.35^594^1.75^^^70^3.7^225^435^597^669^3.8^1.279^1.937^^15^.4^.2
	;;^UTILITY(U,$J,112,2121,2)
	;;=.2^4.7^1.205^.296^50.4^0^10.535^.19^0^6.899^31.395^10.768^1^4.15^^^9
	;;^UTILITY(U,$J,112,2121,3)
	;;=.264^.597^.744^1.371^.712^.228^.287^.953^.676^.934^2.242^.48^.806^2.056^4.423^1.064^.875^.917
	;;^UTILITY(U,$J,112,2121,4)
	;;=.045^.271^.216^4.213^.223^1.749^30.802
	;;^UTILITY(U,$J,112,2121,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2122,0)
	;;=MIXED NUTS, WITH PEANUTS, OIL ROASTED, W/SALT^12-637^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2122,1)
	;;=16.76^56.33^21.41^617^2.03^^^108^3.21^235^464^581^652^5.08^1.661^1.892^^19^.5^.498
	;;^UTILITY(U,$J,112,2122,2)
	;;=.222^5.061^1.248^.24^83^0^13.067^.176^0^8.725^31.695^13.299^2^3.47^^^9
	;;^UTILITY(U,$J,112,2122,3)
	;;=.247^.569^.724^1.344^.658^.338^.294^.92^.655^.936^2.024^.471^.772^1.958^4.128^1.006^.822^.911
	;;^UTILITY(U,$J,112,2122,4)
	;;=.05^.296^.255^5.238^.238^2.423^31.048
	;;^UTILITY(U,$J,112,2122,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2123,0)
	;;=MIXED NUTS, WITHOUT PEANUTS, OIL ROASTED, W/SALT^12-638^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2123,1)
	;;=15.52^56.17^22.27^615^3.15^^^106^2.57^251^449^544^700^4.66^1.795^1.547^^20^.5^.504
	;;^UTILITY(U,$J,112,2123,2)
	;;=.486^1.964^.962^.18^56.4^0^11.137^.249^0^9.087^33.137^11.449^2^2.89^^^5.5
	;;^UTILITY(U,$J,112,2123,3)
	;;=.252^.568^.703^1.265^.682^.346^.302^.82^.51^.952^1.989^.416^.715^1.617^3.872^.844^.773^1.62
	;;^UTILITY(U,$J,112,2123,4)
	;;=.078^.467^.342^4.932^.329^2.783^32.517
	;;^UTILITY(U,$J,112,2123,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2124,0)
	;;=PISTACHIO NUTS, DRY ROASTED, W/SALT^12-652^oz.^28.3^52^N
	;;^UTILITY(U,$J,112,2124,1)
	;;=14.93^52.82^27.53^606^2.09^^^70^3.17^130^476^970^780^1.36^1.211^.333^^238^7.3^.423
	;;^UTILITY(U,$J,112,2124,2)
	;;=.246^1.408^1.212^.255^59.1^0^7.665^.275^0^6.688^35.659^7.986^24^2.63^^^10.8
	;;^UTILITY(U,$J,112,2124,3)
	;;=.206^.524^.707^1.217^.927^.276^.372^.859^.518^1.023^1.586^.389^.721^1.535^3.566^.794^.687^.98
	;;^UTILITY(U,$J,112,2124,4)
	;;=^^.05^5.838^.313^.685^34.904
	;;^UTILITY(U,$J,112,2124,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2125,0)
	;;=BEEF, COMPOSITE OF TRIMMED CUTS, ALL GRADES, COOKED^13-012^oz.^28.35^59^N
	;;^UTILITY(U,$J,112,2125,1)
	;;=29.58^9.91^0^216^59.25^^^9^2.99^26^233^360^67^6.93^.125^.017^^0^0^.1
	;;^UTILITY(U,$J,112,2125,2)
	;;=.24^4.13^.4^.37^8^2.64^.27^.03^86^3.79^4.17^.34^0^1.2^^^0
	;;^UTILITY(U,$J,112,2125,3)
	;;=.331^1.292^1.33^2.338^2.461^.757^.331^1.155^.994^1.439^1.869^1.013^1.784^2.702^4.444^1.614^1.306^1.131
	;;^UTILITY(U,$J,112,2125,4)
	;;=.01^.01^.28^2.25^.35^1.22^3.8^.04
	;;^UTILITY(U,$J,112,2125,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2126,0)
	;;=BEEF, COMPOSITE OF TRIMMED CUTS, CHOICE, COOKED^13-014^oz.^28.35^59^N
	;;^UTILITY(U,$J,112,2126,1)
	;;=29.58^10.66^0^222^58.87^^^9^2.99^26^233^360^67^6.92^.125^.017^^0^0^.1
	;;^UTILITY(U,$J,112,2126,2)
	;;=.24^4.14^.4^.37^8^2.64^.29^.03^86^4.07^4.48^.36^0^1.2^^^0
	;;^UTILITY(U,$J,112,2126,3)
	;;=.331^1.292^1.33^2.338^2.461^.757^.331^1.155^.994^1.439^1.869^1.013^1.784^2.702^4.444^1.614^1.306^1.131
	;;^UTILITY(U,$J,112,2126,4)
	;;=.01^.01^.3^2.42^.38^1.32^4.09^.04
	;;^UTILITY(U,$J,112,2126,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2127,0)
	;;=BEEF, COMPOSITE OF TRIMMED CUTS, GOOD, COOKED^13-016^oz.^28.35^60^N
	;;^UTILITY(U,$J,112,2127,1)
	;;=29.59^8.76^0^205^59.96^^^9^2.99^26^233^359^67^6.94^.125^.017^^0^0^.1
	;;^UTILITY(U,$J,112,2127,2)
	;;=.24^4.13^.4^.37^8^2.64^.24^.03^86^3.35^3.69^.3^0^1.2^^^0
	;;^UTILITY(U,$J,112,2127,3)
	;;=.331^1.292^1.33^2.339^2.462^.757^.331^1.155^.994^1.439^1.87^1.013^1.785^2.703^4.445^1.614^1.307^1.131
	;;^UTILITY(U,$J,112,2127,4)
	;;=.01^.01^.25^1.99^.31^1.08^3.36^.03
	;;^UTILITY(U,$J,112,2127,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2128,0)
	;;=BEEF, BRISKET, WHOLE, ALL GRADES, TRIMMED, BRAISED^13-024^oz.^28.35^66^N