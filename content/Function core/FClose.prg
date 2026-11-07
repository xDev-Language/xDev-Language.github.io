/*
 * $DOC$
 *
 * $NAME$
 * FClose()
 *
 * $ONELINER$
 * Close a caller-owned numeric file handle using the original Clipper API
 *
 * $SYNTAX$
 * FClose( nHandle ) --> lSuccess
 *
 * $ARGUMENTS$
 * nHandle is a numeric handle returned by FOpen(), FCreate() or a numeric-handle API.
 *
 * $RETURNS$
 * .T. when the OS close succeeds; .F. on failure. FError() gives the I/O error.
 *
 * $DESCRIPTION$
 * Close a caller-owned numeric file handle using the original Clipper API. The programmer is responsible for
 * closing it exactly once. A numeric variable or its copies are not changed or invalidated by this function.
 * This differs from FileClose(), which accepts the managed resource returned by FileOpen() and marks that
 * shared resource closed. Never pass a FileOpen() resource here, and never close a numeric handle borrowed from
 * FileTextUse(): that area owns it.
 *
 * $NOTES$
 * This function does not manage references or provide GC cleanup for numeric handles. Read FError() immediately
 * after a failure. Checks labelled Expected verify deliberate argument or I/O failures; a missing or different
 * error fails the check.
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
 * FOpen(), FCreate(), FError(), FileClose()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "abc" )
   LOCAL nHandle := FOpen( cName )
   LOCAL nCopy := nHandle

   s_Check( 'Numeric handle', ValType( nHandle ), "N" )
   s_Check( 'Close succeeds', FClose( nHandle ), .T. )
   s_Check( 'Close I/O status', FError(), 0 )
   s_Check( 'Number variable is unchanged', nHandle, nCopy )
   s_Check( 'Expected invalid numeric handle result', FClose( -1 ), .F. )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
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
