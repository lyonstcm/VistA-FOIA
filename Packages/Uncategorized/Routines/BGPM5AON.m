BGPM5AON ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 09, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"993,806.1 ",.02)
 ;;806.1
 ;;9002226.02101,"993,806.10 ",.01)
 ;;806.10
 ;;9002226.02101,"993,806.10 ",.02)
 ;;806.10
 ;;9002226.02101,"993,806.11 ",.01)
 ;;806.11
 ;;9002226.02101,"993,806.11 ",.02)
 ;;806.11
 ;;9002226.02101,"993,806.12 ",.01)
 ;;806.12
 ;;9002226.02101,"993,806.12 ",.02)
 ;;806.12
 ;;9002226.02101,"993,806.13 ",.01)
 ;;806.13
 ;;9002226.02101,"993,806.13 ",.02)
 ;;806.13
 ;;9002226.02101,"993,806.14 ",.01)
 ;;806.14
 ;;9002226.02101,"993,806.14 ",.02)
 ;;806.14
 ;;9002226.02101,"993,806.15 ",.01)
 ;;806.15
 ;;9002226.02101,"993,806.15 ",.02)
 ;;806.15
 ;;9002226.02101,"993,806.16 ",.01)
 ;;806.16
 ;;9002226.02101,"993,806.16 ",.02)
 ;;806.16
 ;;9002226.02101,"993,806.17 ",.01)
 ;;806.17
 ;;9002226.02101,"993,806.17 ",.02)
 ;;806.17
 ;;9002226.02101,"993,806.18 ",.01)
 ;;806.18
 ;;9002226.02101,"993,806.18 ",.02)
 ;;806.18
 ;;9002226.02101,"993,806.19 ",.01)
 ;;806.19
 ;;9002226.02101,"993,806.19 ",.02)
 ;;806.19
 ;;9002226.02101,"993,806.2 ",.01)
 ;;806.2
 ;;9002226.02101,"993,806.2 ",.02)
 ;;806.2
 ;;9002226.02101,"993,806.20 ",.01)
 ;;806.20
 ;;9002226.02101,"993,806.20 ",.02)
 ;;806.20
 ;;9002226.02101,"993,806.21 ",.01)
 ;;806.21
 ;;9002226.02101,"993,806.21 ",.02)
 ;;806.21
 ;;9002226.02101,"993,806.22 ",.01)
 ;;806.22
 ;;9002226.02101,"993,806.22 ",.02)
 ;;806.22
 ;;9002226.02101,"993,806.23 ",.01)
 ;;806.23
 ;;9002226.02101,"993,806.23 ",.02)
 ;;806.23
 ;;9002226.02101,"993,806.24 ",.01)
 ;;806.24
 ;;9002226.02101,"993,806.24 ",.02)
 ;;806.24
 ;;9002226.02101,"993,806.25 ",.01)
 ;;806.25
 ;;9002226.02101,"993,806.25 ",.02)
 ;;806.25
 ;;9002226.02101,"993,806.26 ",.01)
 ;;806.26
 ;;9002226.02101,"993,806.26 ",.02)
 ;;806.26
 ;;9002226.02101,"993,806.27 ",.01)
 ;;806.27
 ;;9002226.02101,"993,806.27 ",.02)
 ;;806.27
 ;;9002226.02101,"993,806.28 ",.01)
 ;;806.28
 ;;9002226.02101,"993,806.28 ",.02)
 ;;806.28
 ;;9002226.02101,"993,806.29 ",.01)
 ;;806.29
 ;;9002226.02101,"993,806.29 ",.02)
 ;;806.29
 ;;9002226.02101,"993,806.3 ",.01)
 ;;806.3
 ;;9002226.02101,"993,806.3 ",.02)
 ;;806.3
 ;;9002226.02101,"993,806.30 ",.01)
 ;;806.30
 ;;9002226.02101,"993,806.30 ",.02)
 ;;806.30
 ;;9002226.02101,"993,806.31 ",.01)
 ;;806.31
 ;;9002226.02101,"993,806.31 ",.02)
 ;;806.31
 ;;9002226.02101,"993,806.32 ",.01)
 ;;806.32
 ;;9002226.02101,"993,806.32 ",.02)
 ;;806.32
 ;;9002226.02101,"993,806.33 ",.01)
 ;;806.33
 ;;9002226.02101,"993,806.33 ",.02)
 ;;806.33
 ;;9002226.02101,"993,806.34 ",.01)
 ;;806.34
 ;;9002226.02101,"993,806.34 ",.02)
 ;;806.34
 ;;9002226.02101,"993,806.35 ",.01)
 ;;806.35
 ;;9002226.02101,"993,806.35 ",.02)
 ;;806.35
 ;;9002226.02101,"993,806.36 ",.01)
 ;;806.36
 ;;9002226.02101,"993,806.36 ",.02)
 ;;806.36
 ;;9002226.02101,"993,806.37 ",.01)
 ;;806.37
 ;;9002226.02101,"993,806.37 ",.02)
 ;;806.37
 ;;9002226.02101,"993,806.38 ",.01)
 ;;806.38
 ;;9002226.02101,"993,806.38 ",.02)
 ;;806.38
 ;;9002226.02101,"993,806.39 ",.01)
 ;;806.39
 ;;9002226.02101,"993,806.39 ",.02)
 ;;806.39
 ;;9002226.02101,"993,806.4 ",.01)
 ;;806.4
 ;;9002226.02101,"993,806.4 ",.02)
 ;;806.4
 ;;9002226.02101,"993,806.5 ",.01)
 ;;806.5
 ;;9002226.02101,"993,806.5 ",.02)
 ;;806.5
 ;;9002226.02101,"993,806.6 ",.01)
 ;;806.6
 ;;9002226.02101,"993,806.6 ",.02)
 ;;806.6
 ;;9002226.02101,"993,806.60 ",.01)
 ;;806.60
 ;;9002226.02101,"993,806.60 ",.02)
 ;;806.60
 ;;9002226.02101,"993,806.61 ",.01)
 ;;806.61
 ;;9002226.02101,"993,806.61 ",.02)
 ;;806.61
 ;;9002226.02101,"993,806.62 ",.01)
 ;;806.62
 ;;9002226.02101,"993,806.62 ",.02)
 ;;806.62
 ;;9002226.02101,"993,806.69 ",.01)
 ;;806.69
 ;;9002226.02101,"993,806.69 ",.02)
 ;;806.69
 ;;9002226.02101,"993,806.7 ",.01)
 ;;806.7
 ;;9002226.02101,"993,806.7 ",.02)
 ;;806.7
 ;;9002226.02101,"993,806.70 ",.01)
 ;;806.70
 ;;9002226.02101,"993,806.70 ",.02)
 ;;806.70
 ;;9002226.02101,"993,806.71 ",.01)
 ;;806.71
 ;;9002226.02101,"993,806.71 ",.02)
 ;;806.71
 ;;9002226.02101,"993,806.72 ",.01)
 ;;806.72
 ;;9002226.02101,"993,806.72 ",.02)
 ;;806.72
 ;;9002226.02101,"993,806.79 ",.01)
 ;;806.79
 ;;9002226.02101,"993,806.79 ",.02)
 ;;806.79
 ;;9002226.02101,"993,806.8 ",.01)
 ;;806.8
 ;;9002226.02101,"993,806.8 ",.02)
 ;;806.8
 ;;9002226.02101,"993,806.9 ",.01)
 ;;806.9
 ;;9002226.02101,"993,806.9 ",.02)
 ;;806.9
 ;;9002226.02101,"993,807 ",.01)
 ;;807
 ;;9002226.02101,"993,807 ",.02)
 ;;807
 ;;9002226.02101,"993,807.0 ",.01)
 ;;807.0
 ;;9002226.02101,"993,807.0 ",.02)
 ;;807.0
 ;;9002226.02101,"993,807.00 ",.01)
 ;;807.00
 ;;9002226.02101,"993,807.00 ",.02)
 ;;807.00
 ;;9002226.02101,"993,807.01 ",.01)
 ;;807.01
 ;;9002226.02101,"993,807.01 ",.02)
 ;;807.01
 ;;9002226.02101,"993,807.02 ",.01)
 ;;807.02
 ;;9002226.02101,"993,807.02 ",.02)
 ;;807.02
 ;;9002226.02101,"993,807.03 ",.01)
 ;;807.03
 ;;9002226.02101,"993,807.03 ",.02)
 ;;807.03
 ;;9002226.02101,"993,807.04 ",.01)
 ;;807.04
 ;;9002226.02101,"993,807.04 ",.02)
 ;;807.04
 ;;9002226.02101,"993,807.05 ",.01)
 ;;807.05
 ;;9002226.02101,"993,807.05 ",.02)
 ;;807.05
 ;;9002226.02101,"993,807.06 ",.01)
 ;;807.06
 ;;9002226.02101,"993,807.06 ",.02)
 ;;807.06
 ;;9002226.02101,"993,807.07 ",.01)
 ;;807.07
 ;;9002226.02101,"993,807.07 ",.02)
 ;;807.07
 ;;9002226.02101,"993,807.08 ",.01)
 ;;807.08
 ;;9002226.02101,"993,807.08 ",.02)
 ;;807.08
 ;;9002226.02101,"993,807.09 ",.01)
 ;;807.09
 ;;9002226.02101,"993,807.09 ",.02)
 ;;807.09
 ;;9002226.02101,"993,807.1 ",.01)
 ;;807.1
 ;;9002226.02101,"993,807.1 ",.02)
 ;;807.1
 ;;9002226.02101,"993,807.10 ",.01)
 ;;807.10
 ;;9002226.02101,"993,807.10 ",.02)
 ;;807.10
 ;;9002226.02101,"993,807.11 ",.01)
 ;;807.11
 ;;9002226.02101,"993,807.11 ",.02)
 ;;807.11
 ;;9002226.02101,"993,807.12 ",.01)
 ;;807.12
 ;;9002226.02101,"993,807.12 ",.02)
 ;;807.12
 ;;9002226.02101,"993,807.13 ",.01)
 ;;807.13
 ;;9002226.02101,"993,807.13 ",.02)
 ;;807.13
 ;;9002226.02101,"993,807.14 ",.01)
 ;;807.14
 ;;9002226.02101,"993,807.14 ",.02)
 ;;807.14
 ;;9002226.02101,"993,807.15 ",.01)
 ;;807.15
 ;;9002226.02101,"993,807.15 ",.02)
 ;;807.15
 ;;9002226.02101,"993,807.16 ",.01)
 ;;807.16
 ;;9002226.02101,"993,807.16 ",.02)
 ;;807.16
 ;;9002226.02101,"993,807.17 ",.01)
 ;;807.17
 ;;9002226.02101,"993,807.17 ",.02)
 ;;807.17
 ;;9002226.02101,"993,807.18 ",.01)
 ;;807.18
 ;;9002226.02101,"993,807.18 ",.02)
 ;;807.18
 ;;9002226.02101,"993,807.19 ",.01)
 ;;807.19
 ;;9002226.02101,"993,807.19 ",.02)
 ;;807.19
 ;;9002226.02101,"993,807.2 ",.01)
 ;;807.2
 ;;9002226.02101,"993,807.2 ",.02)
 ;;807.2
 ;;9002226.02101,"993,807.3 ",.01)
 ;;807.3
 ;;9002226.02101,"993,807.3 ",.02)
 ;;807.3
 ;;9002226.02101,"993,807.4 ",.01)
 ;;807.4
 ;;9002226.02101,"993,807.4 ",.02)
 ;;807.4
 ;;9002226.02101,"993,807.5 ",.01)
 ;;807.5
 ;;9002226.02101,"993,807.5 ",.02)
 ;;807.5
 ;;9002226.02101,"993,807.6 ",.01)
 ;;807.6
 ;;9002226.02101,"993,807.6 ",.02)
 ;;807.6
 ;;9002226.02101,"993,808 ",.01)
 ;;808
 ;;9002226.02101,"993,808 ",.02)
 ;;808
 ;;9002226.02101,"993,808.0 ",.01)
 ;;808.0
 ;;9002226.02101,"993,808.0 ",.02)
 ;;808.0
 ;;9002226.02101,"993,808.1 ",.01)
 ;;808.1
 ;;9002226.02101,"993,808.1 ",.02)
 ;;808.1
 ;;9002226.02101,"993,808.2 ",.01)
 ;;808.2
 ;;9002226.02101,"993,808.2 ",.02)
 ;;808.2
 ;;9002226.02101,"993,808.3 ",.01)
 ;;808.3
 ;;9002226.02101,"993,808.3 ",.02)
 ;;808.3
 ;;9002226.02101,"993,808.4 ",.01)
 ;;808.4
 ;;9002226.02101,"993,808.4 ",.02)
 ;;808.4
 ;;9002226.02101,"993,808.41 ",.01)
 ;;808.41
 ;;9002226.02101,"993,808.41 ",.02)
 ;;808.41
 ;;9002226.02101,"993,808.42 ",.01)
 ;;808.42
 ;;9002226.02101,"993,808.42 ",.02)
 ;;808.42
 ;;9002226.02101,"993,808.43 ",.01)
 ;;808.43
 ;;9002226.02101,"993,808.43 ",.02)
 ;;808.43
 ;;9002226.02101,"993,808.49 ",.01)
 ;;808.49
 ;;9002226.02101,"993,808.49 ",.02)
 ;;808.49
 ;;9002226.02101,"993,808.5 ",.01)
 ;;808.5
 ;;9002226.02101,"993,808.5 ",.02)
 ;;808.5
 ;;9002226.02101,"993,808.51 ",.01)
 ;;808.51
 ;;9002226.02101,"993,808.51 ",.02)
 ;;808.51
 ;;9002226.02101,"993,808.52 ",.01)
 ;;808.52
 ;;9002226.02101,"993,808.52 ",.02)
 ;;808.52
 ;;9002226.02101,"993,808.53 ",.01)
 ;;808.53
 ;;9002226.02101,"993,808.53 ",.02)
 ;;808.53
 ;;9002226.02101,"993,808.59 ",.01)
 ;;808.59
 ;;9002226.02101,"993,808.59 ",.02)
 ;;808.59
 ;;9002226.02101,"993,808.8 ",.01)
 ;;808.8
 ;;9002226.02101,"993,808.8 ",.02)
 ;;808.8
 ;;9002226.02101,"993,808.9 ",.01)
 ;;808.9
 ;;9002226.02101,"993,808.9 ",.02)
 ;;808.9
 ;;9002226.02101,"993,809 ",.01)
 ;;809
 ;;9002226.02101,"993,809 ",.02)
 ;;809
 ;;9002226.02101,"993,809.0 ",.01)
 ;;809.0
 ;;9002226.02101,"993,809.0 ",.02)
 ;;809.0
 ;;9002226.02101,"993,809.1 ",.01)
 ;;809.1
 ;;9002226.02101,"993,809.1 ",.02)
 ;;809.1
 ;;9002226.02101,"993,810 ",.01)
 ;;810
 ;;9002226.02101,"993,810 ",.02)
 ;;810
 ;;9002226.02101,"993,810.0 ",.01)
 ;;810.0
 ;;9002226.02101,"993,810.0 ",.02)
 ;;810.0
 ;;9002226.02101,"993,810.00 ",.01)
 ;;810.00
 ;;9002226.02101,"993,810.00 ",.02)
 ;;810.00
 ;;9002226.02101,"993,810.01 ",.01)
 ;;810.01
 ;;9002226.02101,"993,810.01 ",.02)
 ;;810.01
 ;;9002226.02101,"993,810.02 ",.01)
 ;;810.02
 ;;9002226.02101,"993,810.02 ",.02)
 ;;810.02
 ;;9002226.02101,"993,810.03 ",.01)
 ;;810.03
 ;;9002226.02101,"993,810.03 ",.02)
 ;;810.03
 ;;9002226.02101,"993,810.1 ",.01)
 ;;810.1
 ;;9002226.02101,"993,810.1 ",.02)
 ;;810.1
 ;;9002226.02101,"993,810.10 ",.01)
 ;;810.10
 ;;9002226.02101,"993,810.10 ",.02)
 ;;810.10
 ;;9002226.02101,"993,810.11 ",.01)
 ;;810.11
 ;;9002226.02101,"993,810.11 ",.02)
 ;;810.11
 ;;9002226.02101,"993,810.12 ",.01)
 ;;810.12
 ;;9002226.02101,"993,810.12 ",.02)
 ;;810.12
 ;;9002226.02101,"993,810.13 ",.01)
 ;;810.13
 ;;9002226.02101,"993,810.13 ",.02)
 ;;810.13
 ;;9002226.02101,"993,811 ",.01)
 ;;811
 ;;9002226.02101,"993,811 ",.02)
 ;;811
 ;;9002226.02101,"993,811.0 ",.01)
 ;;811.0
 ;;9002226.02101,"993,811.0 ",.02)
 ;;811.0
 ;;9002226.02101,"993,811.00 ",.01)
 ;;811.00
 ;;9002226.02101,"993,811.00 ",.02)
 ;;811.00
 ;;9002226.02101,"993,811.01 ",.01)
 ;;811.01
 ;;9002226.02101,"993,811.01 ",.02)
 ;;811.01
 ;;9002226.02101,"993,811.02 ",.01)
 ;;811.02
 ;;9002226.02101,"993,811.02 ",.02)
 ;;811.02
 ;;9002226.02101,"993,811.03 ",.01)
 ;;811.03
 ;;9002226.02101,"993,811.03 ",.02)
 ;;811.03
 ;;9002226.02101,"993,811.09 ",.01)
 ;;811.09
 ;;9002226.02101,"993,811.09 ",.02)
 ;;811.09
 ;;9002226.02101,"993,811.1 ",.01)
 ;;811.1
 ;;9002226.02101,"993,811.1 ",.02)
 ;;811.1
 ;;9002226.02101,"993,811.10 ",.01)
 ;;811.10
 ;;9002226.02101,"993,811.10 ",.02)
 ;;811.10
 ;;9002226.02101,"993,811.11 ",.01)
 ;;811.11
 ;;9002226.02101,"993,811.11 ",.02)
 ;;811.11
 ;;9002226.02101,"993,811.12 ",.01)
 ;;811.12
 ;;9002226.02101,"993,811.12 ",.02)
 ;;811.12
 ;;9002226.02101,"993,811.13 ",.01)
 ;;811.13
 ;;9002226.02101,"993,811.13 ",.02)
 ;;811.13
 ;;9002226.02101,"993,811.19 ",.01)
 ;;811.19
 ;;9002226.02101,"993,811.19 ",.02)
 ;;811.19
 ;;9002226.02101,"993,812 ",.01)
 ;;812
 ;;9002226.02101,"993,812 ",.02)
 ;;812
 ;;9002226.02101,"993,812.0 ",.01)
 ;;812.0
 ;;9002226.02101,"993,812.0 ",.02)
 ;;812.0
 ;;9002226.02101,"993,812.00 ",.01)
 ;;812.00
 ;;9002226.02101,"993,812.00 ",.02)
 ;;812.00
 ;;9002226.02101,"993,812.01 ",.01)
 ;;812.01
 ;;9002226.02101,"993,812.01 ",.02)
 ;;812.01
 ;;9002226.02101,"993,812.02 ",.01)
 ;;812.02
 ;;9002226.02101,"993,812.02 ",.02)
 ;;812.02