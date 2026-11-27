/*
 * $DOC$
 * $NAME$
 * ArgC()
 *
 * $ONELINER$
 * Return the number of command-line arguments
 *
 * $SYNTAX$
 * ArgC() --> nArgumentCount
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * A non-negative integer giving the number of arguments following the program
 * name.
 *
 * $DESCRIPTION$
 * Returns the command-line argument count available to the entire program.
 * The executable name at position zero is not included in the count. The
 * result is zero when the program was started without additional arguments.
 *
 * $NOTES$
 * ArgC() accepts no arguments. ArgV( 0 ) returns the executable name, and
 * ArgV( 1 ) through ArgV( ArgC() ) return the counted arguments.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * No additional arguments: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ArgV()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( "No additional arguments", ArgC(), 0 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
