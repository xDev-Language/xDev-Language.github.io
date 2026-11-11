/*
 * $DOC$
 *
 * $NAME$
 * FileTextReadLn()
 *
 * $ONELINER$
 * Read the current physical line without moving the record position
 *
 * $SYNTAX$
 * FileTextReadLn( ) --> cLine
 *
 * $ARGUMENTS$
 * No arguments; operates on the selected text file area.
 *
 * $RETURNS$
 * The current physical line as a byte string.
 *
 * $DESCRIPTION$
 * Read the current physical line without moving the record position. Line-ending bytes are excluded; other
 * bytes, including zeroes and UTF-8 sequences, are preserved. Blank lines and EOF both return an empty string;
 * use FileTextEof() to distinguish them. The area owns its open resource. Any numeric handle returned by
 * FileTextUse() is borrowed: do not close it with FClose() or FileClose(). Close the selected area with
 * FileTextUse(). All open areas are also closed at runtime shutdown. FileOpen()/FileClose() instead use an
 * independently managed resource.
 *
 * $NOTES$
 * The index is a snapshot built on opening; external edits are not reflected until reopening. A closed-area
 * query or navigation sets FileError() to 6, except closing an already closed area succeeds. Wrong argument
 * types or invalid area numbers raise error 1102. Checks labelled Expected verify deliberate argument or I/O
 * failures; a missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * First read: OK
 * Read does not move: OK
 * Repeated read: OK
 * Blank line: OK
 * Blank line is not EOF: OK
 * Final line: OK
 * EOF result: OK
 * Closed result: OK
 * Expected closed-area status: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FileTextUse(), FileTextSelect(), FileTextInfo(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "one" + Chr( 13 ) + Chr( 10 ) + Chr( 10 ) + "three" + Chr( 10 ) )
   LOCAL nOldArea := FileTextSelect( 1 )
   LOCAL nHandle := FileTextUse( cName )

   s_Check( 'First read', FileTextReadLn(), "one" )
   s_Check( 'Read does not move', FileTextRecNo(), 1 )
   s_Check( 'Repeated read', FileTextReadLn(), "one" )
   FileTextSkip()
   s_Check( 'Blank line', FileTextReadLn(), "" )
   s_Check( 'Blank line is not EOF', FileTextEof(), .F. )
   FileTextGoBottom()
   s_Check( 'Final line', FileTextReadLn(), "three" )
   FileTextSkip()
   s_Check( 'EOF result', FileTextReadLn(), "" )
   FileTextUse()
   s_Check( 'Closed result', FileTextReadLn(), "" )
   s_Check( 'Expected closed-area status', FileError(), 6 )
   FileTextSelect( 1 )
   FileTextUse()
   FErase( cName )
   FileTextSelect( nOldArea )

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
   LOCAL pFile := FileTemp( @cName )

   IF pFile == NIL
      QOut( "Create fixture: ERROR" )
      RETURN ""
   ENDIF
   IF FileWrite( pFile, cData ) != Len( cData )
      QOut( "Write fixture: ERROR" )
   ENDIF
   FileClose( pFile )

RETURN cName
