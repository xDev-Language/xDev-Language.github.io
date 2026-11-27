/*
 * $DOC$
 * $NAME$
 * WaitPeriod()
 *
 * $ONELINER$
 * Start a time period and test whether it has elapsed
 *
 * $SYNTAX$
 * WaitPeriod( [nDelay] ) --> lNotElapsed
 *
 * $ARGUMENTS$
 * `nDelay` The length of a new period in 1/100 seconds, for example 500 for 5 seconds. Without the
 * argument the period started before is tested.
 *
 * $RETURNS$
 * .T. while the period has not elapsed, .F. after it. .F. when no period was started.
 *
 * $DESCRIPTION$
 * Call WaitPeriod( nDelay ) once before a loop, then WaitPeriod() in the condition of the loop. The
 * loop then ends at the latest when the time is over:
 *
 * WaitPeriod( 500 )
 * DO WHILE lMoreWork .AND. WaitPeriod()
 *    ...
 * ENDDO
 *
 * $NOTES$
 * There is one period for the whole program. A period may go on over midnight.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * WaitPeriod( 50 ) starts a period OK
 * the loop ran for 0.5 seconds     OK
 * WaitPeriod() after the period    OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Seconds(), MilliSec()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nStart := Seconds()

   Check( 'WaitPeriod( 50 ) starts a period ', WaitPeriod( 50 ), .T. )

   DO WHILE WaitPeriod()
      MilliSec( 10 )
   ENDDO

   Check( 'the loop ran for 0.5 seconds     ', Seconds() - nStart >= 0.45, .T. )
   Check( 'WaitPeriod() after the period    ', WaitPeriod(), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
