ATXPREI ; IHS/OHPRD/TMJ - CREATED BY XBBPI ON JUL 5,1996 ;
 ;;5.1;TAXONOMY;;FEB 04, 1997
 K ^UTILITY("XBDSET",$J) F XBBPI=1:1 S XBBPIX=$P($T(Q+XBBPI),";;",2) Q:XBBPIX=""  S XBBPIY=$P(XBBPIX,"=",2,99),XBBPIX=$P(XBBPIX,"=",1) S @XBBPIX=XBBPIY
 K XBBPI,XBBPIX,XBBPIY D EN2^XBKD
Q Q
 ;;^UTILITY("XBDSET",$J,9002226)=S^S
 ;;^UTILITY("XBDSET",$J,9002227)=S^S
 ;;^UTILITY("XBDSET",$J,9002228)=S^S