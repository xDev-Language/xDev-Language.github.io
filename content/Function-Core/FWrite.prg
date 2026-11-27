/*
 * $DOC$
 * $NAME$
 * FWrite()
 *
 * $ONELINER$
 * Write bytes or set the file length at the current position
 *
 * $SYNTAX$
 * FWrite( nHandle, cBuffer, [nBytes] ) --> nWritten
 *
 * $ARGUMENTS$
 * `nHandle` Numeric handle open for writing.
 * `cBuffer` String containing the bytes to write.
 * `nBytes` Requested byte count. Defaults to the size of the string and is limited to that size. A nonpositive value gives an effective count of zero.
 *
 * $RETURNS$
 * Number of bytes written. Zero is also the return value on I/O failure, so inspect `FError()`. For a positive request, check the actual count before assuming that all bytes were written.
 *
 * $DESCRIPTION$
 * A positive effective count writes at the current position and advances it by the number of bytes written. A zero effective count sets the file length to the current position and returns zero. This can truncate or extend a regular file. Passing an empty string also gives a zero effective count.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FCreate(), FRead(), FSeek(), FCommit(), FClose(), FError(), FileWrite()
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

   IF FWrite( nHandle, "abc" ) == 3 .AND. FSeek( nHandle, 2 ) == 2
      FWrite( nHandle, "", 0 )
      IF FError() == 0
         QOut( FSeek( nHandle, 0, FS_END ) ) // 2 bytes after truncation
      ELSE
         QOut( FError() )
      ENDIF
   ELSE
      QOut( FError() )
   ENDIF
   FClose( nHandle )
   FErase( cPath )

RETURN
