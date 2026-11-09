/*
 * $DOC$
 * $NAME$
 * Expand()
 *
 * $ONELINER$
 * Insert characters between all characters of a string
 *
 * $SYNTAX$
 * Expand( cString, [nCount], [xChar] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nCount
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
 * Expand( "123456" )         OK
 * Expand( "123456", 2 )      OK
 * Expand( "123456", "." )    OK
 * Expand( "123456", 2, "." ) OK
 * Expand( "A" )              OK
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

   Check( 'Expand( "123456" )         ', Expand( "123456" ), "1 2 3 4 5 6" )
   Check( 'Expand( "123456", 2 )      ', Expand( "123456", 2 ), "1  2  3  4  5  6" )
   Check( 'Expand( "123456", "." )    ', Expand( "123456", "." ), "1.2.3.4.5.6" )
   Check( 'Expand( "123456", 2, "." ) ', Expand( "123456", 2, "." ), "1..2..3..4..5..6" )
   Check( 'Expand( "A" )              ', Expand( "A" ), "A" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
