/*
 * $DOC$
 *
 * $NAME$
 * FileHandleEof()
 *
 * $ONELINER$
 * Test EOF without moving a numeric file cursor
 *
 * $SYNTAX$
 * FileHandleEof( nHandle ) --> lEof
 *
 * $ARGUMENTS$
 * nHandle is a borrowed numeric OS handle, such as the result of FOpen().
 *
 * $RETURNS$
 * .T. when the cursor is at or beyond the size, otherwise .F.. I/O failure also returns .F.; inspect
 * FileError().
 *
 * $DESCRIPTION$
 * Test EOF without moving a numeric file cursor. This function never owns or closes the handle; the caller
 * remains responsible for FClose(). It differs from FileEof(), which accepts a managed resource from
 * FileOpen(). A file-area borrowed handle remains owned by that area.
 *
 * $NOTES$
 * There is no F_Eof() alias. Wrong or missing argument types raise error 1102. Checks labelled Expected verify
 * deliberate argument or I/O failures; a missing or different error fails the check.
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

   LOCAL cName := s_TestFile( "abc" )
   LOCAL nHandle := FOpen( cName )

   s_Check( 'Initially not EOF', FileHandleEof( nHandle ), .F. )
   s_Check( 'Position preserved', FSeek( nHandle, 0, 1 ), 0 )
   FSeek( nHandle, 3, 0 )
   s_Check( 'At EOF', FileHandleEof( nHandle ), .T. )
   FSeek( nHandle, 100, 0 )
   s_Check( 'Past EOF', FileHandleEof( nHandle ), .T. )
   FClose( nHandle )
   s_Check( 'Expected invalid handle result', FileHandleEof( -1 ), .F. )
   s_Check( 'Expected I/O error', FileError() != 0, .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FileHandleEof( NIL ) } ), 1102 )
   FErase( cName )

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
