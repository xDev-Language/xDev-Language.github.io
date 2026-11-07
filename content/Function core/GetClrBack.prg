/*
 * $DOC$
 * $NAME$
 * GetClrBack()
 *
 * $ONELINER$
 * Return the background color of a color value
 *
 * $SYNTAX$
 * GetClrBack( cColor ) --> cBackgroundColor
 *
 * $ARGUMENTS$
 * cColor
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

   Check( 'GetClrBack( "W+/B" ) ', GetClrBack( "W+/B" ), "B" )
   Check( 'GetClrBack( "W" )    ', GetClrBack( "W" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
