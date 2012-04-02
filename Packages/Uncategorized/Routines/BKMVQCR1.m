BKMVQCR1 ;PRXM/HC/BWF - BKMV Quality of Care Report; [ 1/19/2005  7:16 PM ]
 ;;2.1;HIV MANAGEMENT SYSTEM;;Feb 07, 2011
 ; Quality of Care Audit Report
 Q
CD4CHK ; EP - CD4 algorithm
 N HIVDT,SITETAX,SITETAX1,LOINTAX,LOINTAX1,CPTTAX,CPTTAX1,GLOBAL,GLOBAL2,TOTPTS,DFN
 S HIVDT=$$FMADD^XLFDT(EDATE,-183)
 S SITETAX="BGP CD4 TAX"
 S SITETAX1="BKMV CD4 ABS TESTS TAX"
 S LOINTAX="BGP CD4 LOINC CODES"
 S LOINTAX1="BKMV CD4 ABS LOINC CODES"
 S CPTTAX="BGP CD4 CPTS"
 S CPTTAX1="BKMV CD4 ABS CPTS"
 S GLOBAL="^TMP(""BKMVQCR"",$J,""HIVCHK"",DFN,""CD4ALL"",VSTDT,TEST)"
 S GLOBAL2="^TMP(""BKMVQCR"",$J,""HIVCHK"",DFN,""CD4ABS"",VSTDT,TEST)"
 S TOTPTS="^TMP(""BKMVQCR"",$J,""HIVCHK"",""CD4PTCNT"")"
 S DFN=0,@TOTPTS=0
 F  S DFN=$O(^TMP("BKMVQCR",$J,"HIVCHK",DFN)) Q:'DFN  D
 .D CPTTAX^BKMIXX(DFN,CPTTAX,EDATE,HIVDT,GLOBAL)
 .D CPTTAX^BKMIXX(DFN,CPTTAX1,EDATE,HIVDT,GLOBAL2)
 .D LOINC^BKMIXX(DFN,LOINTAX,EDATE,HIVDT,GLOBAL)
 .D LOINC^BKMIXX(DFN,LOINTAX1,EDATE,HIVDT,GLOBAL2)
 .D LABTAX^BKMIXX(DFN,SITETAX,EDATE,HIVDT,GLOBAL)
 .D LABTAX^BKMIXX(DFN,SITETAX1,EDATE,HIVDT,GLOBAL2)
 .I $D(^TMP("BKMVQCR",$J,"HIVCHK",DFN,"CD4ALL"))!$D(^TMP("BKMVQCR",$J,"HIVCHK",DFN,"CD4ABS")) S @TOTPTS=@TOTPTS+1
 Q
VRLLD ; EP - Viral Load Check
 N VRLDT,SITETAX,LOINTAX,CPTTAX,GLOBAL,GLOBAL2,TOTPTS,DFN
 S VRLDT=$$FMADD^XLFDT(EDATE,-183)
 S SITETAX="BGP HIV VIRAL LOAD TAX"
 S LOINTAX="BGP VIRAL LOAD LOINC CODES"
 S CPTTAX="BGP HIV VIRAL LOAD CPTS"
 S GLOBAL="^TMP(""BKMVQCR"",$J,""HIVCHK"",DFN,""VRL"",VSTDT,TEST)"
 S TOTPTS="^TMP(""BKMVQCR"",$J,""HIVCHK"",""VRLPTCNT"")"
 S DFN=0,@TOTPTS=0
 F  S DFN=$O(^TMP("BKMVQCR",$J,"HIVCHK",DFN)) Q:'DFN  D
 .D CPTTAX^BKMIXX(DFN,CPTTAX,EDATE,VRLDT,GLOBAL)
 .D LOINC^BKMIXX(DFN,LOINTAX,EDATE,VRLDT,GLOBAL)
 .D LABTAX^BKMIXX(DFN,SITETAX,EDATE,VRLDT,GLOBAL)
 .I $D(^TMP("BKMVQCR",$J,"HIVCHK",DFN,"VRL")) S @TOTPTS=@TOTPTS+1
 Q
RPR ; EP - Rapid Plasma Reagin tests
 N RPRDT,SITETAX,LOINTAX,CPTTAX,GLOBAL,GLOBAL2,REFGLOB,TOTPTS,DFN
 N SITETAX1,LOINTAX1,CPTTAX1
 S RPRDT=$$FMADD^XLFDT(EDATE,-365)
 S SITETAX="BKM RPR TAX"
 S LOINTAX="BKM RPR LOINC CODES"
 S CPTTAX="BKM RPR CPTS"
 S SITETAX1="BKM FTA-ABS TEST TAX"
 S LOINTAX1="BKM FTA-ABS LOINC CODES"
 S CPTTAX1="BKM FTA-ABS CPTS"
 S GLOBAL="^TMP(""BKMVQCR"",$J,""HIVCHK"",DFN,""RPR"",VSTDT,TEST)"
 S REFGLOB="^TMP(""BKMVQCR"",$J,""HIVCHK"",DFN,""RPRREF"",VSTDT,TEST)"
 S TOTPTS="^TMP(""BKMVQCR"",$J,""HIVCHK"",""RPRPTCNT"")"
 S DFN=0,@TOTPTS=0
 F  S DFN=$O(^TMP("BKMVQCR",$J,"HIVCHK",DFN)) Q:'DFN  D
 .D CPTTAX^BKMIXX(DFN,CPTTAX,EDATE,RPRDT,GLOBAL)
 .D LOINC^BKMIXX(DFN,LOINTAX,EDATE,RPRDT,GLOBAL)
 .D LABTAX^BKMIXX(DFN,SITETAX,EDATE,RPRDT,GLOBAL)
 .D CPTTAX^BKMIXX(DFN,CPTTAX1,EDATE,RPRDT,GLOBAL)
 .D LOINC^BKMIXX(DFN,LOINTAX1,EDATE,RPRDT,GLOBAL)
 .D LABTAX^BKMIXX(DFN,SITETAX1,EDATE,RPRDT,GLOBAL)
 .D REFUSAL^BKMIXX2(DFN,60,LOINTAX,EDATE,RPRDT,REFGLOB)
 .D REFUSAL^BKMIXX2(DFN,60,SITETAX,EDATE,RPRDT,REFGLOB)
 .D REFUSAL^BKMIXX2(DFN,60,LOINTAX1,EDATE,RPRDT,REFGLOB)
 .D REFUSAL^BKMIXX2(DFN,60,SITETAX1,EDATE,RPRDT,REFGLOB)
 .I $D(^TMP("BKMVQCR",$J,"HIVCHK",DFN,"RPR"))!$D(^TMP("BKMVQCR",$J,"HIVCHK",DFN,"RPRREF")) S @TOTPTS=@TOTPTS+1
 Q