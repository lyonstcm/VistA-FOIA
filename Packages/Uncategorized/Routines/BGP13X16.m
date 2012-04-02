BGP13X16 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1100,00143-1268-18 ",.01)
 ;;00143-1268-18
 ;;9002226.02101,"1100,00143-1268-18 ",.02)
 ;;00143-1268-18
 ;;9002226.02101,"1100,00143-1268-30 ",.01)
 ;;00143-1268-30
 ;;9002226.02101,"1100,00143-1268-30 ",.02)
 ;;00143-1268-30
 ;;9002226.02101,"1100,00143-1268-45 ",.01)
 ;;00143-1268-45
 ;;9002226.02101,"1100,00143-1268-45 ",.02)
 ;;00143-1268-45
 ;;9002226.02101,"1100,00143-1270-01 ",.01)
 ;;00143-1270-01
 ;;9002226.02101,"1100,00143-1270-01 ",.02)
 ;;00143-1270-01
 ;;9002226.02101,"1100,00143-1270-09 ",.01)
 ;;00143-1270-09
 ;;9002226.02101,"1100,00143-1270-09 ",.02)
 ;;00143-1270-09
 ;;9002226.02101,"1100,00143-1270-10 ",.01)
 ;;00143-1270-10
 ;;9002226.02101,"1100,00143-1270-10 ",.02)
 ;;00143-1270-10
 ;;9002226.02101,"1100,00143-1270-18 ",.01)
 ;;00143-1270-18
 ;;9002226.02101,"1100,00143-1270-18 ",.02)
 ;;00143-1270-18
 ;;9002226.02101,"1100,00143-1270-30 ",.01)
 ;;00143-1270-30
 ;;9002226.02101,"1100,00143-1270-30 ",.02)
 ;;00143-1270-30
 ;;9002226.02101,"1100,00143-1270-45 ",.01)
 ;;00143-1270-45
 ;;9002226.02101,"1100,00143-1270-45 ",.02)
 ;;00143-1270-45
 ;;9002226.02101,"1100,00143-1280-01 ",.01)
 ;;00143-1280-01
 ;;9002226.02101,"1100,00143-1280-01 ",.02)
 ;;00143-1280-01
 ;;9002226.02101,"1100,00143-1280-10 ",.01)
 ;;00143-1280-10
 ;;9002226.02101,"1100,00143-1280-10 ",.02)
 ;;00143-1280-10
 ;;9002226.02101,"1100,00143-9125-01 ",.01)
 ;;00143-9125-01
 ;;9002226.02101,"1100,00143-9125-01 ",.02)
 ;;00143-9125-01
 ;;9002226.02101,"1100,00143-9126-01 ",.01)
 ;;00143-9126-01
 ;;9002226.02101,"1100,00143-9126-01 ",.02)
 ;;00143-9126-01
 ;;9002226.02101,"1100,00143-9127-01 ",.01)
 ;;00143-9127-01
 ;;9002226.02101,"1100,00143-9127-01 ",.02)
 ;;00143-9127-01
 ;;9002226.02101,"1100,00172-2515-60 ",.01)
 ;;00172-2515-60
 ;;9002226.02101,"1100,00172-2515-60 ",.02)
 ;;00172-2515-60
 ;;9002226.02101,"1100,00172-3757-00 ",.01)
 ;;00172-3757-00
 ;;9002226.02101,"1100,00172-3757-00 ",.02)
 ;;00172-3757-00
 ;;9002226.02101,"1100,00172-3757-10 ",.01)
 ;;00172-3757-10
 ;;9002226.02101,"1100,00172-3757-10 ",.02)
 ;;00172-3757-10
 ;;9002226.02101,"1100,00172-3757-60 ",.01)
 ;;00172-3757-60
 ;;9002226.02101,"1100,00172-3757-60 ",.02)
 ;;00172-3757-60
 ;;9002226.02101,"1100,00172-3757-70 ",.01)
 ;;00172-3757-70
 ;;9002226.02101,"1100,00172-3757-70 ",.02)
 ;;00172-3757-70
 ;;9002226.02101,"1100,00172-3758-00 ",.01)
 ;;00172-3758-00
 ;;9002226.02101,"1100,00172-3758-00 ",.02)
 ;;00172-3758-00
 ;;9002226.02101,"1100,00172-3758-10 ",.01)
 ;;00172-3758-10
 ;;9002226.02101,"1100,00172-3758-10 ",.02)
 ;;00172-3758-10
 ;;9002226.02101,"1100,00172-3758-60 ",.01)
 ;;00172-3758-60
 ;;9002226.02101,"1100,00172-3758-60 ",.02)
 ;;00172-3758-60
 ;;9002226.02101,"1100,00172-3758-70 ",.01)
 ;;00172-3758-70
 ;;9002226.02101,"1100,00172-3758-70 ",.02)
 ;;00172-3758-70
 ;;9002226.02101,"1100,00172-3758-80 ",.01)
 ;;00172-3758-80
 ;;9002226.02101,"1100,00172-3758-80 ",.02)
 ;;00172-3758-80
 ;;9002226.02101,"1100,00172-3759-00 ",.01)
 ;;00172-3759-00
 ;;9002226.02101,"1100,00172-3759-00 ",.02)
 ;;00172-3759-00
 ;;9002226.02101,"1100,00172-3759-10 ",.01)
 ;;00172-3759-10
 ;;9002226.02101,"1100,00172-3759-10 ",.02)
 ;;00172-3759-10
 ;;9002226.02101,"1100,00172-3759-60 ",.01)
 ;;00172-3759-60
 ;;9002226.02101,"1100,00172-3759-60 ",.02)
 ;;00172-3759-60
 ;;9002226.02101,"1100,00172-3759-70 ",.01)
 ;;00172-3759-70
 ;;9002226.02101,"1100,00172-3759-70 ",.02)
 ;;00172-3759-70
 ;;9002226.02101,"1100,00172-3759-80 ",.01)
 ;;00172-3759-80
 ;;9002226.02101,"1100,00172-3759-80 ",.02)
 ;;00172-3759-80
 ;;9002226.02101,"1100,00172-3759-85 ",.01)
 ;;00172-3759-85
 ;;9002226.02101,"1100,00172-3759-85 ",.02)
 ;;00172-3759-85
 ;;9002226.02101,"1100,00172-3760-00 ",.01)
 ;;00172-3760-00
 ;;9002226.02101,"1100,00172-3760-00 ",.02)
 ;;00172-3760-00
 ;;9002226.02101,"1100,00172-3760-10 ",.01)
 ;;00172-3760-10
 ;;9002226.02101,"1100,00172-3760-10 ",.02)
 ;;00172-3760-10
 ;;9002226.02101,"1100,00172-3760-60 ",.01)
 ;;00172-3760-60
 ;;9002226.02101,"1100,00172-3760-60 ",.02)
 ;;00172-3760-60
 ;;9002226.02101,"1100,00172-3760-70 ",.01)
 ;;00172-3760-70
 ;;9002226.02101,"1100,00172-3760-70 ",.02)
 ;;00172-3760-70
 ;;9002226.02101,"1100,00172-3760-80 ",.01)
 ;;00172-3760-80
 ;;9002226.02101,"1100,00172-3760-80 ",.02)
 ;;00172-3760-80
 ;;9002226.02101,"1100,00172-3760-85 ",.01)
 ;;00172-3760-85
 ;;9002226.02101,"1100,00172-3760-85 ",.02)
 ;;00172-3760-85
 ;;9002226.02101,"1100,00172-3761-00 ",.01)
 ;;00172-3761-00
 ;;9002226.02101,"1100,00172-3761-00 ",.02)
 ;;00172-3761-00
 ;;9002226.02101,"1100,00172-3761-10 ",.01)
 ;;00172-3761-10
 ;;9002226.02101,"1100,00172-3761-10 ",.02)
 ;;00172-3761-10
 ;;9002226.02101,"1100,00172-3761-60 ",.01)
 ;;00172-3761-60
 ;;9002226.02101,"1100,00172-3761-60 ",.02)
 ;;00172-3761-60
 ;;9002226.02101,"1100,00172-3761-70 ",.01)
 ;;00172-3761-70
 ;;9002226.02101,"1100,00172-3761-70 ",.02)
 ;;00172-3761-70
 ;;9002226.02101,"1100,00172-3761-80 ",.01)
 ;;00172-3761-80
 ;;9002226.02101,"1100,00172-3761-80 ",.02)
 ;;00172-3761-80
 ;;9002226.02101,"1100,00172-3762-00 ",.01)
 ;;00172-3762-00
 ;;9002226.02101,"1100,00172-3762-00 ",.02)
 ;;00172-3762-00
 ;;9002226.02101,"1100,00172-3762-10 ",.01)
 ;;00172-3762-10
 ;;9002226.02101,"1100,00172-3762-10 ",.02)
 ;;00172-3762-10
 ;;9002226.02101,"1100,00172-3762-60 ",.01)
 ;;00172-3762-60
 ;;9002226.02101,"1100,00172-3762-60 ",.02)
 ;;00172-3762-60
 ;;9002226.02101,"1100,00172-3762-70 ",.01)
 ;;00172-3762-70
 ;;9002226.02101,"1100,00172-3762-70 ",.02)
 ;;00172-3762-70
 ;;9002226.02101,"1100,00172-4195-10 ",.01)
 ;;00172-4195-10
 ;;9002226.02101,"1100,00172-4195-10 ",.02)
 ;;00172-4195-10
 ;;9002226.02101,"1100,00172-4195-60 ",.01)
 ;;00172-4195-60
 ;;9002226.02101,"1100,00172-4195-60 ",.02)
 ;;00172-4195-60
 ;;9002226.02101,"1100,00172-4195-64 ",.01)
 ;;00172-4195-64
 ;;9002226.02101,"1100,00172-4195-64 ",.02)
 ;;00172-4195-64
 ;;9002226.02101,"1100,00172-4195-80 ",.01)
 ;;00172-4195-80
 ;;9002226.02101,"1100,00172-4195-80 ",.02)
 ;;00172-4195-80
 ;;9002226.02101,"1100,00172-4195-93 ",.01)
 ;;00172-4195-93
 ;;9002226.02101,"1100,00172-4195-93 ",.02)
 ;;00172-4195-93
 ;;9002226.02101,"1100,00172-4196-10 ",.01)
 ;;00172-4196-10
 ;;9002226.02101,"1100,00172-4196-10 ",.02)
 ;;00172-4196-10
 ;;9002226.02101,"1100,00172-4196-60 ",.01)
 ;;00172-4196-60
 ;;9002226.02101,"1100,00172-4196-60 ",.02)
 ;;00172-4196-60
 ;;9002226.02101,"1100,00172-4196-64 ",.01)
 ;;00172-4196-64
 ;;9002226.02101,"1100,00172-4196-64 ",.02)
 ;;00172-4196-64
 ;;9002226.02101,"1100,00172-4196-80 ",.01)
 ;;00172-4196-80
 ;;9002226.02101,"1100,00172-4196-80 ",.02)
 ;;00172-4196-80
 ;;9002226.02101,"1100,00172-4196-93 ",.01)
 ;;00172-4196-93
 ;;9002226.02101,"1100,00172-4196-93 ",.02)
 ;;00172-4196-93
 ;;9002226.02101,"1100,00172-4197-10 ",.01)
 ;;00172-4197-10
 ;;9002226.02101,"1100,00172-4197-10 ",.02)
 ;;00172-4197-10
 ;;9002226.02101,"1100,00172-4197-60 ",.01)
 ;;00172-4197-60
 ;;9002226.02101,"1100,00172-4197-60 ",.02)
 ;;00172-4197-60
 ;;9002226.02101,"1100,00172-4197-80 ",.01)
 ;;00172-4197-80
 ;;9002226.02101,"1100,00172-4197-80 ",.02)
 ;;00172-4197-80
 ;;9002226.02101,"1100,00172-4197-93 ",.01)
 ;;00172-4197-93
 ;;9002226.02101,"1100,00172-4197-93 ",.02)
 ;;00172-4197-93
 ;;9002226.02101,"1100,00172-4198-10 ",.01)
 ;;00172-4198-10
 ;;9002226.02101,"1100,00172-4198-10 ",.02)
 ;;00172-4198-10
 ;;9002226.02101,"1100,00172-4198-60 ",.01)
 ;;00172-4198-60
 ;;9002226.02101,"1100,00172-4198-60 ",.02)
 ;;00172-4198-60
 ;;9002226.02101,"1100,00172-4198-64 ",.01)
 ;;00172-4198-64
 ;;9002226.02101,"1100,00172-4198-64 ",.02)
 ;;00172-4198-64
 ;;9002226.02101,"1100,00172-4198-80 ",.01)
 ;;00172-4198-80
 ;;9002226.02101,"1100,00172-4198-80 ",.02)
 ;;00172-4198-80
 ;;9002226.02101,"1100,00172-4198-93 ",.01)
 ;;00172-4198-93
 ;;9002226.02101,"1100,00172-4198-93 ",.02)
 ;;00172-4198-93
 ;;9002226.02101,"1100,00172-5025-60 ",.01)
 ;;00172-5025-60
 ;;9002226.02101,"1100,00172-5025-60 ",.02)
 ;;00172-5025-60
 ;;9002226.02101,"1100,00172-5032-00 ",.01)
 ;;00172-5032-00
 ;;9002226.02101,"1100,00172-5032-00 ",.02)
 ;;00172-5032-00
 ;;9002226.02101,"1100,00172-5032-10 ",.01)
 ;;00172-5032-10
 ;;9002226.02101,"1100,00172-5032-10 ",.02)
 ;;00172-5032-10
 ;;9002226.02101,"1100,00172-5032-60 ",.01)
 ;;00172-5032-60
 ;;9002226.02101,"1100,00172-5032-60 ",.02)
 ;;00172-5032-60
 ;;9002226.02101,"1100,00172-5032-70 ",.01)
 ;;00172-5032-70
 ;;9002226.02101,"1100,00172-5032-70 ",.02)
 ;;00172-5032-70
 ;;9002226.02101,"1100,00172-5032-80 ",.01)
 ;;00172-5032-80
 ;;9002226.02101,"1100,00172-5032-80 ",.02)
 ;;00172-5032-80
 ;;9002226.02101,"1100,00172-5033-00 ",.01)
 ;;00172-5033-00
 ;;9002226.02101,"1100,00172-5033-00 ",.02)
 ;;00172-5033-00
 ;;9002226.02101,"1100,00172-5033-10 ",.01)
 ;;00172-5033-10
 ;;9002226.02101,"1100,00172-5033-10 ",.02)
 ;;00172-5033-10
 ;;9002226.02101,"1100,00172-5033-60 ",.01)
 ;;00172-5033-60
 ;;9002226.02101,"1100,00172-5033-60 ",.02)
 ;;00172-5033-60
 ;;9002226.02101,"1100,00172-5033-70 ",.01)
 ;;00172-5033-70
 ;;9002226.02101,"1100,00172-5033-70 ",.02)
 ;;00172-5033-70
 ;;9002226.02101,"1100,00172-5033-80 ",.01)
 ;;00172-5033-80
 ;;9002226.02101,"1100,00172-5033-80 ",.02)
 ;;00172-5033-80
 ;;9002226.02101,"1100,00172-5034-00 ",.01)
 ;;00172-5034-00
 ;;9002226.02101,"1100,00172-5034-00 ",.02)
 ;;00172-5034-00
 ;;9002226.02101,"1100,00172-5034-10 ",.01)
 ;;00172-5034-10
 ;;9002226.02101,"1100,00172-5034-10 ",.02)
 ;;00172-5034-10
 ;;9002226.02101,"1100,00172-5034-60 ",.01)
 ;;00172-5034-60
 ;;9002226.02101,"1100,00172-5034-60 ",.02)
 ;;00172-5034-60
 ;;9002226.02101,"1100,00172-5034-70 ",.01)
 ;;00172-5034-70
 ;;9002226.02101,"1100,00172-5034-70 ",.02)
 ;;00172-5034-70
 ;;9002226.02101,"1100,00172-5034-80 ",.01)
 ;;00172-5034-80
 ;;9002226.02101,"1100,00172-5034-80 ",.02)
 ;;00172-5034-80
 ;;9002226.02101,"1100,00172-5350-60 ",.01)
 ;;00172-5350-60
 ;;9002226.02101,"1100,00172-5350-60 ",.02)
 ;;00172-5350-60
 ;;9002226.02101,"1100,00172-5350-70 ",.01)
 ;;00172-5350-70
 ;;9002226.02101,"1100,00172-5350-70 ",.02)
 ;;00172-5350-70
 ;;9002226.02101,"1100,00172-5351-10 ",.01)
 ;;00172-5351-10
 ;;9002226.02101,"1100,00172-5351-10 ",.02)
 ;;00172-5351-10
 ;;9002226.02101,"1100,00172-5351-60 ",.01)
 ;;00172-5351-60
 ;;9002226.02101,"1100,00172-5351-60 ",.02)
 ;;00172-5351-60
 ;;9002226.02101,"1100,00172-5351-70 ",.01)
 ;;00172-5351-70
 ;;9002226.02101,"1100,00172-5351-70 ",.02)
 ;;00172-5351-70
 ;;9002226.02101,"1100,00172-5351-80 ",.01)
 ;;00172-5351-80
 ;;9002226.02101,"1100,00172-5351-80 ",.02)
 ;;00172-5351-80
 ;;9002226.02101,"1100,00172-5352-10 ",.01)
 ;;00172-5352-10
 ;;9002226.02101,"1100,00172-5352-10 ",.02)
 ;;00172-5352-10
 ;;9002226.02101,"1100,00172-5352-60 ",.01)
 ;;00172-5352-60
 ;;9002226.02101,"1100,00172-5352-60 ",.02)
 ;;00172-5352-60
 ;;9002226.02101,"1100,00172-5352-70 ",.01)
 ;;00172-5352-70
 ;;9002226.02101,"1100,00172-5352-70 ",.02)
 ;;00172-5352-70
 ;;9002226.02101,"1100,00172-5352-80 ",.01)
 ;;00172-5352-80
 ;;9002226.02101,"1100,00172-5352-80 ",.02)
 ;;00172-5352-80
 ;;9002226.02101,"1100,00172-5353-10 ",.01)
 ;;00172-5353-10
 ;;9002226.02101,"1100,00172-5353-10 ",.02)
 ;;00172-5353-10
 ;;9002226.02101,"1100,00172-5353-60 ",.01)
 ;;00172-5353-60
 ;;9002226.02101,"1100,00172-5353-60 ",.02)
 ;;00172-5353-60
 ;;9002226.02101,"1100,00172-5353-70 ",.01)
 ;;00172-5353-70
 ;;9002226.02101,"1100,00172-5353-70 ",.02)
 ;;00172-5353-70
 ;;9002226.02101,"1100,00172-5353-80 ",.01)
 ;;00172-5353-80
 ;;9002226.02101,"1100,00172-5353-80 ",.02)
 ;;00172-5353-80
 ;;9002226.02101,"1100,00172-5360-60 ",.01)
 ;;00172-5360-60
 ;;9002226.02101,"1100,00172-5360-60 ",.02)
 ;;00172-5360-60
 ;;9002226.02101,"1100,00172-5361-60 ",.01)
 ;;00172-5361-60
 ;;9002226.02101,"1100,00172-5361-60 ",.02)
 ;;00172-5361-60
 ;;9002226.02101,"1100,00172-5361-70 ",.01)
 ;;00172-5361-70
 ;;9002226.02101,"1100,00172-5361-70 ",.02)
 ;;00172-5361-70
 ;;9002226.02101,"1100,00172-5362-60 ",.01)
 ;;00172-5362-60
 ;;9002226.02101,"1100,00172-5362-60 ",.02)
 ;;00172-5362-60
 ;;9002226.02101,"1100,00172-5362-70 ",.01)
 ;;00172-5362-70
 ;;9002226.02101,"1100,00172-5362-70 ",.02)
 ;;00172-5362-70
 ;;9002226.02101,"1100,00172-5363-60 ",.01)
 ;;00172-5363-60
 ;;9002226.02101,"1100,00172-5363-60 ",.02)
 ;;00172-5363-60
 ;;9002226.02101,"1100,00172-5363-70 ",.01)
 ;;00172-5363-70
 ;;9002226.02101,"1100,00172-5363-70 ",.02)
 ;;00172-5363-70
 ;;9002226.02101,"1100,00182-2623-89 ",.01)
 ;;00182-2623-89
 ;;9002226.02101,"1100,00182-2623-89 ",.02)
 ;;00182-2623-89