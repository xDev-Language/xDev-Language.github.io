/*
 * $DOC$
 *
 * $NAME$
 * FileTextGoto()
 *
 * $ONELINER$
 * Position the selected text area at nLine, counted from 1
 *
 * $SYNTAX$
 * FileTextGoto( nLine ) --> NIL
 *
 * $ARGUMENTS$
 * nLine is a numeric physical line number. Fractions are discarded.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * Position the selected text area at nLine, counted from 1. Out-of-range requests are clamped to the first or
 * last physical line; empty areas remain at record number 0. Fractions are discarded. The area owns its open
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
 * Return value: OK
 * Requested record: OK
 * Blank record: OK
 * Clamp at last: OK
 * Clamp at first: OK
 * Fraction discarded: OK
 * Expected type error: OK
 * Expected missing line error: OK
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

   s_Check( 'Return value', FileTextGoto( 2 ), NIL )
   s_Check( 'Requested record', FileTextRecNo(), 2 )
   s_Check( 'Blank record', FileTextReadLn(), "" )
   FileTextGoto( 100 )
   s_Check( 'Clamp at last', FileTextRecNo(), 3 )
   FileTextGoto( -2 )
   s_Check( 'Clamp at first', FileTextRecNo(), 1 )
   FileTextGoto( 2.9 )
   s_Check( 'Fraction discarded', FileTextRecNo(), 2 )
   s_Check( 'Expected type error', s_ErrorCode( {|| FileTextGoto( "2" ) } ), 1102 )
   s_Check( 'Expected missing line error', s_ErrorCode( {|| FileTextGoto() } ), 1102 )
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
