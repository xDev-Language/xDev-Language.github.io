/*
 * $DOC$
 *
 * $NAME$
 * FileTextSkip()
 *
 * $ONELINER$
 * Move the selected text area by a signed number of physical lines, default 1
 *
 * $SYNTAX$
 * FileTextSkip( [nLines] ) --> NIL
 *
 * $ARGUMENTS$
 * nLines is a signed integer increment, default 1; fractions are discarded.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * Move the selected text area by a signed number of physical lines, default 1. Movement before the first line
 * is clamped to the first line. Movement past the final line reaches EOF, with record number equal to the line
 * count plus 1. A negative skip can move back from EOF. The area owns its open resource. Any numeric handle
 * returned by FileTextUse() is borrowed: do not close it with FClose() or FileClose(). Close the selected area
 * with FileTextUse(). All open areas are also closed at runtime shutdown. FileOpen()/FileClose() instead use an
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
 * Default advances one: OK
 * Zero preserves position: OK
 * Clamp at first: OK
 * Skip reaches EOF: OK
 * EOF record number: OK
 * Back from EOF: OK
 * Expected type error: OK
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

   s_Check( 'Return value', FileTextSkip(), NIL )
   s_Check( 'Default advances one', FileTextRecNo(), 2 )
   FileTextSkip( 0 )
   s_Check( 'Zero preserves position', FileTextRecNo(), 2 )
   FileTextSkip( -10 )
   s_Check( 'Clamp at first', FileTextRecNo(), 1 )
   FileTextSkip( 100 )
   s_Check( 'Skip reaches EOF', FileTextEof(), .T. )
   s_Check( 'EOF record number', FileTextRecNo(), 4 )
   FileTextSkip( -1 )
   s_Check( 'Back from EOF', FileTextReadLn(), "three" )
   s_Check( 'Expected type error', s_ErrorCode( {|| FileTextSkip( .T. ) } ), 1102 )
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
