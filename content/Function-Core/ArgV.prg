/*
 * $DOC$
 * $NAME$
 * ArgV()
 *
 * $ONELINER$
 * Return one command-line argument
 *
 * $SYNTAX$
 * ArgV( nPosition ) --> cArgument
 *
 * $ARGUMENTS$
 * nPosition is zero for the executable name or a one-based command-line
 * argument position.
 *
 * $RETURNS$
 * The selected command-line value, or an empty string outside the valid range.
 *
 * $DESCRIPTION$
 * Position zero selects the executable name. Positions from one through
 * ArgC() select the arguments following the program name. A negative position
 * or a position greater than ArgC() returns an empty string.
 *
 * $NOTES$
 * nPosition must be numeric. The command-line values are available throughout
 * the program.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Program name is present: OK
 * Negative position is empty: OK
 * Missing argument is empty: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ArgC()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( "Program name is present", Len( ArgV( 0 ) ) > 0, .T. )
   s_Check( "Negative position is empty", ArgV( -1 ), "" )
   s_Check( "Missing argument is empty", ArgV( 1 ), "" )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
