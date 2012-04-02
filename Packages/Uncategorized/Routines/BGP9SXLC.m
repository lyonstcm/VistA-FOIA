BGP9SXLC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"731,00093-8171-01 ",.02)
 ;;00093-8171-01
 ;;9002226.02101,"731,00093-8171-55 ",.01)
 ;;00093-8171-55
 ;;9002226.02101,"731,00093-8171-55 ",.02)
 ;;00093-8171-55
 ;;9002226.02101,"731,00131-1166-05 ",.01)
 ;;00131-1166-05
 ;;9002226.02101,"731,00131-1166-05 ",.02)
 ;;00131-1166-05
 ;;9002226.02101,"731,00182-1547-01 ",.01)
 ;;00182-1547-01
 ;;9002226.02101,"731,00182-1547-01 ",.02)
 ;;00182-1547-01
 ;;9002226.02101,"731,00182-1547-89 ",.01)
 ;;00182-1547-89
 ;;9002226.02101,"731,00182-1547-89 ",.02)
 ;;00182-1547-89
 ;;9002226.02101,"731,00182-1547-96 ",.01)
 ;;00182-1547-96
 ;;9002226.02101,"731,00182-1547-96 ",.02)
 ;;00182-1547-96
 ;;9002226.02101,"731,00182-1548-01 ",.01)
 ;;00182-1548-01
 ;;9002226.02101,"731,00182-1548-01 ",.02)
 ;;00182-1548-01
 ;;9002226.02101,"731,00182-1548-89 ",.01)
 ;;00182-1548-89
 ;;9002226.02101,"731,00182-1548-89 ",.02)
 ;;00182-1548-89
 ;;9002226.02101,"731,00182-1548-96 ",.01)
 ;;00182-1548-96
 ;;9002226.02101,"731,00182-1548-96 ",.02)
 ;;00182-1548-96
 ;;9002226.02101,"731,00228-2497-10 ",.01)
 ;;00228-2497-10
 ;;9002226.02101,"731,00228-2497-10 ",.02)
 ;;00228-2497-10
 ;;9002226.02101,"731,00228-2497-30 ",.01)
 ;;00228-2497-30
 ;;9002226.02101,"731,00228-2497-30 ",.02)
 ;;00228-2497-30
 ;;9002226.02101,"731,00228-2530-10 ",.01)
 ;;00228-2530-10
 ;;9002226.02101,"731,00228-2530-10 ",.02)
 ;;00228-2530-10
 ;;9002226.02101,"731,00228-2530-30 ",.01)
 ;;00228-2530-30
 ;;9002226.02101,"731,00228-2530-30 ",.02)
 ;;00228-2530-30
 ;;9002226.02101,"731,00247-0206-00 ",.01)
 ;;00247-0206-00
 ;;9002226.02101,"731,00247-0206-00 ",.02)
 ;;00247-0206-00
 ;;9002226.02101,"731,00247-0206-01 ",.01)
 ;;00247-0206-01
 ;;9002226.02101,"731,00247-0206-01 ",.02)
 ;;00247-0206-01
 ;;9002226.02101,"731,00247-0206-02 ",.01)
 ;;00247-0206-02
 ;;9002226.02101,"731,00247-0206-02 ",.02)
 ;;00247-0206-02
 ;;9002226.02101,"731,00247-0206-03 ",.01)
 ;;00247-0206-03
 ;;9002226.02101,"731,00247-0206-03 ",.02)
 ;;00247-0206-03
 ;;9002226.02101,"731,00247-0206-05 ",.01)
 ;;00247-0206-05
 ;;9002226.02101,"731,00247-0206-05 ",.02)
 ;;00247-0206-05
 ;;9002226.02101,"731,00247-0206-09 ",.01)
 ;;00247-0206-09
 ;;9002226.02101,"731,00247-0206-09 ",.02)
 ;;00247-0206-09
 ;;9002226.02101,"731,00247-0206-10 ",.01)
 ;;00247-0206-10
 ;;9002226.02101,"731,00247-0206-10 ",.02)
 ;;00247-0206-10
 ;;9002226.02101,"731,00247-0206-12 ",.01)
 ;;00247-0206-12
 ;;9002226.02101,"731,00247-0206-12 ",.02)
 ;;00247-0206-12
 ;;9002226.02101,"731,00247-0206-14 ",.01)
 ;;00247-0206-14
 ;;9002226.02101,"731,00247-0206-14 ",.02)
 ;;00247-0206-14
 ;;9002226.02101,"731,00247-0206-15 ",.01)
 ;;00247-0206-15
 ;;9002226.02101,"731,00247-0206-15 ",.02)
 ;;00247-0206-15
 ;;9002226.02101,"731,00247-0206-20 ",.01)
 ;;00247-0206-20
 ;;9002226.02101,"731,00247-0206-20 ",.02)
 ;;00247-0206-20
 ;;9002226.02101,"731,00247-0206-30 ",.01)
 ;;00247-0206-30
 ;;9002226.02101,"731,00247-0206-30 ",.02)
 ;;00247-0206-30
 ;;9002226.02101,"731,00247-0206-40 ",.01)
 ;;00247-0206-40
 ;;9002226.02101,"731,00247-0206-40 ",.02)
 ;;00247-0206-40
 ;;9002226.02101,"731,00247-0206-60 ",.01)
 ;;00247-0206-60
 ;;9002226.02101,"731,00247-0206-60 ",.02)
 ;;00247-0206-60
 ;;9002226.02101,"731,00247-0206-90 ",.01)
 ;;00247-0206-90
 ;;9002226.02101,"731,00247-0206-90 ",.02)
 ;;00247-0206-90
 ;;9002226.02101,"731,00259-0321-30 ",.01)
 ;;00259-0321-30
 ;;9002226.02101,"731,00259-0321-30 ",.02)
 ;;00259-0321-30
 ;;9002226.02101,"731,00298-6478-63 ",.01)
 ;;00298-6478-63
 ;;9002226.02101,"731,00298-6478-63 ",.02)
 ;;00298-6478-63
 ;;9002226.02101,"731,00298-6809-61 ",.01)
 ;;00298-6809-61
 ;;9002226.02101,"731,00298-6809-61 ",.02)
 ;;00298-6809-61
 ;;9002226.02101,"731,00298-6810-61 ",.01)
 ;;00298-6810-61
 ;;9002226.02101,"731,00298-6810-61 ",.02)
 ;;00298-6810-61
 ;;9002226.02101,"731,00298-6934-69 ",.01)
 ;;00298-6934-69
 ;;9002226.02101,"731,00298-6934-69 ",.02)
 ;;00298-6934-69
 ;;9002226.02101,"731,00302-4400-01 ",.01)
 ;;00302-4400-01
 ;;9002226.02101,"731,00302-4400-01 ",.02)
 ;;00302-4400-01
 ;;9002226.02101,"731,00302-4400-36 ",.01)
 ;;00302-4400-36
 ;;9002226.02101,"731,00302-4400-36 ",.02)
 ;;00302-4400-36
 ;;9002226.02101,"731,00339-5717-12 ",.01)
 ;;00339-5717-12
 ;;9002226.02101,"731,00339-5717-12 ",.02)
 ;;00339-5717-12
 ;;9002226.02101,"731,00339-5718-12 ",.01)
 ;;00339-5718-12
 ;;9002226.02101,"731,00339-5718-12 ",.02)
 ;;00339-5718-12
 ;;9002226.02101,"731,00349-8319-70 ",.01)
 ;;00349-8319-70
 ;;9002226.02101,"731,00349-8319-70 ",.02)
 ;;00349-8319-70
 ;;9002226.02101,"731,00364-2376-90 ",.01)
 ;;00364-2376-90
 ;;9002226.02101,"731,00364-2376-90 ",.02)
 ;;00364-2376-90
 ;;9002226.02101,"731,00405-4696-01 ",.01)
 ;;00405-4696-01
 ;;9002226.02101,"731,00405-4696-01 ",.02)
 ;;00405-4696-01
 ;;9002226.02101,"731,00405-4696-09 ",.01)
 ;;00405-4696-09
 ;;9002226.02101,"731,00405-4696-09 ",.02)
 ;;00405-4696-09
 ;;9002226.02101,"731,00405-4697-01 ",.01)
 ;;00405-4697-01
 ;;9002226.02101,"731,00405-4697-01 ",.02)
 ;;00405-4697-01
 ;;9002226.02101,"731,00405-4697-09 ",.01)
 ;;00405-4697-09
 ;;9002226.02101,"731,00405-4697-09 ",.02)
 ;;00405-4697-09
 ;;9002226.02101,"731,00418-3331-61 ",.01)
 ;;00418-3331-61