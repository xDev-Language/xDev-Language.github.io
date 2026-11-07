/*
 * $DOC$
 * $NAME$
 * InvertAttr()
 *
 * $ONELINER$
 * Exchange the foreground and background color
 *
 * $SYNTAX$
 * InvertAttr( xColor ) --> nInvertedAttribute
 *
 * $ARGUMENTS$
 * xColor
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

   Check( 'InvertAttr( 7 )                       ', InvertAttr( 7 ), 112 )
   Check( 'NToColor( InvertAttr( "W+/B" ), .T. ) ', NToColor( InvertAttr( "W+/B" ), .T. ), "B+/W" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
