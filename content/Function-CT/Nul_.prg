/*
 * $DOC$
 * $NAME$
 * Nul()
 *
 * $ONELINER$
 * Return an empty string, whatever the argument
 *
 * $SYNTAX$
 * Nul( [xValue] ) --> cNull
 *
 * $ARGUMENTS$
 * `xValue` Any value, usually the result of a function that is called only for what it does.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * Nul() hides the result of a function inside a string expression, for example
 * "Press a key: " + Nul( Inkey( 0 ) ).
 *
 * $NOTES$
 * The result is a string, so it can not be compared with or added to a number.
 *
 * Nul() is not Empty(): Empty( xValue ) tests a value and gives .T. or .F.; Nul( xValue ) drops the
 * value and always gives "".
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Nul( 5 )                         OK
 * Nul() without an argument        OK
 * "Done" + Nul( Date() )           OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Empty()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'Nul( 5 )                         ', Nul( 5 ), "" )
   Check( 'Nul() without an argument        ', Nul(), "" )
   Check( '"Done" + Nul( Date() )           ', "Done" + Nul( Date() ), "Done" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
nu