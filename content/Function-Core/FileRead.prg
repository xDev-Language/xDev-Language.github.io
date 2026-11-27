/*
 * $DOC$
 * $NAME$
 * FileRead()
 *
 * $ONELINER$
 * Read bytes into an existing string buffer
 *
 * $SYNTAX$
 * FileRead( pHandle, @cBuffer, [nToRead], [nTimeOut := -1] ) --> nRead | -1
 *
 * $ARGUMENTS$
 * `pHandle` Managed resource open for reading.
 * `cBuffer` Preallocated string passed by reference.
 * `nToRead` Byte count. Defaults to the buffer size and is limited to that size.
 * `nTimeOut` Leave at `-1`. A different timeout fails with file error 50 for an open resource.
 *
 * $RETURNS$
 * The number of bytes read, or `-1` on I/O failure. Zero means no bytes were read, for example at EOF or when requesting zero bytes. Read `FileError()` on failure.
 *
 * $DESCRIPTION$
 * Reads at the current position and advances it by the number of bytes read. The buffer keeps its original size. Only its first `nRead` bytes are replaced.
 *
 * $SEEALSO$
 * FileOpen(), FileWrite(), FileSeek(), FileClose(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL pFile := FileTemp( @cName )
   LOCAL cBuffer := Space( 8 )
   LOCAL nRead

   IF pFile == NIL
      QOut( FileError() )
      RETURN
   ENDIF

   IF FileWrite( pFile, "abc" ) == 3 .AND. FileSeek( pFile, 0 ) == 0
      nRead := FileRead( pFile, @cBuffer )
      IF nRead > 0
         QOut( Left( cBuffer, nRead ) )
      ELSEIF nRead == -1
         QOut( FileError() )
      ENDIF
   ELSE
      QOut( FileError() )
   ENDIF
   FileClose( pFile )
   FErase( cName )

RETURN
