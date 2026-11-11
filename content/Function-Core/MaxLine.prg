/*
 * $DOC$
 *
 * $NAME$
 * MaxLine()
 *
 * $ONELINER$
 * Return the byte length of the longest text line
 *
 * $SYNTAX$
 * MaxLine( cText ) --> nLength
 *
 * $ARGUMENTS$
 * cText is the text to examine.
 *
 * $RETURNS$
 * The longest line length in bytes, or 0 for empty text.
 *
 * $DESCRIPTION$
 * CR and LF terminate lines; a CRLF or LFCR pair is one line ending. End-of-line bytes are excluded. Tabs and
 * embedded zeroes each count as one byte. There is no wrapping or tab expansion.
 *
 * $NOTES$
 * This measures bytes, not Unicode characters or display columns. Wrong or missing arguments raise error 1102.
 * Deliberately invalid calls in the example must produce the stated error code; s_ErrorCode() catches it so
 * execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Empty: OK
 * One line: OK
 * LF lines: OK
 * CRLF lines: OK
 * CR lines: OK
 * Only endings: OK
 * Tab is one byte: OK
 * Embedded zero: OK
 * UTF-8 bytes: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * NumLine(), TabExpand(), ULen()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Empty', MaxLine( "" ), 0 )
   s_Check( 'One line', MaxLine( "abc" ), 3 )
   s_Check( 'LF lines', MaxLine( e"a\nbbbb\ncc" ), 4 )
   s_Check( 'CRLF lines', MaxLine( ( e"ab" + Chr( 13 ) + e"\nc" ) ), 2 )
   s_Check( 'CR lines', MaxLine( ( e"ab" + Chr( 13 ) + e"cdef" ) ), 4 )
   s_Check( 'Only endings', MaxLine( ( Chr( 13 ) + e"\n" + Chr( 13 ) + e"\n" ) ), 0 )
   s_Check( 'Tab is one byte', MaxLine( e"a\tb" ), 3 )
   s_Check( 'Embedded zero', MaxLine( "A" + Chr( 0 ) + "B" ), 3 )
   s_Check( 'UTF-8 bytes', MaxLine( "ą" ), 2 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| MaxLine( 1 ) } ), 1102 )

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
