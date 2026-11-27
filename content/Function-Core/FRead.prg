/*
 * $DOC$
 * $NAME$
 * FRead()
 *
 * $ONELINER$
 * Read bytes into a preallocated string
 *
 * $SYNTAX$
 * FRead( nHandle, @cBuffer, nBytes ) --> nRead
 *
 * $ARGUMENTS$
 * `nHandle` Numeric handle open for reading.
 * `cBuffer` Preallocated string passed by reference.
 * `nBytes` Number of bytes to read, limited to the buffer size. A nonpositive value requests zero bytes.
 *
 * $RETURNS$
 * Number of bytes read. For a positive request into a nonempty buffer, a return of `0` with `FError() == 0` means EOF on a regular file. A return of `0` with a nonzero `FError()` means an I/O error.
 *
 * $DESCRIPTION$
 * Reads at the current position and advances by the number of bytes read. Only that many bytes at the start of the buffer are replaced. The remaining bytes and the buffer size are preserved. Omitting the by-reference marker gives a zero result without reading.
 *
 * $SEEALSO$
 * FOpen(), FWrite(), FSeek(), FClose(), FError(), FileRead()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cPath := ""
   LOCAL nHandle := FTempCreate( NIL, NIL, NIL, @cPath )
   LOCAL cBuffer := Space( 8 )
   LOCAL nRead

   IF nHandle < 0
      QOut( FError() )
      RETURN
   ENDIF

   IF FWrite( nHandle, "abc" ) == 3 .AND. FSeek( nHandle, 0 ) == 0
      nRead := FRead( nHandle, @cBuffer, 8 )
      IF FError() == 0
         QOut( Left( cBuffer, nRead ) )
         nRead := FRead( nHandle, @cBuffer, 8 )
         QOut( nRead, FError() ) // 0, 0 at EOF
      ELSE
         QOut( FError() )
      ENDIF
   ELSE
      QOut( FError() )
   ENDIF
   FClose( nHandle )
   FErase( cPath )

RETURN
