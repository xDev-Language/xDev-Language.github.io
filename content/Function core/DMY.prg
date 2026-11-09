/*
 * $DOC$
 * $NAME$
 * DMY()
 *
 * $ONELINER$
 * Format a date as "dd. Month yyyy"
 *
 * $SYNTAX$
 * DMY( [dDate], [lPeriod] ) --> cDate
 *
 * $ARGUMENTS$
 * dDate
 * lPeriod
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
 * DMY( SToD( "20261102" ) )      OK
 * DMY( SToD( "20261102" ) )      OK
 * DMY( SToD( "20261102" ), .T. ) OK
 * DMY( .T. )                     OK
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

   Check( 'DMY( SToD( "20261102" ) )      ', DMY( SToD( "20261102" ) ), "2 November 26" )

   SetCentury( .T. )

   Check( 'DMY( SToD( "20261102" ) )      ', DMY( SToD( "20261102" ) ), "2 November 2026" )
   Check( 'DMY( SToD( "20261102" ), .T. ) ', DMY( SToD( "20261102" ), .T. ), "2. November 2026" )
   Check( 'DMY( .T. )                     ', DMY( .T. ), DMY( Date(), .T. ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
