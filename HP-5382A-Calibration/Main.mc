Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            HP 5382A Frequency Counter
DATE:                  2021-08-19 11:49:20
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       20
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  CALL         Sub Preamble
  1.002  OPBR         Is the UUT fitted with Option 001?
  1.003  IF           MEM1 == 1
  1.004  CALL         Sub Option 001
  1.005  ELSE
  1.006  CALL         Sub No Option 001
  1.007  ENDIF

  1.008  END
