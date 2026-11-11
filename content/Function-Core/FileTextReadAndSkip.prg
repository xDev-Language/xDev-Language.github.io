/*
 * $DOC$
 *
 * $NAME$
 * FileTextReadAndSkip()
 *
 * $ONELINER$
 * Read a logical CSV record and advance beyond it
 *
 * $SYNTAX$
 * FileTextReadAndSkip( ) --> cRecord
 *
 * $ARGUMENTS$
 * No arguments; operates on the selected text file area.
 *
 * $RETURNS$
 * The logical CSV record as a byte string.
 *
 * $DESCRIPTION$
 * Read a logical CSV record and advance beyond it. Balanced double quotes allow physical line endings inside
 * the returned record. Record numbers still count physical lines. Unclosed quotes set FileError() to 13, return
 * an empty string and preserve the record position. At EOF returns an empty string. The area owns its open
 * resource. Any numeric handle returned by FileTextUse() is borrowed: do not close it with FClose() or
 * FileClose(). Close the selected area with FileTextUse(). All open areas are also closed at runtime shutdown.
 * FileOpen()/FileClose() instead use an independently managed resource.
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
 * First record: OK
 * Advanced position: OK
 * Blank record: OK
 * Final record: OK
 * EOF after final: OK
 * EOF result: OK
 * Quoted multiline record: OK
 * Physical position after multiline: OK
 * Malformed quoted record: OK
 * Expected malformed-data error: OK
 * Malformed record preserves position: OK
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
   LOCAL cCsv := s_TestFile( '"a' + Chr( 13 ) + Chr( 10 ) + 'b",x' + Chr( 10 ) + '"bad' )

   s_Check( 'First record', FileTextReadAndSkip(), "one" )
   s_Check( 'Advanced position', FileTextRecNo(), 2 )
   s_Check( 'Blank record', FileTextReadAndSkip(), "" )
   s_Check( 'Final record', FileTextReadAndSkip(), "three" )
   s_Check( 'EOF after final', FileTextEof(), .T. )
   s_Check( 'EOF result', FileTextReadAndSkip(), "" )
   FileTextUse( cCsv )
   s_Check( 'Quoted multiline record', FileTextReadAndSkip(), '"a' + Chr( 13 ) + Chr( 10 ) + 'b",x' )
   s_Check( 'Physical position after multiline', FileTextRecNo(), 3 )
   s_Check( 'Malformed quoted record', FileTextReadAndSkip(), "" )
   s_Check( 'Expected malformed-data error', FileError(), 13 )
   s_Check( 'Malformed record preserves position', FileTextRecNo(), 3 )
   FileTextSelect( 1 )
   FileTextUse()
   FErase( cName )
   FErase( cCsv )
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
