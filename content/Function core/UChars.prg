/*
 * $DOC$
 * $NAME$
 * UChars()
 *
 * $ONELINER$
 * of its own, and so is every invalid byte, kept unchanged like in USubStr()
 *
 * $SYNTAX$
 * UChars( cString ) --> aChars
 *
 * $ARGUMENTS$
 * cString
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

   Check( 'Len( UChars( "Łódź" ) )                ', Len( UChars( "Łódź" ) ), 4 )
   Check( 'UChars( "Łódź" )[ 1 ]                  ', UChars( "Łódź" )[ 1 ], "Ł" )
   Check( 'UChars( "a😀b" )[ 2 ]                   ', UChars( "a😀b" )[ 2 ], "😀" )
   Check( 'Len( UChars( "" ) )                    ', Len( UChars( "" ) ), 0 )
   Check( 'Len( UChars( "a" + HexToStr( "FF" ) ) ) ', Len( UChars( "a" + HexToStr( "FF" ) ) ), 2 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
