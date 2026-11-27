/*
 * $DOC$
 * $NAME$
 * FSeek()
 *
 * $ONELINER$
 * Move the byte position of a numeric file handle
 *
 * $SYNTAX$
 * FSeek( nHandle, nOffset, [nOrigin := FS_SET] ) --> nPosition | -1
 *
 * $ARGUMENTS$
 * `nHandle` Open numeric file handle.
 * `nOffset` Signed byte offset from the selected origin.
 * `nOrigin` `FS_SET` for the start, `FS_RELATIVE` for the current position or `FS_END` for the end of the file.
 *
 * $RETURNS$
 * The new zero-based byte position, or `-1` on failure. Read `FError()` for the error code.
 *
 * $DESCRIPTION$
 * Subsequent reads and writes start at the new position. `FSeek( nHandle, 0, FS_RELATIVE )` queries the current offset. Seeking beyond EOF can succeed and leaves the file size unchanged until a write or a change of length.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FOpen(), FRead(), FWrite(), FClose(), FError(), FileSeek()
 *
 * $DOCEND$
 */

#include "fileio.ch"

PROCEDURE Main()

   LOCAL cPath := ""
   LOCAL nHandle := FTempCreate( NIL, NIL, NIL, @cPath )

   IF nHandle < 0
      QOut( FError() )
      RETURN
   ENDIF

   IF FWrite( nHandle, "abc" ) == 3
      QOut( FSeek( nHandle, -1, FS_END ) ) // offset 2
   ELSE
      QOut( FError() )
   ENDIF
   FClose( nHandle )
   FErase( cPath )

RETURN
