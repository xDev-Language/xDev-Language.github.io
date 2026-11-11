/*
 * $DOC$
 *
 * $NAME$
 * ReadLine()
 *
 * $ONELINER$
 * Locate the next line inside a string without allocating a file or changing input
 *
 * $SYNTAX$
 * ReadLine( cText, [cDelim | aDelim], nLineLen, [nTabWidth], [lWrap], [nStartOffset], @lFound, @lEOF,
 * @nEndOffset, @nEndOfLine ) --> NIL
 *
 * $ARGUMENTS$
 * cText is a byte string. Delimiters default to CRLF/CR/LF. nLineLen is positive; nTabWidth defaults to 4.
 * lWrap defaults to .T.; nStartOffset defaults to 1. All four output arguments must be references.
 *
 * $RETURNS$
 * NIL, with positions and flags assigned to output references.
 *
 * $DESCRIPTION$
 * Locate the next line inside a string without allocating a file or changing input. nEndOffset is the 1-based
 * final content position, excluding a matched delimiter; nEndOfLine is the final consumed position, including a
 * delimiter or wrap whitespace. Continue from nEndOfLine + 1. lFound reports a hard delimiter; lEOF means no
 * remaining input. With wrapping enabled, width counts byte columns and tabs advance to tab stops; a word is
 * moved to the next line when possible. With wrapping disabled, width is ignored and the next hard delimiter
 * ends the line. No handle ownership or closing operation is involved.
 *
 * $NOTES$
 * Custom delimiters are non-empty strings or arrays of such strings. Soft CR (byte 141 followed by LF outside a
 * UTF-8 continuation) is ignored for wrapping or acts as a break without wrapping. Positions refer to the
 * original bytes, not expanded tab spaces or Unicode characters. Empty input produces end positions 0. Bad
 * types, widths, delimiter elements or output references raise error 1102. Checks labelled Expected verify
 * deliberate argument or I/O failures; a missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Return value: OK
 * Hard delimiter found: OK
 * More input remains: OK
 * Content end offset: OK
 * End including CRLF: OK
 * Extracted contents: OK
 * Final end: OK
 * Final EOF: OK
 * Word-wrapped end: OK
 * Whitespace consumed: OK
 * Wrap is not hard delimiter: OK
 * No wrapping ignores width: OK
 * Custom end: OK
 * Custom next position: OK
 * Tab affects wrapping: OK
 * Tab byte skipped: OK
 * Empty input EOF: OK
 * Empty input offset: OK
 * Expected width error: OK
 * Expected delimiter-array error: OK
 * Expected reference error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FileReadLine(), NumLine(), MaxLine(), SubStr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cText := "one two" + Chr( 13 ) + Chr( 10 ) + "last"
   LOCAL lFound, lEOF, nEnd, nNext

   s_Check( 'Return value', ReadLine( cText, NIL, 80, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext ), NIL )
   s_Check( 'Hard delimiter found', lFound, .T. )
   s_Check( 'More input remains', lEOF, .F. )
   s_Check( 'Content end offset', nEnd, 7 )
   s_Check( 'End including CRLF', nNext, 9 )
   s_Check( 'Extracted contents', SubStr( cText, 1, nEnd ), "one two" )
   ReadLine( cText, NIL, 80, NIL, .T., nNext + 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'Final end', nEnd, 13 )
   s_Check( 'Final EOF', lEOF, .T. )
   ReadLine( cText, NIL, 4, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'Word-wrapped end', nEnd, 3 )
   s_Check( 'Whitespace consumed', nNext, 4 )
   s_Check( 'Wrap is not hard delimiter', lFound, .F. )
   ReadLine( cText, NIL, 1, NIL, .F., 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'No wrapping ignores width', nEnd, 7 )
   ReadLine( "a||b", { "||", ";" }, 80, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'Custom end', nEnd, 1 )
   s_Check( 'Custom next position', nNext, 3 )
   ReadLine( "a" + Chr( 9 ) + "b", NIL, 4, 4, .T., 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'Tab affects wrapping', nEnd, 1 )
   s_Check( 'Tab byte skipped', nNext, 2 )
   ReadLine( "", NIL, 80, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext )
   s_Check( 'Empty input EOF', lEOF, .T. )
   s_Check( 'Empty input offset', nEnd, 0 )
   s_Check( 'Expected width error', s_ErrorCode( {|| ReadLine( cText, NIL, 0, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext ) } ), 1102 )
   s_Check( 'Expected delimiter-array error', s_ErrorCode( {|| ReadLine( cText, { 1 }, 80, NIL, .T., 1, @lFound, @lEOF, @nEnd, @nNext ) } ), 1102 )
   s_Check( 'Expected reference error', s_ErrorCode( {|| ReadLine( cText, NIL, 80, NIL, .T., 1, .F., @lEOF, @nEnd, @nNext ) } ), 1102 )

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
