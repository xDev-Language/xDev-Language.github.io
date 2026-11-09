/*
 * $DOC$
 *
 * $NAME$
 * FileTextGoBottom()
 *
 * $ONELINER$
 * Position the selected text area at its final physical line
 *
 * $SYNTAX$
 * FileTextGoBottom( ) --> NIL
 *
 * $ARGUMENTS$
 * No arguments; operates on the selected text file area.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * Position the selected text area at its final physical line. The line remains readable and is not EOF. Empty
 * areas remain at EOF with record number 0. The area owns its open resource. Any numeric handle returned by
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
 * Return value: OK
 * Last record: OK
 * Last contents: OK
 * Last record is not EOF: OK
 * Bottom from EOF: OK
 * Closed-area return: OK
 * Expected closed-area error: OK
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

   s_Check( 'Return value', FileTextGoBottom(), NIL )
   s_Check( 'Last record', FileTextRecNo(), 3 )
   s_Check( 'Last contents', FileTextReadLn(), "three" )
   s_Check( 'Last record is not EOF', FileTextEof(), .F. )
   FileTextSkip()
   FileTextGoBottom()
   s_Check( 'Bottom from EOF', FileTextReadLn(), "three" )
   FileTextUse()
   s_Check( 'Closed-area return', FileTextGoBottom(), NIL )
   s_Check( 'Expected closed-area error', FileError(), 6 )
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
