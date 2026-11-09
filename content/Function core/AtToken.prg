/*
 * $DOC$
 * $NAME$
 * AtToken()
 *
 * $ONELINER$
 * Return the position of the n-th token in a string
 *
 * $SYNTAX$
 * AtToken( cString, [cDelimiter], [nCount] ) --> nPos
 *
 * $ARGUMENTS$
 * cString
 * cDelimiter
 * nCount
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
 * AtToken( "Good Day" )                 OK
 * AtToken( "What a beautiful day.", 4 ) OK
 * AtToken( "What a beautiful day.", 6 ) OK
 * AtToken( "a,b,c", ",", 2 )            OK
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

   Check( 'AtToken( "Good Day" )                 ', AtToken( "Good Day" ), 6 )
   Check( 'AtToken( "What a beautiful day.", 4 ) ', AtToken( "What a beautiful day.", 4 ), 18 )
   Check( 'AtToken( "What a beautiful day.", 6 ) ', AtToken( "What a beautiful day.", 6 ), 0 )
   Check( 'AtToken( "a,b,c", ",", 2 )            ', AtToken( "a,b,c", ",", 2 ), 3 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
