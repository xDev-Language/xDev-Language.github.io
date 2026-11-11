/*
 * $DOC$
 *
 * $NAME$
 * FileTextInfo()
 *
 * $ONELINER$
 * Return six fields for the selected text area: area number, physical line count, current line number,
 * zero-based byte offset of the current line, file size in bytes and EOF flag
 *
 * $SYNTAX$
 * FileTextInfo( ) --> aInfo
 *
 * $ARGUMENTS$
 * No arguments; operates on the selected text file area.
 *
 * $RETURNS$
 * An array of six fields described below.
 *
 * $DESCRIPTION$
 * Return six fields for the selected text area: area number, physical line count, current line number,
 * zero-based byte offset of the current line, file size in bytes and EOF flag. At EOF the offset equals the
 * file size. This is the logical record position, not a raw handle cursor query. The area owns its open
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
 * Six fields: OK
 * Area number: OK
 * Line count: OK
 * Current record: OK
 * First offset: OK
 * Byte size: OK
 * EOF flag: OK
 * Last line offset: OK
 * EOF offset: OK
 * EOF state: OK
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
   LOCAL aInfo

   aInfo := FileTextInfo()
   s_Check( 'Six fields', Len( aInfo ), 6 )
   s_Check( 'Area number', aInfo[1], 1 )
   s_Check( 'Line count', aInfo[2], 3 )
   s_Check( 'Current record', aInfo[3], 1 )
   s_Check( 'First offset', aInfo[4], 0 )
   s_Check( 'Byte size', aInfo[5], 12 )
   s_Check( 'EOF flag', aInfo[6], .F. )
   FileTextGoto( 3 )
   aInfo := FileTextInfo()
   s_Check( 'Last line offset', aInfo[4], 6 )
   FileTextSkip()
   aInfo := FileTextInfo()
   s_Check( 'EOF offset', aInfo[4], 12 )
   s_Check( 'EOF state', aInfo[6], .T. )
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
