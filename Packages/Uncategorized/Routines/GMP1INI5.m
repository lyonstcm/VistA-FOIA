GMP1INI5 ; ; 01-SEP-1995
 ;;2.0;Problem List;**3**;AUG 25, 1994
 K ^UTILITY("DIF",$J) S DIFRDIFI=1 F I=1:1:2 S ^UTILITY("DIF",$J,DIFRDIFI)=$T(IXF+I),DIFRDIFI=DIFRDIFI+1
 Q
IXF ;;Problem List^GMP1
 ;;125.99;PROBLEM LIST SITE PARAMETERS;^GMPL(125.99,;1;y;y;;n;;;n
 ;;