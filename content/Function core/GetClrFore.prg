/*
 * $DOC$
 * $NAME$
 * GetClrFore()
 *
 * $ONELINER$
 * Return the foreground color of a color value
 *
 * $SYNTAX$
 * GetClrFore( cColor ) --> cForegroundColor
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

   Check( 'GetClrFore( "W+/B" )                      ', GetClrFore( "W+/B" ), "W+" )
   Check( 'GetClrFore( GetClrPair( "W/N,GR+/R", 2 ) ) ', GetClrFore( GetClrPair( "W/N,GR+/R", 2 ) ), "GR+" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
