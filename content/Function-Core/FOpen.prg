/*
 * $DOC$
 * $NAME$
 * FOpen()
 *
 * $ONELINER$
 * Open an existing file and return its numeric handle
 *
 * $SYNTAX$
 * FOpen( cFile, [nMode := FO_READ + FO_COMPAT] ) --> nHandle | -1
 *
 * $ARGUMENTS$
 * `cFile` Path to the existing file.
 * `nMode` Access mode (`FO_READ`, `FO_WRITE` or `FO_READWRITE`) plus an optional sharing mode from `fileio.ch`.
 *
 * $RETURNS$
 * A numeric handle on success or `-1` on failure. Read `FError()` for the error code.
 *
 * $DESCRIPTION$
 * Use `FClose()` when finished with the handle. Opening with `FO_WRITE` leaves the file contents intact. On Windows, use `FO_EXCLUSIVE`, `FO_DENYWRITE`, `FO_DENYREAD` or `FO_DENYNONE` to control sharing. The default allows other opens for reading and writing. On POSIX only the access flags are applied.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FCreate(), FRead(), FWrite(), FSeek(), FClose(), FError(), FileOpen()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cPath := ""
   LOCAL nHandle := FTempCreate( NIL, NIL, NIL, @cPath )

   IF nHandle < 0
      QOut( FError() )
      RETURN
   ENDIF

   FClose( nHandle )
   nHandle := FOpen( cPath )
   IF nHandle < 0
      QOut( FError() )
   ELSE
      QOut( "Opened" )
      FClose( nHandle )
   ENDIF
   FErase( cPath )

RETURN
