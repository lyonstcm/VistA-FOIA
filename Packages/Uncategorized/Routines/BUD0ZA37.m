BUD0ZA37 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON DEC 13, 2010;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1062,58016-0378-60 ",.02)
 ;;58016-0378-60
 ;;9002226.02101,"1062,58016-0378-90 ",.01)
 ;;58016-0378-90
 ;;9002226.02101,"1062,58016-0378-90 ",.02)
 ;;58016-0378-90
 ;;9002226.02101,"1062,58016-0378-99 ",.01)
 ;;58016-0378-99
 ;;9002226.02101,"1062,58016-0378-99 ",.02)
 ;;58016-0378-99
 ;;9002226.02101,"1062,58016-0411-00 ",.01)
 ;;58016-0411-00
 ;;9002226.02101,"1062,58016-0411-00 ",.02)
 ;;58016-0411-00
 ;;9002226.02101,"1062,58016-0411-02 ",.01)
 ;;58016-0411-02
 ;;9002226.02101,"1062,58016-0411-02 ",.02)
 ;;58016-0411-02
 ;;9002226.02101,"1062,58016-0411-30 ",.01)
 ;;58016-0411-30
 ;;9002226.02101,"1062,58016-0411-30 ",.02)
 ;;58016-0411-30
 ;;9002226.02101,"1062,58016-0411-60 ",.01)
 ;;58016-0411-60
 ;;9002226.02101,"1062,58016-0411-60 ",.02)
 ;;58016-0411-60
 ;;9002226.02101,"1062,58016-0411-90 ",.01)
 ;;58016-0411-90
 ;;9002226.02101,"1062,58016-0411-90 ",.02)
 ;;58016-0411-90
 ;;9002226.02101,"1062,58016-0467-00 ",.01)
 ;;58016-0467-00
 ;;9002226.02101,"1062,58016-0467-00 ",.02)
 ;;58016-0467-00
 ;;9002226.02101,"1062,58016-0467-30 ",.01)
 ;;58016-0467-30
 ;;9002226.02101,"1062,58016-0467-30 ",.02)
 ;;58016-0467-30
 ;;9002226.02101,"1062,58016-0467-60 ",.01)
 ;;58016-0467-60
 ;;9002226.02101,"1062,58016-0467-60 ",.02)
 ;;58016-0467-60
 ;;9002226.02101,"1062,58016-0467-90 ",.01)
 ;;58016-0467-90
 ;;9002226.02101,"1062,58016-0467-90 ",.02)
 ;;58016-0467-90
 ;;9002226.02101,"1062,58016-0543-00 ",.01)
 ;;58016-0543-00
 ;;9002226.02101,"1062,58016-0543-00 ",.02)
 ;;58016-0543-00
 ;;9002226.02101,"1062,58016-0691-00 ",.01)
 ;;58016-0691-00
 ;;9002226.02101,"1062,58016-0691-00 ",.02)
 ;;58016-0691-00
 ;;9002226.02101,"1062,58016-0691-30 ",.01)
 ;;58016-0691-30
 ;;9002226.02101,"1062,58016-0691-30 ",.02)
 ;;58016-0691-30
 ;;9002226.02101,"1062,58016-0691-60 ",.01)
 ;;58016-0691-60
 ;;9002226.02101,"1062,58016-0691-60 ",.02)
 ;;58016-0691-60
 ;;9002226.02101,"1062,58016-0691-90 ",.01)
 ;;58016-0691-90
 ;;9002226.02101,"1062,58016-0691-90 ",.02)
 ;;58016-0691-90
 ;;9002226.02101,"1062,58016-0844-00 ",.01)
 ;;58016-0844-00
 ;;9002226.02101,"1062,58016-0844-00 ",.02)
 ;;58016-0844-00
 ;;9002226.02101,"1062,58016-0844-30 ",.01)
 ;;58016-0844-30
 ;;9002226.02101,"1062,58016-0844-30 ",.02)
 ;;58016-0844-30
 ;;9002226.02101,"1062,58016-0844-60 ",.01)
 ;;58016-0844-60
 ;;9002226.02101,"1062,58016-0844-60 ",.02)
 ;;58016-0844-60
 ;;9002226.02101,"1062,58016-0844-90 ",.01)
 ;;58016-0844-90
 ;;9002226.02101,"1062,58016-0844-90 ",.02)
 ;;58016-0844-90
 ;;9002226.02101,"1062,58016-0876-00 ",.01)
 ;;58016-0876-00
 ;;9002226.02101,"1062,58016-0876-00 ",.02)
 ;;58016-0876-00
 ;;9002226.02101,"1062,58016-0876-10 ",.01)
 ;;58016-0876-10
 ;;9002226.02101,"1062,58016-0876-10 ",.02)
 ;;58016-0876-10
 ;;9002226.02101,"1062,58016-0876-12 ",.01)
 ;;58016-0876-12
 ;;9002226.02101,"1062,58016-0876-12 ",.02)
 ;;58016-0876-12
 ;;9002226.02101,"1062,58016-0876-14 ",.01)
 ;;58016-0876-14
 ;;9002226.02101,"1062,58016-0876-14 ",.02)
 ;;58016-0876-14
 ;;9002226.02101,"1062,58016-0876-15 ",.01)
 ;;58016-0876-15
 ;;9002226.02101,"1062,58016-0876-15 ",.02)
 ;;58016-0876-15
 ;;9002226.02101,"1062,58016-0876-20 ",.01)
 ;;58016-0876-20
 ;;9002226.02101,"1062,58016-0876-20 ",.02)
 ;;58016-0876-20
 ;;9002226.02101,"1062,58016-0876-21 ",.01)
 ;;58016-0876-21
 ;;9002226.02101,"1062,58016-0876-21 ",.02)
 ;;58016-0876-21
 ;;9002226.02101,"1062,58016-0876-24 ",.01)
 ;;58016-0876-24
 ;;9002226.02101,"1062,58016-0876-24 ",.02)
 ;;58016-0876-24
 ;;9002226.02101,"1062,58016-0876-28 ",.01)
 ;;58016-0876-28
 ;;9002226.02101,"1062,58016-0876-28 ",.02)
 ;;58016-0876-28
 ;;9002226.02101,"1062,58016-0876-30 ",.01)
 ;;58016-0876-30
 ;;9002226.02101,"1062,58016-0876-30 ",.02)
 ;;58016-0876-30
 ;;9002226.02101,"1062,58016-0876-40 ",.01)
 ;;58016-0876-40
 ;;9002226.02101,"1062,58016-0876-40 ",.02)
 ;;58016-0876-40
 ;;9002226.02101,"1062,58016-0876-50 ",.01)
 ;;58016-0876-50
 ;;9002226.02101,"1062,58016-0876-50 ",.02)
 ;;58016-0876-50
 ;;9002226.02101,"1062,58016-0876-60 ",.01)
 ;;58016-0876-60
 ;;9002226.02101,"1062,58016-0876-60 ",.02)
 ;;58016-0876-60
 ;;9002226.02101,"1062,58016-4788-01 ",.01)
 ;;58016-4788-01
 ;;9002226.02101,"1062,58016-4788-01 ",.02)
 ;;58016-4788-01
 ;;9002226.02101,"1062,58864-0027-90 ",.01)
 ;;58864-0027-90
 ;;9002226.02101,"1062,58864-0027-90 ",.02)
 ;;58864-0027-90
 ;;9002226.02101,"1062,58864-0100-30 ",.01)
 ;;58864-0100-30
 ;;9002226.02101,"1062,58864-0100-30 ",.02)
 ;;58864-0100-30
 ;;9002226.02101,"1062,58864-0214-30 ",.01)
 ;;58864-0214-30
 ;;9002226.02101,"1062,58864-0214-30 ",.02)
 ;;58864-0214-30
 ;;9002226.02101,"1062,58864-0214-60 ",.01)
 ;;58864-0214-60
 ;;9002226.02101,"1062,58864-0214-60 ",.02)
 ;;58864-0214-60
 ;;9002226.02101,"1062,58864-0224-30 ",.01)
 ;;58864-0224-30
 ;;9002226.02101,"1062,58864-0224-30 ",.02)
 ;;58864-0224-30
 ;;9002226.02101,"1062,58864-0224-60 ",.01)
 ;;58864-0224-60
 ;;9002226.02101,"1062,58864-0224-60 ",.02)
 ;;58864-0224-60
 ;;9002226.02101,"1062,58864-0224-93 ",.01)
 ;;58864-0224-93
 ;;9002226.02101,"1062,58864-0224-93 ",.02)
 ;;58864-0224-93
 ;;9002226.02101,"1062,58864-0670-14 ",.01)
 ;;58864-0670-14
 ;;9002226.02101,"1062,58864-0670-14 ",.02)
 ;;58864-0670-14