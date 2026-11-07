/*
 * $DOC$
 * $NAME$
 * JustLeft()
 *
 * $ONELINER$
 * Justify the characters of a string to the left
 *
 * $SYNTAX$
 * JustLeft( cString, [xChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * xChar
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

   Check( 'JustLeft( "   xDev" )     ', JustLeft( "   xDev" ), "xDev   " )
   Check( 'JustLeft( "--42", "-" )   ', JustLeft( "--42", "-" ), "42--" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
