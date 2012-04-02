IS00025A ;Compiled from script 'Generated: HL IHS IZV04 V01VXQ IN-I' on SEP 05, 2011
 ;Part 2
 ;Copyright 2011 SAIC
EN I $P($G(INTHL7F2),U,4) S X=$$SUBESC^INHUT7(X,INDELIMS,"I")
 S @INV@("QRF1")=$G(X)
 I '$D(X) D ERROR^INHS("Variable 'QRF1' failed input transform. Processing continues.",0),ERROR^INHS("  Value = '"_INX_"'",0)
 K DXS
 S (INX,X)=$G(@INV@("QRF5"))
 I $P($G(INTHL7F2),U,4) S X=$$SUBESC^INHUT7(X,INDELIMS,"I")
 S @INV@("QRF5")=$G(X)
 I '$D(X) D ERROR^INHS("Variable 'QRF5' failed input transform. Processing continues.",0),ERROR^INHS("  Value = '"_INX_"'",0)
 K DXS
 Q
D1 ;Entering REQUIRED section.
 I $D(@INV@("MSH1"))#2,$G(@INV@("MSH1"))="" S INREQERR=2 D KILL^INHVA1("MSH","HL FIELD SEPARATOR")
 I $D(@INV@("MSH1"))#2,$G(@INV@("MSH2"))="" S INREQERR=2 D KILL^INHVA1("MSH","HL ENCODING CHARACTERS")
 I $D(@INV@("MSH1"))#2,$G(@INV@("MSH9"))="" S INREQERR=2 D KILL^INHVA1("MSH","HL MESSAGE TYPE")
 I $D(@INV@("MSH1"))#2,$G(@INV@("MSH11"))="" S INREQERR=2 D KILL^INHVA1("MSH","HL PROCESSING ID")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD1"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN QDTM (QRD-1)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD2"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN QFC (QRD-2)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD3"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN QP (QRD-3)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD4"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN QID (QRD-4)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD7"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN QTY (QRD-7)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD8"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN WHO (QRD-8)")
 I $D(@INV@("QRD1"))#2,$G(@INV@("QRD9"))="" S INREQERR=2 D KILL^INHVA1("QRD","HL IHS QRD IN WHAT (QRD-9)")
 I $D(@INV@("QRF1"))#2,$G(@INV@("QRF1"))="" S INREQERR=2 D KILL^INHVA1("QRF","HL IHS QRF IN WHERE (QRF-1)")
 Q:$G(INSTERR) $S($G(INREQERR)>INSTERR:INREQERR,1:INSTERR)  D MAIN^BHLV01I
 I $G(INSTERR) Q $S($G(INREQERR)>INSTERR:INREQERR,1:INSTERR)
 ;Entering END section.
 I $G(INSTERR) Q $S($G(INREQERR)>INSTERR:INREQERR,1:INSTERR)
 K @INV,INV,INDA,DIPA Q +$G(INREQERR)