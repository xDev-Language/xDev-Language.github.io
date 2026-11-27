/*
 * $DOC$
 * $NAME$
 * FileSeek()
 *
 * $ONELINER$
 * Set the byte position of a managed file
 *
 * $SYNTAX$
 * FileSeek( pHandle, nOffset, [nWhence := FS_SET] ) --> nPosition | -1
 *
 * $ARGUMENTS$
 * `pHandle` Open managed resource.
 * `nOffset` Byte offset relative to the selected origin.
 * `nWhence` `FS_SET` for the beginning, `FS_RELATIVE` for the current position, or `FS_END` for the end.
 *
 * $RETURNS$
 * The resulting zero-based byte position, or `-1` on failure. Read `FileError()` for the I/O status.
 *
 * $DESCRIPTION$
 * Subsequent reads and writes start at the resulting position. Use `FileSeek( pHandle, 0, FS_RELATIVE )` to query the current position.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FileOpen(), FileRead(), FileWrite(), FileClose(), FileError()
 *
 * $DOCEND$
 */

#include "fileio.ch"

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL pFile := FileTemp( @cName )

   IF pFile == NIL
      QOut( FileError() )
      RETURN
   ENDIF

   IF FileWrite( pFile, "abc" ) == 3
      QOut( FileSeek( pFile, -1, FS_END ) )
   ELSE
      QOut( FileError() )
   ENDIF
   FileClose( pFile )
   FErase( cName )

RETURN
