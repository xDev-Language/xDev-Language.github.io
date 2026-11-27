/*
 * $DOC$
 * $NAME$
 * FCreate()
 *
 * $ONELINER$
 * Create a file or truncate it to zero bytes
 *
 * $SYNTAX$
 * FCreate( cFile, [nAttribute := FC_NORMAL] ) --> nHandle | -1
 *
 * $ARGUMENTS$
 * `cFile` Path at which to create an empty file. An existing file at the path is truncated.
 * `nAttribute` File creation flags from `fileio.ch`. The default is `FC_NORMAL`.
 *
 * $RETURNS$
 * A numeric read/write handle, or `-1` on failure. Read `FError()` for the error code.
 *
 * $DESCRIPTION$
 * Use `FClose()` when finished with the handle. On Windows the new handle opens with exclusive sharing and the creation flags can set read-only, hidden or system attributes. On POSIX, `FC_READONLY` affects permissions on a newly created file.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FOpen(), FWrite(), FClose(), FError()
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

   IF FWrite( nHandle, "abc" ) != 3
      QOut( FError() )
   ENDIF
   FClose( nHandle )

   nHandle := FCreate( cPath )
   IF nHandle < 0
      QOut( FError() )
   ELSE
      QOut( FSeek( nHandle, 0, FS_END ) ) // 0 bytes after truncation
      FClose( nHandle )
   ENDIF
   FErase( cPath )

RETURN
