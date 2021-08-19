none                                                        MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub No Option 001
DATE:                  2018-07-16 13:00:10
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       12
NUMBER OF LINES:       112
CONFIGURATION:         Datron 9500
CONFIGURATION:         Datron 9510 on channel 1
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  HEAD         Decimal Separator Check
  1.002  RSLT         =Decimal Separator Check
  1.003  TARGET

  1.004  MESS         Power UUT on. Switch through all three GATE TIME
  1.004  MESS         settings and check that the display is as follows:
  1.004  MESS         .1S) 0.00000
  1.004  MESS         [32]1S) 0.000
  1.004  MESS         10S) 0.0
  1.004  MESS
  1.005  MATH         S[1] = "Are the decimal separator and zeros displayed correctly?"
  1.006  EVAL   -s "Decimal Separator" : [S1]
  2.001  MESS

  2.002  HEAD         External Frequenct Input
  2.003  RSLT         =External Frequency Input
  2.004  TARGET

  2.005  MATH         S[1] = "Does the UUT display 10.00000 ± 1 count?"
  2.006  DISP         In the following test you must sometimes wait up to 10
  2.006  DISP         seconds for a stable reading depending on the UUT's GATE TIME.
  2.006  DISP
  2.006  DISP         Set the EXT IN switch to EXT position. Connect 9500's 9530
  2.006  DISP         ACTIVE HEAD directly to UUT INPUT using BNC-T connector.
  2.006  DISP         Connect the unused T-connector port to UUT EXT IN input using
  2.006  DISP         50 ohm termination. Set GATE TIME to .1S and ATTENUATOR to X1.

  2.007  9500         250mV                        10MH           LS    S  L
  2.008  EVAL   -s "10MHz at 250mVrms" : [S1]

  3.001  DISP         Switch GATE TIME to 10S and back to .1S to reset display.

  3.002  9500         250mV                        100kH          LS    S  L
  3.003  EVAL   -s "100kHz at 250mVrms" : [S1]

  4.001  HEAD         Segment Check
  4.002  RSLT         =Segment Check
  4.003  TARGET

  4.004  DISP         Remove the BNC-T connector, leads and 50 ohm termination
  4.004  DISP         from UUT's EXT IN and Input terminals. Connect 9530 ACTIVE
  4.004  DISP         HEAD directly to UUT's INPUT. Set EXT IN switch back to INT.

  4.005  9500         50mV                         8888888.8H     LS    S
  4.006  OPBR         Excluding two leftmost digits, are all the display digit segments visible?
  4.007  MATH         @subrslt = MEM1
  4.008  OPBR         Set GATE TIME to 10S. Wait for counter to trigger.
  4.008  OPBR
  4.008  OPBR         Are the segments of the two leftmost digits visible?
  4.009  EVAL   -e @subrslt == 1 && MEM1 == 1 : Result of Operator Evaluation

  5.001  HEAD         Input Sensitivity
  5.002  RSLT         =Input Sensitivity
  5.003  TARGET

  5.004  9500         50mV                         10H            LS    S
  5.005  MATH         S[1] = "Does the UUT show a stable 10Hz display?"
  5.006  EVAL   -s "10Hz at 50mVrms" : [S1]

  6.001  9500         25mV                         30H            LS    S
  6.002  MATH         S[1] = "Does the UUT show a stable 30Hz display?"
  6.003  EVAL   -s "30Hz at 25mVrms" : [S1]

  7.001  DISP         Set GATE TIME to .1S

  7.002  9500         25mV                         10MH           LS    S
  7.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
  7.004  EVAL   -s "10MHz at 25mVrms" : [S1]

  8.001  9500         50mV                         225MH          LS    S
  8.002  MATH         S[1] = "Does the UUT show a stable 225MHz display?"
  8.003  EVAL   -s "225MHz at 50mVrms" : [S1]

  9.001  DISP         Set UUT's ATTENUATOR to X10.

  9.002  9500         250mV                        10MH           LS    S
  9.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
  9.004  EVAL   -s "10MHz at 250mVrms X10 ATTENUATOR" : [S1]

 10.001  DISP         Set UUT's ATTENUATOR to X100.
# This X100 ATTN test is performed at a tighter requirement than counter spec.
# The spec only requires the counter triggers with 10 MHZ 2.5 Vrms signal using X100 ATTN.
 10.002  9500         1.9V                         10MH           LS    S
 10.003  MATH         S[1] = "Does the UUT show a stable 10MHz display?"
 10.004  EVAL   -s "10MHz at 1.9Vrms X100 ATTENUATOR" : [S1]

 11.001  HEAD         Frequency Offset
 11.002  RSLT         =Frequency Offset
 11.003  TARGET
# Requirement for frequency offset calculated from 12 month aging spec. (12 months X 0,3ppm / month = 3,6 ppm)

 11.004  DISP         Set UUT's ATTENUATOR to X1 and GATE TIME to .1S

 11.005  9500         50mV                         225MH          LS    S
 11.006  MEMI         Enter UUT reading in full in MHz:
 11.007  MATH         M[1] = MEM*1e6-225e6
 11.008  EVAL   -e ABS(M[1]) < 810 : Frequency offset < 3.6 ppm.

 12.001  END
