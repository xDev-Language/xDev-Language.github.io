/*
 * $DOC$
 *
 * $NAME$
 * FileSize()
 *
 * $ONELINER$
 * Query a file size without changing a managed resource cursor
 *
 * $SYNTAX$
 * FileSize( pHandle | cFileName, [lUseDirEntry] ) --> nBytes
 *
 * $ARGUMENTS$
 * Pass a managed resource from FileOpen() or a file path. With a path, lUseDirEntry defaults to .T. to use
 * metadata; .F. opens the path for reading.
 *
 * $RETURNS$
 * The byte size, or -1 on I/O failure; inspect FileError().
 *
 * $DESCRIPTION$
 * Query a file size without changing a managed resource cursor. A resource argument is borrowed for the query
 * and remains owned by its caller; close it with FileClose(). With a path, this function manages any temporary
 * internal open itself. It does not accept the numeric handle returned by FOpen().
 *
 * $NOTES$
 * FSize() was a duplicate placeholder and is removed; FileSize(cFileName) already provides that operation. A
 * wrong input type raises error 1102. Checks labelled Expected verify deliberate argument or I/O failures; a
 * missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Path size: OK
 * Managed resource size: OK
 * Size query after seeking: OK
 * Cursor preserved: OK
 * Open-based path query: OK
 * Expected missing-file result: OK
 * Expected I/O error: OK
 * Expected argument error: OK
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

   LOCAL cName := s_TestFile( "A" + Chr( 0 ) + "B" )
   LOCAL pFile := FileOpen( cName )

   s_Check( 'Path size', FileSize( cName ), 3 )
   s_Check( 'Managed resource size', FileSize( pFile ), 3 )
   FileSeek( pFile, 1 )
   s_Check( 'Size query after seeking', FileSize( pFile ), 3 )
   s_Check( 'Cursor preserved', FileSeek( pFile, 0, 1 ), 1 )
   FileClose( pFile )
   s_Check( 'Open-based path query', FileSize( cName, .F. ), 3 )
   s_Check( 'Expected missing-file result', FileSize( cName + ".missing" ), -1 )
   s_Check( 'Expected I/O error', FileError() != 0, .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FileSize( 123 ) } ), 1102 )
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
