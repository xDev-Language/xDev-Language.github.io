/*
 * $DOC$
 *
 * $NAME$
 * FileClose()
 *
 * $ONELINER$
 * Close a shared managed file resource
 *
 * $SYNTAX$
 * FileClose( pHandle ) --> lSuccess
 *
 * $ARGUMENTS$
 * pHandle is a managed resource returned by FileOpen() or FileTemp(), not a number.
 *
 * $RETURNS$
 * .T. on successful close, .F. for an already closed resource or an OS failure; inspect FileError().
 *
 * $DESCRIPTION$
 * Close a shared managed file resource. All copied references refer to the same resource and observe its closed
 * state. Its stored OS handle is invalidated before closing, preventing later GC cleanup from closing it again.
 * If the caller leaves a managed resource open, its finalizer closes it when the resource is collected. This
 * differs from FClose(), which accepts a caller-owned numeric handle and does not track its copies. FileClose()
 * does not accept numeric handles, including borrowed handles from FileTextUse().
 *
 * $NOTES$
 * Closing an already closed managed resource returns .F. and sets error 6. Wrong or missing argument types
 * raise error 1102. Checks labelled Expected verify deliberate argument or I/O failures; a missing or different
 * error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Managed handle: OK
 * Close succeeds: OK
 * Close I/O status: OK
 * Expected shared resource already closed: OK
 * Expected closed-resource code: OK
 * Expected numeric argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FileOpen(), FileTemp(), FileError(), FClose()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "abc" )
   LOCAL pHandle := FileOpen( cName )
   LOCAL pCopy := pHandle

   s_Check( 'Managed handle', ValType( pHandle ), "P" )
   s_Check( 'Close succeeds', FileClose( pHandle ), .T. )
   s_Check( 'Close I/O status', FileError(), 0 )
   s_Check( 'Expected shared resource already closed', FileClose( pCopy ), .F. )
   s_Check( 'Expected closed-resource code', FileError(), 6 )
   s_Check( 'Expected numeric argument error', s_ErrorCode( {|| FileClose( 1 ) } ), 1102 )
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
