/*
 * $DOC$
 * $NAME$
 * CharOR()
 *
 * $ONELINER$
 * Combine the characters of two strings with a binary OR
 *
 * $SYNTAX$
 * CharOR( cString1, cString2 ) --> cResult
 *
 * $ARGUMENTS$
 * cString1
 * cString2
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
 * CharOR( "XDEV", " " ) OK
 * CharOR( "xdev", " " ) OK
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

   Check( 'CharOR( "XDEV", " " ) ', CharOR( "XDEV", " " ), "xdev" )
   Check( 'CharOR( "xdev", " " ) ', CharOR( "xdev", " " ), "xdev" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
