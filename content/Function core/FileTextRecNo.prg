/*
 * $DOC$
 *
 * $NAME$
 * FileTextRecNo()
 *
 * $ONELINER$
 * Return the current physical line number in the selected text area
 *
 * $SYNTAX$
 * FileTextRecNo( ) --> nLineNumber
 *
 * $ARGUMENTS$
 * No arguments; operates on the selected text file area.
 *
 * $RETURNS$
 * The physical record number, or 0 for a closed or empty area.
 *
 * $DESCRIPTION$
 * Return the current physical line number in the selected text area. Lines start at 1; EOF after a non-empty
 * file is line count plus 1. Closed and empty areas return 0. The area owns its open resource. Any numeric
 * handle returned by FileTextUse() is borrowed: do not close it with FClose() or FileClose(). Close the
 * selected area with FileTextUse(). All open areas are also closed at runtime shutdown. FileOpen()/FileClose()
 * instead use an independently managed resource.
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

   s_Check( 'First number', FileTextRecNo(), 1 )
   FileTextSkip()
   s_Check( 'Blank line has number', FileTextRecNo(), 2 )
   FileTextGoBottom()
   s_Check( 'Last number', FileTextRecNo(), 3 )
   FileTextSkip()
   s_Check( 'EOF number', FileTextRecNo(), 4 )
   FileTextUse()
   s_Check( 'Closed number', FileTextRecNo(), 0 )
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
