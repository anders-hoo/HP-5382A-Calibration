Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Preamble
DATE:                  2021-08-18 14:29:14
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       111
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
# Ask flags, Enable with + and Disable with -
# A = Display Post Test Dialog
# B = GO/NO-GO, SLEW and KEYBOARD Entry Options
# C = Use Correction Files
# D = Oscilloscope Message Format
# F = Use -F to Display Post Test Dialog Only on FAIL
# G = GO/NO-GO Evaluation Mode
# J = Post Test "Adjust" Button
# K = Keyboard Entry of UUT Indicated Value
# L = Post Test "List" Button
# M = Frequency Portion of Stimulus Message
# N = Instructions to Perform Test
# P = Control Post Test Repeat Button
# Q = System Instrument Reset after Evaluation
# R = UUT Range Message
# S = SET FSC Messages
# T = Post Test "Terminate" Button
# U = T.U.R Checking
# V = Enable / Disable All Connection Messages
# W = Connection Messages Except Divider Messages
# X = Post Test "Cancel" Option
# Z = Post Test "Repeat" Option
  1.001  ASK+       Q                  J S U       M   X Z        A  L  T
  1.002  ASK-   R D   N B            P               C            F        V

# Reset all VSET / TSET values to defaults before modifying them.
  1.003  VSET         ALL = *

# Write only last evaluation result to database.
  1.004  VSET         RSM = LAST

# TOL_REF = SYSTEM_ACTUAL is the preferred MET/CAL setting. Change only if bugs are found on results.
  1.005  VSET         TOL_REF = SYSTEM_ACTUAL

# VSET MEAS = SA is useful when using MEMC and MEMCX FSCs when DUT is stimulus instrument
# And the measurement standard is an indicator. VSET MEAS = SA instructs
# the system to treat SYSTEM ACTUAL as the measurement result which is transferred
# to the report database. VSET MEAS defaults to UI (DUT INDICATED). Using VSET MEAS = SA
# when the measurement standard is an indicator allows efficient use of MEMC and MEMCX
# FSCs. Writing down the explicit nominal value is not necessary. Only explicitly writing
# the TOL value in necessary. For example. Variable TOL value can be set programmatically
# with IF ELSEIF ENDIF statements.

# IN SHORT: Use MEAS = SA if DUT is stimulus instrument. Use MEAS = UI if DUT is indicator.
  1.006  VSET         MEAS = UI

# IN SHORT: TOL must be specified explicitly to get enough required decimal places. Using variables is
# NOT RECOMMENDED!
#  1.012  TOL          0.330U
#  1.013  MEMC         kH             TOL

# NMEAS = 3 for consumer level UUTs. Increase NMEAS if calibrating
# more accuracte UUTs. For performance / verification NMEAS = 1 is
# adequate.
#  2.001  VSET         NMEAS = 3

# Guardbanding mode set to measurement uncertainty.
#  2.002  VSET         GB = MU

# The settings below set the Welch-Satterthwaite mode ON with coverage
# probability of 2 sigma (95.45%). Welch-Satterthwaite mode calculates
# the effective degrees of freedom (DF) for the measurement and looks up
# the appropriate coverage factor from the 95.45% t-table.
# The default degrees of freedom for effective degrees of freedom calculation
# are set to INF for all except S1 uncertainty component. Use TSET DF1,
# DFS1, DFS2, DF3 etc ... to modify these values if necessary.
# COV_FAC setting must NOT be specified in .ini file or in the procedure,
# otherwise KCONF setting does not have an effect.
#  2.003  VSET         USE_ST = NO
#  2.004  VSET         WS = YES
#  2.005  VSET         KCONF = 95.45%

# Guarbanding factor decreases specification limits (TOL)
# by a factor of 0.825 of the _expanded_ measurement uncertainty.
# See ISO 14253-1:2017 (p. 16). ISO standard uses a factor of 1.65
# of the _standard_ measurement uncertainty (1.65/2 = 0.825).
# Using GBF of 0.825 is apropriate for at least 95 % conformity probability.
# 95% conformance probability satisfies ISO 14253-1 and 17025 standards
# with regards to the testing laboratory decision rules.
#  2.006  VSET         GBF = 0.825

# "PASS indeterminate" is interpreted as PASS and "FAIL intederminate" is
# interpreted as FAIL.
#  2.007  VSET         GB_RESULT = PF

# Post test dialog is displayed in PASS/FAIL indeterminate and FAIL cases.
# If test is a PASS without qualifications the post test dialog is supressed.
  1.007  VSET         GB_PTS = P

# MET/CAL uses the limits based on the UUT's specified tolerance as the
# basis for the Tolerance Error calculation (for post test dialog).
  1.008  VSET         GB_TOL_ERR = SPEC

# When GB_OVERFLOW is set to LIMIT, an overflow condition causes MET/CAL
# to set the guardbanded test tolerance to zero. This prevents the test
# from passing outright, but allows Pass Indeterminate, Fail Indeterminate,
# and Fail as possible test results.
#  2.010  VSET         GB_OVERFLOW = LIMIT

  1.009  END
