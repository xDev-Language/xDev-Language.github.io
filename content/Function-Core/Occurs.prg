/*
 * $DOC$
 * $NAME$
 * Occurs()
 *
 * $ONELINER$
 * Count the occurrences of a substring, also those that overlap
 *
 * $SYNTAX$
 * Occurs( cSubStr, cString ) --> nCount
 *
 * $ARGUMENTS$
 * `cSubStr` The text to count.
 *
 * `cString` The text to search in.
 *
 * $RETURNS$
 * The number of occurrences. 0 when `cSubStr` is empty.
 *
 * $DESCRIPTION$
 * Occurs() starts the next search one character after the start of the last occurrence, so
 * occurrences may overlap: "aa" occurs twice in "aaa".
 *
 * $NOTES$
 * NumAt() starts the next search after the end of the last occurrence and counts "aa" in "aaa"
 * once.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Occurs( "aa", "aaa" )            OK
 * NumAt( "aa", "aaa" )             OK
 * Occurs( "ż", "żużel" )           OK
 * Occurs( "x", "abc" )             OK
 * Occurs( "", "abc" )              OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumAt(), At(), AtNum()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'Occurs( "aa", "aaa" )            ', Occurs( "aa", "aaa" ), 2 )
   Check( 'NumAt( "aa", "aaa" )             ', NumAt( "aa", "aaa" ), 1 )
   Check( 'Occurs( "ż", "żużel" )           ', Occurs( "ż", "żużel" ), 2 )
   Check( 'Occurs( "x", "abc" )             ', Occurs( "x", "abc" ), 0 )
   Check( 'Occurs( "", "abc" )              ', Occurs( "", "abc" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
