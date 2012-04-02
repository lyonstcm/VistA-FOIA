BGP1CP5 ; IHS/CMI/LAB - IHS gpra print ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
 ;
PNALL ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 S BGPNOBA=1
 D WRACE^BGP1CPU(DFN)
 Q:BGPQUIT
 D WDOB^BGP1CPU(DFN)
 Q:BGPQUIT
 D WZIP^BGP1CPU(DFN)
 Q:BGPQUIT
 D WINS^BGP1CPU(BGPVSIT,DFN)
 Q:BGPQUIT
 D WADM^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 D WADM92^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 D WADMS92^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 D WDT^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 D WDSGS92^BGP1CPU(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU(BGPVINP) Q:BGPQUIT
 K BGPNOBA
 D WPNEUPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 S BGPNOBA=1
 D OTHDPOVS^BGP1CPU(BGPVSIT)
 Q:BGPQUIT
 D WPRINPRO^BGP1CPU2
 Q:BGPQUIT
 D WOTHPROS^BGP1CPU2
 K BGPNOBA
 Q
 ;
PN1 ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 I $$TRANSIN^BGP1CU(BGPVINP) D TRANSIN Q:BGPQUIT
 D WDT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP),$$DODA^BGP1CU(BGPVSIT,BGPVINP) D TRANSN Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$ERPNEU^BGP1CU(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),"BGP CMS PNEUMONIA DXS")
 .D WERPNEU^BGP1CPU3
 .S X=$$ADMDX^BGP1CU(BGPVINP,"BGP CMS PNEUMONIA DXS")
 .D WADMDX^BGP1CPU3
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 D ABGPO^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$$FMADD^XLFDT($$DSCH^BGP1CU(BGPVINP)),.BGPDATA)
 D WABGPO^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
PN2 ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 D WDT9^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN2 Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 D PNEUVAX^BGP1CU2(DFN,$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 D WPNEUMO^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
PN3B ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 I $$TRANSIN^BGP1CU(BGPVINP) D TRANSIN3 Q:BGPQUIT
 I 'BGPEXCL D WDOD^BGP1CPU3(DFN)
 Q:BGPQUIT
 D WDT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN3 Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$ERPNEU^BGP1CU(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),"BGP CMS PNEUMONIA DXS")
 .D WERPNEU^BGP1CPU3
 .;S X=$$ADMDX^BGP1CU(BGPVINP,"BGP CMS PNEUMONIA DXS")
 .D WADMDX^BGP1CPU3
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 ;antibiotic rx status?
 D ANTIRX^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$FMADD^XLFDT($P($P(^AUPNVINP(BGPVINP,0),U),"."),30),.BGPDATA)
 D WANTIRX^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
 D ERBCP^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),.BGPDATA)
 D WERBC^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
PN4 ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 I 'BGPEXCL D WDOD^BGP1CPU3(DFN)
 Q:BGPQUIT
 D WDT9^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN2 Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 ;antibiotic rx status?
 K BGPDATA
 S BGPC=0
 D SMOKER^BGP1CU2(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 D WSMOKER^BGP1CPU
 Q:BGPQUIT
 K BGPDATA
 D CESS^BGP1CU2(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 D WCESS^BGP1CPU
 Q:BGPQUIT
 K BGPDATA
 D CESSMEDS^BGP1CU2(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 D WCESSMED^BGP1CPU
 Q:BGPQUIT
 K BGPDATA
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
PN5B ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 I $$TRANSIN^BGP1CU(BGPVINP) D TRANSIN Q:BGPQUIT
 I 'BGPEXCL D WDOD^BGP1CPU3(DFN)
 Q:BGPQUIT
 D WDT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$ERPNEU^BGP1CU(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),"BGP CMS PNEUMONIA DXS")
 .D WERPNEU^BGP1CPU3
 .S X=$$ADMDX^BGP1CU(BGPVINP,"BGP CMS PNEUMONIA DXS")
 .D WADMDX^BGP1CPU3
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 ;antibiotic rx status?
 K BGPDATA
 D ANTIRX^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$FMADD^XLFDT($P($P(^AUPNVINP(BGPVINP,0),U),"."),30),.BGPDATA)
 D WANTIRX^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 ;D ERBCP^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),.BGPDATA)
 ;D WERBC^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
PN6 ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 I $$TRANSIN^BGP1CU(BGPVINP) D TRANSIN Q:BGPQUIT
 I 'BGPEXCL D WDOD^BGP1CPU3(DFN)
 Q:BGPQUIT
 D WDT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$ERPNEU^BGP1CU(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),"BGP CMS PNEUMONIA DXS")
 .D WERPNEU^BGP1CPU3
 .S X=$$ADMDX^BGP1CU(BGPVINP,"BGP CMS PNEUMONIA DXS")
 .D WADMDX^BGP1CPU3
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 K BGPDATA
 I 'BGPEXCL D  Q:BGPQUIT
 .K BGPDATA
 .D EXCLCOMP^BGP1CU4(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 .D WEXCL1^BGP1CPU3
 .Q:BGPQUIT
 .S X=$$PRIORHOS^BGP1CU4(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-14),$P($P(BGPVSIT0,U),"."),BGPVSIT)
 .S Y=$$HOS2DAYS^BGP1CU4(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-90),$P($P(BGPVSIT0,U),"."))
 .D WPRIORHO^BGP1CPU3
 .Q:BGPQUIT
 .S X=$$NURSHOME^BGP1CU4(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-90),$P($P(BGPVSIT0,U),"."))
 .D WNURSHOM^BGP1CPU3
 .Q:BGPQUIT
 .S X=$$WOUNDCAR^BGP1CU4(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-30),$P($P(BGPVSIT0,U),"."))
 .D WWOUND^BGP1CPU3
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 S X=$$ADMDX^BGP1CU(BGPVINP,"BGP CMS OTHER INFECTION DXS")
 D WOTHINF^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
 I 'BGPEXCL D  Q:BGPQUIT
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 S BGPPSE=$$PSEUDO^BGP1CU4(BGPVINP)
 S BGPCOPD=$$COPD^BGP1CU4(DFN,$$DSCH^BGP1CU(BGPVINP))
 D WPSEUDO^BGP1CPU3
 Q:BGPQUIT
 ;antibiotic rx status?
 K BGPDATA
 D ANTIRX^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$FMADD^XLFDT($P($P(^AUPNVINP(BGPVINP,0),U),"."),30),.BGPDATA)
 D WANTIRX^BGP1CPU3
 Q:BGPQUIT
 ;D ERBCP^BGP1CU3(DFN,$$FMADD^XLFDT($P($P(BGPVSIT0,U),"."),-1),$P($P(BGPVSIT0,U),"."),.BGPDATA)
 ;D WERBC^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
PN7 ;EP
 I $Y>(BGPIOSL-3) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 D WDT9^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D WTT^BGP1CPU3(BGPVINP)
 Q:BGPQUIT
 I $$TRANS^BGP1CU(BGPVINP) D TRANSN Q:BGPQUIT
 D WPPDPOV^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 D OTHDPOVS^BGP1CPU3(BGPVSIT)
 Q:BGPQUIT
 S X=$$COMFORT^BGP1CU(DFN,$P($P(^AUPNVSIT(BGPVSIT,0),U),"."),$P($P(^AUPNVINP(BGPVINP,0),U),"."))
 D WCOMFORT^BGP1CPU3(X)
 Q:BGPQUIT
 D EXCL487^BGP1CPU3
 K BGPDATA,BGPSCAN
 D CHESTXRY^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPDATA)
 D CTSCAN^BGP1CU(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-1),$P($P(^AUPNVINP(BGPVINP,0),U),"."),.BGPSCAN)
 D WCHEST^BGP1CPU3
 Q:BGPQUIT
 I 'BGPEXCL D
 .S X=$$LASTDX^BGP1UTL1(DFN,"BGP CMS CYSTIC FIBROSIS DXS",$$DOB^AUPNPAT(DFN),$$DSCH^BGP1CU(BGPVINP))
 .D WCYSTIC^BGP1CPU3
 K BGPDATA
 ;
 D FLUVAX^BGP1CU4(DFN,$$FMADD^XLFDT($P($P(^AUPNVSIT(BGPVSIT,0),U),"."),-365),$$DSCH^BGP1CU(BGPVINP),$$DSCH^BGP1CU(BGPVINP),.BGPDATA)
 ;
 D WFLU^BGP1CPU3
 Q:BGPQUIT
 K BGPDATA
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
TRANSIN ;
 I $Y>(BGPIOSL-4) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 W !!?3,"NOTE:  Since Admission Type was ","""","Transferred,",""""," review patient's chart"
 W !,"to determine if patient should be excluded if transfer was from another"
 W !,"acute care hospital, including ER from another hospital.",!
 Q
 ;
TRANSN ;
 I $Y>(BGPIOSL-4) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 W !!?3,"NOTE:  Since Discharge Type was ","""","Transferred,",""""," review patient's chart"
 W !,"to determine if patient should be excluded if transferred to another"
 W !,"acute care hospital or federal hospital.",!
 Q
TRANSN2 ;
 I $Y>(BGPIOSL-4) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 W !!?3,"NOTE:  Since Discharge Type was ","""","Transferred,",""""," review patient's chart"
 W !,"to determine if patient should be excluded if transferred to another"
 W !,"short term hospital, federal hospital, or to hospice.",!
 Q
TRANSN3 ;
 I $Y>(BGPIOSL-4) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 W !!?3,"NOTE:  Since Discharge Type was ","""","Transferred,",""""," review patient's chart"
 W !,"to determine if patient should be excluded if transferred to another"
 W !,"acute care hospital or federal hospital on day of or day after arrival.",!
 Q
TRANSIN3 ;
 I $Y>(BGPIOSL-4) D HDR^BGP1CP Q:BGPQUIT  D L1H^BGP1CP
 W !!?3,"NOTE:  Since Admission Type was ","""","Transferred,",""""," review patient's chart"
 W !,"to determine if patient should be excluded if transfer was from another"
 W !,"acute care or critical care access hospital, including ER from another hospital.",!
 Q
 ;