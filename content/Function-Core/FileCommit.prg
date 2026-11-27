/*
 * $DOC$
 * $NAME$
 * FileCommit()
 *
 * $ONELINER$
 * Flush pending writes on a managed file resource
 *
 * $SYNTAX$
 * FileCommit( pHandle ) --> lSuccess
 *
 * $ARGUMENTS$
 * `pHandle` Managed file resource open for writing, such as one returned by `FileTemp()`
 * or by `FileOpen()` with write access.
 *
 * $RETURNS$
 * `.T.` when the operating system reports success, or `.F.` on failure.
 * Read `FileError()` immediately for the I/O status.
 *
 * $DESCRIPTION$
 * Requests synchronization of pending file writes with storage through `FlushFileBuffers`
 * on Windows or `fsync` on POSIX. The file remains open and its current byte position
 * stays unchanged.
 *
 * $NOTES$
 * A closed managed resource returns `.F.` and sets file error `6`. A missing argument or
 * an argument of the wrong type, including a numeric handle, raises runtime error `1102`.
 * Use `FCommit()` with a numeric handle.
 *
 * $OUTPUT$
 * Flush succeeds: OK
 * Success status: OK
 * Position preserved: OK
 * Close succeeds: OK
 * Closed resource rejected: OK
 * Closed resource status: OK
 * Temporary file removed: OK
 *
 * $SEEALSO$
 * FileOpen(), FileTemp(), FileWrite(), FileSeek(), FileClose(), FileError(), FCommit()
 *
 * $DOCEND$
 */

#include "fileio.ch"

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL pHandle := FileTemp( @cName )
   LOCAL lFlushed, nStatus

   IF pHandle == NIL
      QOut( "Create temporary file: ERROR", FileError() )
      ErrorLevel( 1 )
      RETURN
   ENDIF

   IF FileWrite( pHandle, "abc" ) == 3
      lFlushed := FileCommit( pHandle )
      nStatus := FileError()
      s_Check( "Flush succeeds", lFlushed )
      s_Check( "Success status", nStatus == 0 )
      s_Check( "Position preserved", FileSeek( pHandle, 0, FS_RELATIVE ) == 3 )
   ELSE
      QOut( "Write temporary file: ERROR", FileError() )
      ErrorLevel( 1 )
   ENDIF

   IF FileClose( pHandle )
      QOut( "Close succeeds: OK" )
      lFlushed := FileCommit( pHandle )
      nStatus := FileError()
      s_Check( "Closed resource rejected", ! lFlushed )
      s_Check( "Closed resource status", nStatus == 6 )
   ELSE
      QOut( "Close succeeds: ERROR", FileError() )
      ErrorLevel( 1 )
   ENDIF

   s_Check( "Temporary file removed", FErase( cName ) == 0 )

RETURN

STATIC PROCEDURE s_Check( cTitle, lPass )

   IF ! lPass
      ErrorLevel( 1 )
   ENDIF
   QOut( cTitle + ": " + IIF( lPass, "OK", "ERROR" ) )

RETURN
