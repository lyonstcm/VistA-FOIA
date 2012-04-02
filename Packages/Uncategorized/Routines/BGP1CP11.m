BGP1CP11 ; IHS/CMI/LAB - IHS gpra print ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
 ;
 ;
AMI3W ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 D WDOD^BGP1CPU(DFN)
 D WDT^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN^BGP1CP2 Q:BGPQUIT
 D WPPDPOV^BGP1CPU(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU(BGPVSIT)
 Q:BGPQUIT
 K BGPDATA
 S BGPC=0
 D LVSD^BGP1CU1(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 D EJECFRAC^BGP1CU1(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,BGPC)
 D WLVSD^BGP1CPU
 Q:BGPQUIT
 K BGPDATA
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU(X)
 K BGPDATA
 K BGPY
 Q:BGPQUIT
 S X=$$ACEALLEG^BGP1CU1(DFN,$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 S Z=$$ARBALLEG^BGP1CU1(DFN,$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 D WACEALEG^BGP1CPU
 K BGPDATA
 S BGPC=0
 D ALLDXS^BGP1CU2(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,BGPC,"BGP CMS AORTIC STENOSIS DXS")
 D WAORTIC^BGP1CPU
 Q:BGPQUIT
 K BGPDATA,BGPDX
 S BGPXX=0
 D ANGIOED^BGP1CU6(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 S X=0 F  S X=$O(BGPDATA(X)) Q:X'=+X  S BGPXX=BGPXX+1,BGPDX(BGPXX)=BGPDATA(X)
 K BGPDATA D HYPERKAL^BGP1CU6(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 S X=0 F  S X=$O(BGPDATA(X)) Q:X'=+X  S BGPXX=BGPXX+1,BGPDX(BGPXX)=BGPDATA(X)
 K BGPDATA D HYPOTEN^BGP1CU6(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 S X=0 F  S X=$O(BGPDATA(X)) Q:X'=+X  S BGPXX=BGPXX+1,BGPDX(BGPXX)=BGPDATA(X)
 K BGPDATA D RENART^BGP1CU6(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 S X=0 F  S X=$O(BGPDATA(X)) Q:X'=+X  S BGPXX=BGPXX+1,BGPDX(BGPXX)=BGPDATA(X)
 K BGPDATA D RENAL^BGP1CU6(DFN,$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA,0)
 S X=0 F  S X=$O(BGPDATA(X)) Q:X'=+X  S BGPXX=BGPXX+1,BGPDX(BGPXX)=BGPDATA(X)
 D WDXS^BGP1CPU
 K BGPDATA
 K BGPY
 Q:BGPQUIT
 K BGPDATA
 S BGPC=0
 D NMIDRUG^BGP1CU1(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA,"BGP CMS ACEI MEDS",0)
 D NMIDRUG^BGP1CU1(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA,"BGP CMS ARB MEDS",BGPC)
 D WNMIACE^BGP1CPU(.BGPDATA)
 Q:BGPQUIT
 S X=$$LASTMED^BGP1CU1(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$FMADD^XLFDT($P($P(^AUPNVINP(BGPVINP,0),U),"."),30),"BGP CMS ACEI MEDS","","BGP CMS ACEI MEDS CLASS")
 S Z=$$LASTMED^BGP1CU1(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$FMADD^XLFDT($P($P(^AUPNVINP(BGPVINP,0),U),"."),30),"BGP CMS ARB MEDS","","BGP CMS ARB MEDS CLASS")
 D WLASTACE^BGP1CPU
 Q:BGPQUIT
 Q:BGPQUIT
 D ALLALG1^BGP1CU1(DFN,DT,$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 D WALLALG^BGP1CPU
 Q:BGPQUIT
 K BGPDATA
 D ALLALGA1^BGP1CU1(DFN,DT,.BGPDATA)
 D WALLALGT^BGP1CPU
 K BGPDATA
 D IVUD^BGP1CU1(DFN,$P($P(BGPVSIT0,U),"."),$$DSCH^BGP1CU(BGPVINP),,.BGPDATA)
 D WIVUD^BGP1CPU
 Q
 ;