/*
 * $DOC$
 * $NAME$
 * JustRight()
 *
 * $ONELINER$
 * Justify the characters of a string to the right
 *
 * $SYNTAX$
 * JustRight( cString, [xChar] ) --> cResult
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
 * JustRight( "xDev   " )    OK
 * JustRight( "42--", "-" )  OK
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

   Check( 'JustRight( "xDev   " )    ', JustRight( "xDev   " ), "   xDev" )
   Check( 'JustRight( "42--", "-" )  ', JustRight( "42--", "-" ), "--42" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
