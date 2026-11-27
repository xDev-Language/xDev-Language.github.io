/*
 * $DOC$
 * $NAME$
 * FError()
 *
 * $ONELINER$
 * Read the status of the last file operation
 *
 * $SYNTAX$
 * FError() --> nError
 *
 * $RETURNS$
 * Zero for success, or a nonzero file error code.
 *
 * $DESCRIPTION$
 * `FError()` reads the same status as `FileError()` and leaves it intact. Read the code before calling another file operation. In particular, `FRead()` can return zero for either EOF or an error, and a zero-byte `FWrite()` returns zero whether setting the length succeeds or fails.
 *
 * $SEEALSO$
 * FOpen(), FCreate(), FRead(), FWrite(), FSeek(), FClose(), FCommit(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cBuffer := Space( 1 )

   QOut( FRead( -1, @cBuffer, 1 ) ) // 0 bytes
   QOut( FError() != 0 )           // .T. after a failed read

RETURN
