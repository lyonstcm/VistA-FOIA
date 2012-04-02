BGP0ZD14 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"976,49999-0009-42 ",.02)
 ;;49999-0009-42
 ;;9002226.02101,"976,49999-0013-14 ",.01)
 ;;49999-0013-14
 ;;9002226.02101,"976,49999-0013-14 ",.02)
 ;;49999-0013-14
 ;;9002226.02101,"976,49999-0038-14 ",.01)
 ;;49999-0038-14
 ;;9002226.02101,"976,49999-0038-14 ",.02)
 ;;49999-0038-14
 ;;9002226.02101,"976,49999-0038-28 ",.01)
 ;;49999-0038-28
 ;;9002226.02101,"976,49999-0038-28 ",.02)
 ;;49999-0038-28
 ;;9002226.02101,"976,49999-0038-30 ",.01)
 ;;49999-0038-30
 ;;9002226.02101,"976,49999-0038-30 ",.02)
 ;;49999-0038-30
 ;;9002226.02101,"976,49999-0038-40 ",.01)
 ;;49999-0038-40
 ;;9002226.02101,"976,49999-0038-40 ",.02)
 ;;49999-0038-40
 ;;9002226.02101,"976,49999-0042-00 ",.01)
 ;;49999-0042-00
 ;;9002226.02101,"976,49999-0042-00 ",.02)
 ;;49999-0042-00
 ;;9002226.02101,"976,49999-0042-06 ",.01)
 ;;49999-0042-06
 ;;9002226.02101,"976,49999-0042-06 ",.02)
 ;;49999-0042-06
 ;;9002226.02101,"976,49999-0042-15 ",.01)
 ;;49999-0042-15
 ;;9002226.02101,"976,49999-0042-15 ",.02)
 ;;49999-0042-15
 ;;9002226.02101,"976,49999-0042-18 ",.01)
 ;;49999-0042-18
 ;;9002226.02101,"976,49999-0042-18 ",.02)
 ;;49999-0042-18
 ;;9002226.02101,"976,49999-0042-20 ",.01)
 ;;49999-0042-20
 ;;9002226.02101,"976,49999-0042-20 ",.02)
 ;;49999-0042-20
 ;;9002226.02101,"976,49999-0042-21 ",.01)
 ;;49999-0042-21
 ;;9002226.02101,"976,49999-0042-21 ",.02)
 ;;49999-0042-21
 ;;9002226.02101,"976,49999-0042-25 ",.01)
 ;;49999-0042-25
 ;;9002226.02101,"976,49999-0042-25 ",.02)
 ;;49999-0042-25
 ;;9002226.02101,"976,49999-0042-30 ",.01)
 ;;49999-0042-30
 ;;9002226.02101,"976,49999-0042-30 ",.02)
 ;;49999-0042-30
 ;;9002226.02101,"976,49999-0042-40 ",.01)
 ;;49999-0042-40
 ;;9002226.02101,"976,49999-0042-40 ",.02)
 ;;49999-0042-40
 ;;9002226.02101,"976,49999-0042-50 ",.01)
 ;;49999-0042-50
 ;;9002226.02101,"976,49999-0042-50 ",.02)
 ;;49999-0042-50
 ;;9002226.02101,"976,49999-0042-60 ",.01)
 ;;49999-0042-60
 ;;9002226.02101,"976,49999-0042-60 ",.02)
 ;;49999-0042-60
 ;;9002226.02101,"976,49999-0049-01 ",.01)
 ;;49999-0049-01
 ;;9002226.02101,"976,49999-0049-01 ",.02)
 ;;49999-0049-01
 ;;9002226.02101,"976,49999-0049-10 ",.01)
 ;;49999-0049-10
 ;;9002226.02101,"976,49999-0049-10 ",.02)
 ;;49999-0049-10
 ;;9002226.02101,"976,49999-0049-20 ",.01)
 ;;49999-0049-20
 ;;9002226.02101,"976,49999-0049-20 ",.02)
 ;;49999-0049-20
 ;;9002226.02101,"976,49999-0049-28 ",.01)
 ;;49999-0049-28
 ;;9002226.02101,"976,49999-0049-28 ",.02)
 ;;49999-0049-28
 ;;9002226.02101,"976,49999-0049-30 ",.01)
 ;;49999-0049-30
 ;;9002226.02101,"976,49999-0049-30 ",.02)
 ;;49999-0049-30
 ;;9002226.02101,"976,49999-0049-60 ",.01)
 ;;49999-0049-60
 ;;9002226.02101,"976,49999-0049-60 ",.02)
 ;;49999-0049-60
 ;;9002226.02101,"976,49999-0058-14 ",.01)
 ;;49999-0058-14
 ;;9002226.02101,"976,49999-0058-14 ",.02)
 ;;49999-0058-14
 ;;9002226.02101,"976,49999-0058-15 ",.01)
 ;;49999-0058-15
 ;;9002226.02101,"976,49999-0058-15 ",.02)
 ;;49999-0058-15
 ;;9002226.02101,"976,49999-0058-20 ",.01)
 ;;49999-0058-20
 ;;9002226.02101,"976,49999-0058-20 ",.02)
 ;;49999-0058-20
 ;;9002226.02101,"976,49999-0058-28 ",.01)
 ;;49999-0058-28
 ;;9002226.02101,"976,49999-0058-28 ",.02)
 ;;49999-0058-28
 ;;9002226.02101,"976,49999-0058-30 ",.01)
 ;;49999-0058-30
 ;;9002226.02101,"976,49999-0058-30 ",.02)
 ;;49999-0058-30
 ;;9002226.02101,"976,49999-0058-60 ",.01)
 ;;49999-0058-60
 ;;9002226.02101,"976,49999-0058-60 ",.02)
 ;;49999-0058-60
 ;;9002226.02101,"976,49999-0072-30 ",.01)
 ;;49999-0072-30
 ;;9002226.02101,"976,49999-0072-30 ",.02)
 ;;49999-0072-30
 ;;9002226.02101,"976,49999-0074-07 ",.01)
 ;;49999-0074-07
 ;;9002226.02101,"976,49999-0074-07 ",.02)
 ;;49999-0074-07
 ;;9002226.02101,"976,49999-0074-30 ",.01)
 ;;49999-0074-30
 ;;9002226.02101,"976,49999-0074-30 ",.02)
 ;;49999-0074-30
 ;;9002226.02101,"976,49999-0089-14 ",.01)
 ;;49999-0089-14
 ;;9002226.02101,"976,49999-0089-14 ",.02)
 ;;49999-0089-14
 ;;9002226.02101,"976,49999-0089-20 ",.01)
 ;;49999-0089-20
 ;;9002226.02101,"976,49999-0089-20 ",.02)
 ;;49999-0089-20
 ;;9002226.02101,"976,49999-0089-28 ",.01)
 ;;49999-0089-28
 ;;9002226.02101,"976,49999-0089-28 ",.02)
 ;;49999-0089-28
 ;;9002226.02101,"976,49999-0089-30 ",.01)
 ;;49999-0089-30
 ;;9002226.02101,"976,49999-0089-30 ",.02)
 ;;49999-0089-30
 ;;9002226.02101,"976,49999-0097-16 ",.01)
 ;;49999-0097-16
 ;;9002226.02101,"976,49999-0097-16 ",.02)
 ;;49999-0097-16
 ;;9002226.02101,"976,49999-0097-20 ",.01)
 ;;49999-0097-20
 ;;9002226.02101,"976,49999-0097-20 ",.02)
 ;;49999-0097-20
 ;;9002226.02101,"976,49999-0097-28 ",.01)
 ;;49999-0097-28
 ;;9002226.02101,"976,49999-0097-28 ",.02)
 ;;49999-0097-28
 ;;9002226.02101,"976,49999-0097-30 ",.01)
 ;;49999-0097-30
 ;;9002226.02101,"976,49999-0097-30 ",.02)
 ;;49999-0097-30
 ;;9002226.02101,"976,49999-0097-50 ",.01)
 ;;49999-0097-50
 ;;9002226.02101,"976,49999-0097-50 ",.02)
 ;;49999-0097-50
 ;;9002226.02101,"976,49999-0097-60 ",.01)
 ;;49999-0097-60
 ;;9002226.02101,"976,49999-0097-60 ",.02)
 ;;49999-0097-60
 ;;9002226.02101,"976,49999-0100-15 ",.01)
 ;;49999-0100-15
 ;;9002226.02101,"976,49999-0100-15 ",.02)
 ;;49999-0100-15
 ;;9002226.02101,"976,49999-0100-21 ",.01)
 ;;49999-0100-21
 ;;9002226.02101,"976,49999-0100-21 ",.02)
 ;;49999-0100-21
 ;;9002226.02101,"976,49999-0100-30 ",.01)
 ;;49999-0100-30
 ;;9002226.02101,"976,49999-0100-30 ",.02)
 ;;49999-0100-30
 ;;9002226.02101,"976,49999-0100-50 ",.01)
 ;;49999-0100-50
 ;;9002226.02101,"976,49999-0100-50 ",.02)
 ;;49999-0100-50
 ;;9002226.02101,"976,49999-0102-14 ",.01)
 ;;49999-0102-14
 ;;9002226.02101,"976,49999-0102-14 ",.02)
 ;;49999-0102-14
 ;;9002226.02101,"976,49999-0102-15 ",.01)
 ;;49999-0102-15
 ;;9002226.02101,"976,49999-0102-15 ",.02)
 ;;49999-0102-15
 ;;9002226.02101,"976,49999-0102-20 ",.01)
 ;;49999-0102-20
 ;;9002226.02101,"976,49999-0102-20 ",.02)
 ;;49999-0102-20
 ;;9002226.02101,"976,49999-0102-30 ",.01)
 ;;49999-0102-30
 ;;9002226.02101,"976,49999-0102-30 ",.02)
 ;;49999-0102-30
 ;;9002226.02101,"976,49999-0102-60 ",.01)
 ;;49999-0102-60
 ;;9002226.02101,"976,49999-0102-60 ",.02)
 ;;49999-0102-60
 ;;9002226.02101,"976,49999-0103-14 ",.01)
 ;;49999-0103-14
 ;;9002226.02101,"976,49999-0103-14 ",.02)
 ;;49999-0103-14
 ;;9002226.02101,"976,49999-0103-20 ",.01)
 ;;49999-0103-20
 ;;9002226.02101,"976,49999-0103-20 ",.02)
 ;;49999-0103-20
 ;;9002226.02101,"976,49999-0103-30 ",.01)
 ;;49999-0103-30
 ;;9002226.02101,"976,49999-0103-30 ",.02)
 ;;49999-0103-30
 ;;9002226.02101,"976,49999-0103-60 ",.01)
 ;;49999-0103-60
 ;;9002226.02101,"976,49999-0103-60 ",.02)
 ;;49999-0103-60
 ;;9002226.02101,"976,49999-0111-30 ",.01)
 ;;49999-0111-30
 ;;9002226.02101,"976,49999-0111-30 ",.02)
 ;;49999-0111-30
 ;;9002226.02101,"976,49999-0124-14 ",.01)
 ;;49999-0124-14
 ;;9002226.02101,"976,49999-0124-14 ",.02)
 ;;49999-0124-14
 ;;9002226.02101,"976,49999-0124-30 ",.01)
 ;;49999-0124-30
 ;;9002226.02101,"976,49999-0124-30 ",.02)
 ;;49999-0124-30
 ;;9002226.02101,"976,49999-0125-14 ",.01)
 ;;49999-0125-14
 ;;9002226.02101,"976,49999-0125-14 ",.02)
 ;;49999-0125-14
 ;;9002226.02101,"976,49999-0125-30 ",.01)
 ;;49999-0125-30
 ;;9002226.02101,"976,49999-0125-30 ",.02)
 ;;49999-0125-30
 ;;9002226.02101,"976,49999-0130-10 ",.01)
 ;;49999-0130-10
 ;;9002226.02101,"976,49999-0130-10 ",.02)
 ;;49999-0130-10
 ;;9002226.02101,"976,49999-0130-15 ",.01)
 ;;49999-0130-15
 ;;9002226.02101,"976,49999-0130-15 ",.02)
 ;;49999-0130-15
 ;;9002226.02101,"976,49999-0130-20 ",.01)
 ;;49999-0130-20
 ;;9002226.02101,"976,49999-0130-20 ",.02)
 ;;49999-0130-20
 ;;9002226.02101,"976,49999-0130-21 ",.01)
 ;;49999-0130-21
 ;;9002226.02101,"976,49999-0130-21 ",.02)
 ;;49999-0130-21
 ;;9002226.02101,"976,49999-0130-30 ",.01)
 ;;49999-0130-30
 ;;9002226.02101,"976,49999-0130-30 ",.02)
 ;;49999-0130-30
 ;;9002226.02101,"976,49999-0132-30 ",.01)
 ;;49999-0132-30
 ;;9002226.02101,"976,49999-0132-30 ",.02)
 ;;49999-0132-30
 ;;9002226.02101,"976,49999-0132-60 ",.01)
 ;;49999-0132-60
 ;;9002226.02101,"976,49999-0132-60 ",.02)
 ;;49999-0132-60
 ;;9002226.02101,"976,49999-0194-30 ",.01)
 ;;49999-0194-30
 ;;9002226.02101,"976,49999-0194-30 ",.02)
 ;;49999-0194-30
 ;;9002226.02101,"976,49999-0200-60 ",.01)
 ;;49999-0200-60
 ;;9002226.02101,"976,49999-0200-60 ",.02)
 ;;49999-0200-60
 ;;9002226.02101,"976,49999-0233-28 ",.01)
 ;;49999-0233-28
 ;;9002226.02101,"976,49999-0233-28 ",.02)
 ;;49999-0233-28
 ;;9002226.02101,"976,49999-0233-42 ",.01)
 ;;49999-0233-42
 ;;9002226.02101,"976,49999-0233-42 ",.02)
 ;;49999-0233-42
 ;;9002226.02101,"976,49999-0234-15 ",.01)
 ;;49999-0234-15
 ;;9002226.02101,"976,49999-0234-15 ",.02)
 ;;49999-0234-15
 ;;9002226.02101,"976,49999-0234-20 ",.01)
 ;;49999-0234-20
 ;;9002226.02101,"976,49999-0234-20 ",.02)
 ;;49999-0234-20
 ;;9002226.02101,"976,49999-0234-30 ",.01)
 ;;49999-0234-30
 ;;9002226.02101,"976,49999-0234-30 ",.02)
 ;;49999-0234-30
 ;;9002226.02101,"976,49999-0311-60 ",.01)
 ;;49999-0311-60
 ;;9002226.02101,"976,49999-0311-60 ",.02)
 ;;49999-0311-60
 ;;9002226.02101,"976,49999-0368-25 ",.01)
 ;;49999-0368-25
 ;;9002226.02101,"976,49999-0368-25 ",.02)
 ;;49999-0368-25
 ;;9002226.02101,"976,49999-0371-30 ",.01)
 ;;49999-0371-30
 ;;9002226.02101,"976,49999-0371-30 ",.02)
 ;;49999-0371-30
 ;;9002226.02101,"976,49999-0376-30 ",.01)
 ;;49999-0376-30
 ;;9002226.02101,"976,49999-0376-30 ",.02)
 ;;49999-0376-30
 ;;9002226.02101,"976,49999-0383-10 ",.01)
 ;;49999-0383-10
 ;;9002226.02101,"976,49999-0383-10 ",.02)
 ;;49999-0383-10
 ;;9002226.02101,"976,49999-0383-14 ",.01)
 ;;49999-0383-14
 ;;9002226.02101,"976,49999-0383-14 ",.02)
 ;;49999-0383-14
 ;;9002226.02101,"976,49999-0383-20 ",.01)
 ;;49999-0383-20
 ;;9002226.02101,"976,49999-0383-20 ",.02)
 ;;49999-0383-20
 ;;9002226.02101,"976,49999-0383-30 ",.01)
 ;;49999-0383-30
 ;;9002226.02101,"976,49999-0383-30 ",.02)
 ;;49999-0383-30
 ;;9002226.02101,"976,49999-0383-60 ",.01)
 ;;49999-0383-60
 ;;9002226.02101,"976,49999-0383-60 ",.02)
 ;;49999-0383-60
 ;;9002226.02101,"976,49999-0416-02 ",.01)
 ;;49999-0416-02
 ;;9002226.02101,"976,49999-0416-02 ",.02)
 ;;49999-0416-02
 ;;9002226.02101,"976,49999-0423-14 ",.01)
 ;;49999-0423-14
 ;;9002226.02101,"976,49999-0423-14 ",.02)
 ;;49999-0423-14
 ;;9002226.02101,"976,49999-0429-20 ",.01)
 ;;49999-0429-20
 ;;9002226.02101,"976,49999-0429-20 ",.02)
 ;;49999-0429-20
 ;;9002226.02101,"976,49999-0492-42 ",.01)
 ;;49999-0492-42
 ;;9002226.02101,"976,49999-0492-42 ",.02)
 ;;49999-0492-42
 ;;9002226.02101,"976,50111-0528-01 ",.01)
 ;;50111-0528-01
 ;;9002226.02101,"976,50111-0528-01 ",.02)
 ;;50111-0528-01
 ;;9002226.02101,"976,50111-0529-01 ",.01)
 ;;50111-0529-01
 ;;9002226.02101,"976,50111-0529-01 ",.02)
 ;;50111-0529-01
 ;;9002226.02101,"976,50111-0529-02 ",.01)
 ;;50111-0529-02
 ;;9002226.02101,"976,50111-0529-02 ",.02)
 ;;50111-0529-02
 ;;9002226.02101,"976,50111-0530-01 ",.01)
 ;;50111-0530-01
 ;;9002226.02101,"976,50111-0530-01 ",.02)
 ;;50111-0530-01
 ;;9002226.02101,"976,50111-0546-01 ",.01)
 ;;50111-0546-01
 ;;9002226.02101,"976,50111-0546-01 ",.02)
 ;;50111-0546-01
 ;;9002226.02101,"976,50111-0546-02 ",.01)
 ;;50111-0546-02
 ;;9002226.02101,"976,50111-0546-02 ",.02)
 ;;50111-0546-02
 ;;9002226.02101,"976,50111-0546-03 ",.01)
 ;;50111-0546-03
 ;;9002226.02101,"976,50111-0546-03 ",.02)
 ;;50111-0546-03
 ;;9002226.02101,"976,50111-0546-04 ",.01)
 ;;50111-0546-04
 ;;9002226.02101,"976,50111-0546-04 ",.02)
 ;;50111-0546-04
 ;;9002226.02101,"976,50111-0547-01 ",.01)
 ;;50111-0547-01
 ;;9002226.02101,"976,50111-0547-01 ",.02)
 ;;50111-0547-01
 ;;9002226.02101,"976,50111-0547-02 ",.01)
 ;;50111-0547-02
 ;;9002226.02101,"976,50111-0547-02 ",.02)
 ;;50111-0547-02
 ;;9002226.02101,"976,50111-0547-03 ",.01)
 ;;50111-0547-03
 ;;9002226.02101,"976,50111-0547-03 ",.02)
 ;;50111-0547-03
 ;;9002226.02101,"976,50111-0547-04 ",.01)
 ;;50111-0547-04
 ;;9002226.02101,"976,50111-0547-04 ",.02)
 ;;50111-0547-04
 ;;9002226.02101,"976,50111-0608-01 ",.01)
 ;;50111-0608-01
 ;;9002226.02101,"976,50111-0608-01 ",.02)
 ;;50111-0608-01
 ;;9002226.02101,"976,50111-0614-01 ",.01)
 ;;50111-0614-01
 ;;9002226.02101,"976,50111-0614-01 ",.02)
 ;;50111-0614-01
 ;;9002226.02101,"976,50111-0615-01 ",.01)
 ;;50111-0615-01
 ;;9002226.02101,"976,50111-0615-01 ",.02)
 ;;50111-0615-01
 ;;9002226.02101,"976,50962-0475-60 ",.01)
 ;;50962-0475-60
 ;;9002226.02101,"976,50962-0475-60 ",.02)
 ;;50962-0475-60
 ;;9002226.02101,"976,51079-0190-19 ",.01)
 ;;51079-0190-19
 ;;9002226.02101,"976,51079-0190-19 ",.02)
 ;;51079-0190-19
 ;;9002226.02101,"976,51079-0190-20 ",.01)
 ;;51079-0190-20
 ;;9002226.02101,"976,51079-0190-20 ",.02)
 ;;51079-0190-20
 ;;9002226.02101,"976,51079-0191-20 ",.01)
 ;;51079-0191-20
 ;;9002226.02101,"976,51079-0191-20 ",.02)
 ;;51079-0191-20
 ;;9002226.02101,"976,51079-0281-19 ",.01)
 ;;51079-0281-19
 ;;9002226.02101,"976,51079-0281-19 ",.02)
 ;;51079-0281-19
 ;;9002226.02101,"976,51079-0281-20 ",.01)
 ;;51079-0281-20
 ;;9002226.02101,"976,51079-0281-20 ",.02)
 ;;51079-0281-20
 ;;9002226.02101,"976,51079-0282-19 ",.01)
 ;;51079-0282-19
 ;;9002226.02101,"976,51079-0282-19 ",.02)
 ;;51079-0282-19
 ;;9002226.02101,"976,51079-0282-20 ",.01)
 ;;51079-0282-20
 ;;9002226.02101,"976,51079-0282-20 ",.02)
 ;;51079-0282-20
 ;;9002226.02101,"976,51079-0282-98 ",.01)
 ;;51079-0282-98
 ;;9002226.02101,"976,51079-0282-98 ",.02)
 ;;51079-0282-98
 ;;9002226.02101,"976,51079-0597-19 ",.01)
 ;;51079-0597-19