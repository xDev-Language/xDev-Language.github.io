/*
 * $DOC$
 *
 * $NAME$
 * FCharCount()
 *
 * $ONELINER$
 * Count non-whitespace bytes in a file
 *
 * $SYNTAX$
 * FCharCount( cFileName ) --> nCount
 *
 * $ARGUMENTS$
 * cFileName is a literal path, relative to the current directory when no path is supplied.
 *
 * $RETURNS$
 * The count as an integer; 0 on opening or reading failure. Inspect FError() to distinguish failure from an
 * empty file.
 *
 * $DESCRIPTION$
 * Count non-whitespace bytes in a file. Excludes only space (32), tab (9), CR (13) and LF (10). Zero bytes and
 * UTF-8 bytes are counted. Reads fixed-size blocks and carries state across block boundaries. The file is
 * opened and closed internally.
 *
 * $NOTES$
 * No SET PATH search is performed. Wrong or missing argument types raise error 1102. Checks labelled Expected
 * deliberately exercise failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Mixed whitespace: OK
 * Empty file: OK
 * Only whitespace: OK
 * Chunk boundary: OK
 * UTF-8 bytes: OK
 * Missing file result: OK
 * Expected I/O error: OK
 * Expected argument error: OK
 * Expected missing argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FReadLine(), FLineCount(), FWordCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cText := s_TestFile( "one two" + Chr( 13 ) + Chr( 10 ) + Chr( 9 ) + "end" + Chr( 10 ) )
   LOCAL cEmpty := s_TestFile( "" )
   LOCAL cBlank := s_TestFile( "  " + Chr( 9 ) + Chr( 10 ) )
   LOCAL cLarge := s_TestFile( Replicate( "a", 16383 ) + Chr( 13 ) + Chr( 10 ) + "b" )
   LOCAL cUTF8 := s_TestFile( "ą" )

   s_Check( 'Mixed whitespace', FCharCount( cText ), 9 )
   s_Check( 'Empty file', FCharCount( cEmpty ), 0 )
   s_Check( 'Only whitespace', FCharCount( cBlank ), 0 )
   s_Check( 'Chunk boundary', FCharCount( cLarge ), 16384 )
   s_Check( 'UTF-8 bytes', FCharCount( cUTF8 ), 2 )
   s_Check( 'Missing file result', FCharCount( cText + ".missing" ), 0 )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FCharCount( 1 ) } ), 1102 )
   s_Check( 'Expected missing argument error', s_ErrorCode( {|| FCharCount() } ), 1102 )
   FErase( cText )
   FErase( cEmpty )
   FErase( cBlank )
   FErase( cLarge )
   FErase( cUTF8 )

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
