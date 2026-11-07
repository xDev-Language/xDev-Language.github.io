/*
 * $DOC$
 *
 * $NAME$
 * FileTextSelect()
 *
 * $ONELINER$
 * Select a text file area from 1 to 10, independently of RDD database areas
 *
 * $SYNTAX$
 * FileTextSelect( [nNewArea] ) --> nOldArea
 *
 * $ARGUMENTS$
 * nNewArea is 0..10, or omitted/NIL to query. A fractional part is discarded.
 *
 * $RETURNS$
 * The previous selected area number, or 0 when no unused area exists.
 *
 * $DESCRIPTION$
 * Select a text file area from 1 to 10, independently of RDD database areas. The initial area is 1. No argument
 * queries the area. Passing 0 selects the first unused area; if none is available, returns 0, leaves the
 * selection unchanged and sets FileError() to 4. The area owns its open resource. Any numeric handle returned
 * by FileTextUse() is borrowed: do not close it with FClose() or FileClose(). Close the selected area with
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

   s_Check( 'Query selected area', FileTextSelect(), 1 )
   s_Check( 'Select another area returns previous', FileTextSelect( 2 ), 1 )
   s_Check( 'New area is empty', FileTextLastRec(), 0 )
   s_Check( 'Select first returns previous', FileTextSelect( 1 ), 2 )
   s_Check( 'First area retains data', FileTextReadLn(), "one" )
   s_Check( 'Select free area returns previous', FileTextSelect( 0 ), 1 )
   s_Check( 'Free area selected', FileTextSelect(), 2 )
   s_Check( 'Expected area range error', s_ErrorCode( {|| FileTextSelect( 11 ) } ), 1102 )
   s_Check( 'Expected type error', s_ErrorCode( {|| FileTextSelect( "1" ) } ), 1102 )
   FileTextSelect( 1 )
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
