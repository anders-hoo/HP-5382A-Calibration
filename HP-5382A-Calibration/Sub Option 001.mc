K013                                                        MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Option 001
DATE:                  2018-10-22 08:36:18
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       10
NUMBER OF LINES:       113
CONFIGURATION:         Datron 9500
CONFIGURATION:         Datron 9510 on channel 1
STANDARD:              Symmetricom 8040C
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  STD          Symmetricom 8040C

  1.002  HEAD         Frequency Offset (Option 001)
  1.003  RSLT         =Frequency Offset (Option 001)
# Frequency offset spec calculated from monthly aging over 12 months (12 months * 1e-7 part / month).
  1.004  TARGET

  1.005  DISP         In the following test you must sometimes wait up to 10
  1.005  DISP         seconds for a stable reading depending on the UUT's GATE TIME.

  1.006  DISP         Within the UUT the TCXO module has a value in Hz imprinted
  1.006  DISP         on it which signifies the frequency offset from 10MHz nominal.
  1.006  DISP         Check if there is a sticker outside the UUT body with the
  1.006  DISP         frequency offset written on it.
  1.006  DISP
  1.006  DISP         If such a sticker DOES NOT exist:
  1.006  DISP         Make sure the UUT is powered off and disconnected from mains.
  1.006  DISP         Turn UUT upside down and unscrew 4 screws. Open the UUT body.
  1.006  DISP         Check the frequency offset number and put a sticker outside
  1.006  DISP         the body with the number on it. Assemble the UUT back together.
  1.006  DISP         Power UUT on and let the TCXO warm up for ~20 minutes.

  1.007  MEMI         Enter TCXO offset in Hz:
  1.008  MATH         M[1] = MEM

  1.009  DISP         Measure the TCXO MONITOR OUTPUT using a frequency counter
  1.009  DISP         which is locked to Symmetricom 8040C frequency standard.

  1.010  MEMI         Enter 53131A's reading in Hz:

  1.011  MATH         MEM = CRND(ABS((MEM - M[1] - 10e6)/10e6)*1e6,0.001)

  1.012  EVAL   -e MEM < 1.2 : Frequency offset [MEM] ppm.

  2.001  HEAD         Decimal Separator Check
  2.002  RSLT         =Decimal Separator Check
  2.003  TARGET

  2.004  MESS         Switch through all three GATE TIME settings and
  2.004  MESS         check that the display is as follows:
  2.004  MESS         .1S) 0.00000
  2.004  MESS         [32]1S) 0.000
  2.004  MESS         10S) 0.0
  2.004  MESS
  2.005  MATH         S[1] = "Are the decimal separator and zeros displayed correctly?"
  2.006  EVAL   -s "Decimal Separator" : [S1]
  3.001  MESS

  3.002  HEAD         Segment Check
  3.003  RSLT         =Segment Check
  3.004  TARGET

  3.005  DISP         Connect 9530 ACTIVE HEAD to UUT's INPUT. Set GATE TIME to .1S
  3.005  DISP         and ATTENUATOR to X1.

  3.006  9500         50mV                         8888888.8H     LS    S
  3.007  OPBR         Excluding two leftmost digits, are all the display digit segments visible?
  3.008  MATH         @subrslt = MEM1
  3.009  OPBR         Set GATE TIME to 10S. Wait for counter to trigger.
  3.009  OPBR
  3.009  OPBR         Are the segments of the two leftmost digits visible?
  3.010  EVAL   -e @subrslt == 1 && MEM1 == 1 : Result of Operator Evaluation

  4.001  HEAD         Input Sensitivity
  4.002  RSLT         =Input Sensitivity
  4.003  TARGET

  4.004  9500         50mV                         10H            LS    S
  4.005  MATH         S[1] = "Does the UUT show a stable 10Hz display?"
  4.006  EVAL   -s "10Hz at 50mVrms" : [S1]

  5.001  9500         25mV                         30H            LS    S
  5.002  MATH         S[1] = "Does the UUT show a stable 30Hz display?"
  5.003  EVAL   -s "30Hz at 25mVrms" : [S1]

  6.001  DISP         Set GATE TIME to .1S

  6.002  9500         25mV                         10MH           LS    S
  6.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
  6.004  EVAL   -s "10MHz at 25mVrms" : [S1]

  7.001  9500         50mV                         225MH          LS    S
  7.002  MATH         S[1] = "Does the UUT show a stable 225MHz display?"
  7.003  EVAL   -s "225MHz at 50mVrms" : [S1]

  8.001  DISP         Set UUT's ATTENUATOR to X10.

  8.002  9500         250mV                        10MH           LS    S
  8.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
  8.004  EVAL   -s "10MHz at 250mVrms X10 ATTENUATOR" : [S1]

  9.001  DISP         Set UUT's ATTENUATOR to X100.
# This X100 ATTN test is performed at a tighter requirement than counter spec.
# The spec only requires the counter triggers with 10 MHZ 2.5 Vrms signal using X100 ATTN.
  9.002  9500         1.9V                         10MH           LS    S
  9.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
  9.004  EVAL   -s "10MHz at 1.9Vrms X100 ATTENUATOR" : [S1]

 10.001  END
