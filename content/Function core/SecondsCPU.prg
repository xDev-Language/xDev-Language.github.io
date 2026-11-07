/*
 * $DOC$
 * $NAME$
 * SecondsCPU()
 *
 * $ONELINER$
 * Return the CPU time used by the current process
 *
 * $SYNTAX$
 * SecondsCPU( [nWhichTime] ) --> nSeconds
 *
 * $ARGUMENTS$
 * nWhichTime
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'SecondsCPU() >= 0    ', SecondsCPU() >= 0, .T. )
   Check( 'SecondsCPU( 1 ) >= 0 ', SecondsCPU( 1 ) >= 0, .T. )
   Check( 'SecondsCPU( 2 ) >= 0 ', SecondsCPU( 2 ) >= 0, .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
