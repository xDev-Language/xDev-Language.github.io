/*
 * $DOC$
 * $NAME$
 * FileTemp()
 *
 * $ONELINER$
 * Create and open a temporary file
 *
 * $SYNTAX$
 * FileTemp( @cFileName, [cDir], [cPrefix], [cExt], [nAttr := FC_NORMAL] ) --> pHandle | NIL
 *
 * $ARGUMENTS$
 * `cFileName` Variable passed by reference to receive the generated path.
 * `cDir` Directory in which to create the file. The default is the system temporary directory.
 * `cPrefix` File name prefix. Defaults to `xdev-`.
 * `cExt` Optional file name extension.
 * `nAttr` Creation attributes. Defaults to `FC_NORMAL`.
 *
 * $RETURNS$
 * A managed file resource on success, or `NIL` on failure. Read `FileError()` for the I/O status.
 *
 * $DESCRIPTION$
 * The call creates and opens a new file. Close it with `FileClose()`. Remove it explicitly when the path is no longer needed.
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FileOpen(), FileClose(), FileWrite(), FileError()
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

   QOut( FileClose( pFile ) )
   FErase( cName )

RETURN
