/*
 * $DOC$
 *
 * $NAME$
 * NumLine()
 *
 * $ONELINER$
 * Count text lines after fixed-width byte wrapping
 *
 * $SYNTAX$
 * NumLine( cText, [nLineLength] ) --> nLines
 *
 * $ARGUMENTS$
 * cText is the text. nLineLength is a positive numeric width, default 80; fractions are discarded.
 *
 * $RETURNS$
 * The number of output lines, or 0 for empty text.
 *
 * $DESCRIPTION$
 * CR, LF, CRLF and LFCR terminate lines. A long line is divided into pieces of at most nLineLength bytes,
 * without word wrapping. Blank terminated lines count; a final line ending does not create an extra line. Tabs
 * and embedded zeroes count as one byte.
 *
 * $NOTES$
 * This is byte wrapping, not Unicode or terminal-column wrapping. Wrong types, a missing text argument or a
 * width below 1 raise error 1102. It is not affected by terminal size. Deliberately invalid calls in the
 * example must produce the stated error code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Empty: OK
 * One line: OK
 * Wrap: OK
 * Exact width: OK
 * Final ending: OK
 * Blank line: OK
 * CRLF: OK
 * LFCR: OK
 * Only ending: OK
 * Default width: OK
 * Fractional width: OK
 * UTF-8 bytes: OK
 * Expected zero width error: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * MaxLine(), MlCount(), TabExpand()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Empty', NumLine( "" ), 0 )
   s_Check( 'One line', NumLine( "abc" ), 1 )
   s_Check( 'Wrap', NumLine( "abcdefghi", 4 ), 3 )
   s_Check( 'Exact width', NumLine( "abcdefgh", 4 ), 2 )
   s_Check( 'Final ending', NumLine( e"abcdefgh\n", 4 ), 2 )
   s_Check( 'Blank line', NumLine( e"a\n\nb" ), 3 )
   s_Check( 'CRLF', NumLine( ( e"a" + Chr( 13 ) + e"\nb" ) ), 2 )
   s_Check( 'LFCR', NumLine( ( e"a\n" + Chr( 13 ) + e"b" ) ), 2 )
   s_Check( 'Only ending', NumLine( e"\n" ), 1 )
   s_Check( 'Default width', NumLine( Replicate( "a", 81 ) ), 2 )
   s_Check( 'Fractional width', NumLine( "abcde", 2.9 ), 3 )
   s_Check( 'UTF-8 bytes', NumLine( "ą", 1 ), 2 )
   s_Check( 'Expected zero width error', s_ErrorCode( {|| NumLine( "a", 0 ) } ), 1102 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| NumLine( NIL ) } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN

STATIC FUNCTION s_ErrorCode( bAction )

   LOCAL nCode := 0
   LOCAL oError
   LOCAL bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER USING oError
      nCode := oError:SubCode
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
