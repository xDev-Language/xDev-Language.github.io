/*
 * $DOC$
 * $NAME$
 * FileWrite()
 *
 * $ONELINER$
 * Write bytes from a string to a managed file
 *
 * $SYNTAX$
 * FileWrite( pHandle, cBuffer, [nToWrite], [nTimeOut := -1] ) --> nWritten | -1
 *
 * $ARGUMENTS$
 * `pHandle` Managed resource open for writing.
 * `cBuffer` String containing the bytes to write.
 * `nToWrite` Byte count. Defaults to the string size and is limited to that size.
 * `nTimeOut` Leave at `-1`. A different timeout fails with file error 50 for an open resource.
 *
 * $RETURNS$
 * The number of bytes written, or `-1` on I/O failure. Read `FileError()` on failure. Compare the returned count with the requested count to detect a short write.
 *
 * $DESCRIPTION$
 * Writes at the current file position and advances it by the number of bytes written. A request for zero bytes leaves the file size and position unchanged.
 *
 * $SEEALSO$
 * FileOpen(), FileRead(), FileSeek(), FileCommit(), FileClose(), FileTemp(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL pFile := FileTemp( @cName )
   LOCAL nWritten

   IF pFile == NIL
      QOut( FileError() )
      RETURN
   ENDIF

   nWritten := FileWrite( pFile, "abc" )
   IF nWritten == -1
      QOut( FileError() )
   ELSE
      QOut( nWritten )
   ENDIF
   FileClose( pFile )
   FErase( cName )

RETURN
