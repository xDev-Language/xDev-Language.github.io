/*
 * $DOC$
 * $NAME$
 * FileOpen()
 *
 * $ONELINER$
 * Open an existing file as a managed resource
 *
 * $SYNTAX$
 * FileOpen( cFileName, [nMode := FO_READ + FO_COMPAT] ) --> pHandle | NIL
 *
 * $ARGUMENTS$
 * `cFileName` Path to an existing file.
 * `nMode` Access and sharing flags from `fileio.ch`. The default opens the file for reading in compatibility sharing mode.
 *
 * $RETURNS$
 * A managed file resource on success, or `NIL` on failure. Read `FileError()` for the I/O status.
 *
 * $DESCRIPTION$
 * Pass the resource to `FileRead()`, `FileWrite()`, `FileSeek()` or `FileClose()`. Copies share the current file position and closed state. Close the resource explicitly when finished.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FileRead(), FileWrite(), FileSeek(), FileClose(), FileTemp(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL pFile := FileTemp( @cName )

   IF pFile == NIL
      QOut( FileError() )
      RETURN
   ENDIF

   FileClose( pFile )
   pFile := FileOpen( cName )
   IF pFile == NIL
      QOut( FileError() )
   ELSE
      QOut( FileClose( pFile ) )
   ENDIF
   FErase( cName )

RETURN
