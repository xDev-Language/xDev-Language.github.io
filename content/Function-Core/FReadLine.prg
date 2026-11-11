/*
 * $DOC$
 *
 * $NAME$
 * FReadLine()
 *
 * $ONELINER$
 * Read the next line or bounded piece of a long line
 *
 * $SYNTAX$
 * FReadLine( nFileHandle, @cLine, [caEndOfLine], [nLineLength] ) --> nReturn
 *
 * $ARGUMENTS$
 * Use a seekable numeric file handle and an output variable passed by reference. caEndOfLine is a non-empty
 * delimiter or a non-empty array of non-empty delimiter strings. Omitted/NIL recognizes CRLF, LF and CR.
 * nLineLength is a positive maximum payload byte count, default 4096.
 *
 * $RETURNS$
 * 0 when data or a terminated blank line was read; -1 at EOF or on I/O failure. FError() is 0 at EOF. cLine
 * contains no matched delimiter and is cleared at EOF.
 *
 * $DESCRIPTION$
 * Read the next line or bounded piece of a long line. Unread bytes are restored to the file by seeking, so the
 * next call continues from the correct position. Custom delimiters match exact bytes; array order resolves
 * equal ending points. Zero bytes are preserved.
 *
 * $NOTES$
 * The default also recognizes standalone LF and CR, beyond the historical CRLF-only default. Lookahead consumes
 * a delimiter beginning at or before the payload limit, including when its bytes cross a read-buffer boundary.
 * Bad types, reference, delimiter elements or limits raise error 1102. Checks labelled Expected deliberately
 * exercise failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Read first: OK
 * First contents: OK
 * Read blank: OK
 * Blank contents: OK
 * Final unterminated line: OK
 * Final contents: OK
 * EOF: OK
 * EOF is not I/O error: OK
 * EOF clears output: OK
 * Custom delimiter array: OK
 * Custom first contents: OK
 * Next custom line: OK
 * Custom second contents: OK
 * Bounded long line: OK
 * First piece length: OK
 * Read remainder: OK
 * Remainder length: OK
 * Exact payload boundary: OK
 * Exact payload contents: OK
 * No artificial empty line: OK
 * Next boundary contents: OK
 * Delimiter crosses buffer and limit: OK
 * Split delimiter excluded: OK
 * Continue after split delimiter: OK
 * Split delimiter tail: OK
 * Expected I/O failure: OK
 * I/O failure code: OK
 * Expected reference error: OK
 * Expected empty delimiter error: OK
 * Expected array element error: OK
 * Expected limit error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FOpen(), FClose(), FReadStr(), FLineCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "one" + Chr( 13 ) + Chr( 10 ) + Chr( 10 ) + "three" )
   LOCAL nHandle := FOpen( cName )
   LOCAL cLine
   LOCAL cCustom := s_TestFile( "a||b;tail" )
   LOCAL nCustom := FOpen( cCustom )
   LOCAL cLong := s_TestFile( Replicate( "x", 5000 ) + Chr( 10 ) )
   LOCAL nLong := FOpen( cLong )
   LOCAL cBoundary := s_TestFile( "abc" + Chr( 10 ) + "z" )
   LOCAL nBoundary := FOpen( cBoundary )
   LOCAL cSplit := s_TestFile( Replicate( "x", 4095 ) + "||tail" )
   LOCAL nSplit := FOpen( cSplit )

   s_Check( 'Read first', FReadLine( nHandle, @cLine ), 0 )
   s_Check( 'First contents', cLine, "one" )
   s_Check( 'Read blank', FReadLine( nHandle, @cLine ), 0 )
   s_Check( 'Blank contents', cLine, "" )
   s_Check( 'Final unterminated line', FReadLine( nHandle, @cLine ), 0 )
   s_Check( 'Final contents', cLine, "three" )
   s_Check( 'EOF', FReadLine( nHandle, @cLine ), -1 )
   s_Check( 'EOF is not I/O error', FError(), 0 )
   s_Check( 'EOF clears output', cLine, "" )
   s_Check( 'Custom delimiter array', FReadLine( nCustom, @cLine, { "||", ";" } ), 0 )
   s_Check( 'Custom first contents', cLine, "a" )
   s_Check( 'Next custom line', FReadLine( nCustom, @cLine, ";" ), 0 )
   s_Check( 'Custom second contents', cLine, "b" )
   s_Check( 'Bounded long line', FReadLine( nLong, @cLine ), 0 )
   s_Check( 'First piece length', Len( cLine ), 4096 )
   s_Check( 'Read remainder', FReadLine( nLong, @cLine ), 0 )
   s_Check( 'Remainder length', Len( cLine ), 904 )
   s_Check( 'Exact payload boundary', FReadLine( nBoundary, @cLine, NIL, 3 ), 0 )
   s_Check( 'Exact payload contents', cLine, "abc" )
   s_Check( 'No artificial empty line', FReadLine( nBoundary, @cLine, NIL, 3 ), 0 )
   s_Check( 'Next boundary contents', cLine, "z" )
   s_Check( 'Delimiter crosses buffer and limit', FReadLine( nSplit, @cLine, "||", 4096 ), 0 )
   s_Check( 'Split delimiter excluded', Len( cLine ), 4095 )
   s_Check( 'Continue after split delimiter', FReadLine( nSplit, @cLine, "||", 4096 ), 0 )
   s_Check( 'Split delimiter tail', cLine, "tail" )
   s_Check( 'Expected I/O failure', FReadLine( -1, @cLine ), -1 )
   s_Check( 'I/O failure code', FError() != 0, .T. )
   s_Check( 'Expected reference error', s_ErrorCode( {|| FReadLine( nHandle, "text" ) } ), 1102 )
   s_Check( 'Expected empty delimiter error', s_ErrorCode( {|| FReadLine( nHandle, @cLine, "" ) } ), 1102 )
   s_Check( 'Expected array element error', s_ErrorCode( {|| FReadLine( nHandle, @cLine, { 1 } ) } ), 1102 )
   s_Check( 'Expected limit error', s_ErrorCode( {|| FReadLine( nHandle, @cLine, NIL, 0 ) } ), 1102 )
   FClose( nHandle )
   FClose( nCustom )
   FClose( nLong )
   FClose( nBoundary )
   FClose( nSplit )
   FErase( cName )
   FErase( cCustom )
   FErase( cLong )
   FErase( cBoundary )
   FErase( cSplit )

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

STATIC FUNCTION s_TestFile( cData )

   LOCAL cName := ""
   LOCAL nHandle := FTempCreate( NIL, "xdev-doc-", NIL, @cName )

   IF nHandle < 0
      QOut( "Create fixture: ERROR" )
      RETURN ""
   ENDIF
   IF FWrite( nHandle, cData ) != Len( cData )
      QOut( "Write fixture: ERROR" )
   ENDIF
   FClose( nHandle )

RETURN cName
