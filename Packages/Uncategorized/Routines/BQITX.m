BQITX ;PRXM/HC/ALA-CREATED BY ^ATXSTX ON SEP 06, 2006;
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 ; See referenced routines to see taxonomies being loaded.
 ;
START ;
 I '$$EXISTS("BGP AMI DXS (HEDIS)") D ^BQITXA
 I '$$EXISTS("BGP ASTHMA DXS") D ^BQITXB
 I '$$EXISTS("BGP CABG CPTS") D ^BQITXC
 I '$$EXISTS("BGP CABG PROCS") D ^BQITXD
 D ^BQITXE ;    BGP CMS PCI-PTCA CPTS
 D ^BQITXF ;    BGP CMS PCI-PTCA DXS
 D ^BQITXG ;    BGP CMS PCI-PTCA PROCEDURES
 I '$$EXISTS("BGP COPD DXS") D ^BQITXH
 I '$$EXISTS("BGP CREATININE LOINC CODES") D ^BQITXI
 D ^BQITXJ ;    BGP ESRD CPTS
 D ^BQITXK ;    BGP ESRD DXS
 I '$$EXISTS("BGP GPRA SMOKING DXS") D ^BQITXL
 I '$$EXISTS("BGP HDL LOINC CODES") D ^BQITXM
 I '$$EXISTS("BGP HIV/AIDS DXS") D ^BQITXN
 I '$$EXISTS("BGP HYPERTENSION DXS") D ^BQITXO
 I '$$EXISTS("BGP LDL LOINC CODES") D ^BQITXP
 I '$$EXISTS("BGP NEPHROPATHY CPTS") D ^BQITXQ
 I '$$EXISTS("BGP NEPHROPATHY DXS") D ^BQITXR
 I '$$EXISTS("BGP NEPHROPATHY PROCEDURES") D ^BQITXS
 D ^BQITXT ;    BGP PRE DM MET SYN DX
 D ^BQITXU ;    BGP SMOKING HLTH FACTORS
 D ^BQITXV ;    BGP TOBACCO CESS DENTAL CODE
 Q
 ;
EXISTS(TAXONOMY) ; Returns "" if this taxonomy doesn't exist
 Q $O(^ATXAX("B",TAXONOMY,0))