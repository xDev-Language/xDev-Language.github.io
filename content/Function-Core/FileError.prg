/*
 * $DOC$
 * $NAME$
 * FileError()
 *
 * $ONELINER$
 * Read the last file-operation status
 *
 * $SYNTAX$
 * FileError() --> nError
 *
 * $RETURNS$
 * `0` for success or a nonzero file error code.
 *
 * $DESCRIPTION$
 * This call reads the same status as `FError()` and leaves it intact. Read it immediately after the file operation you are checking because another operation can overwrite it. The runtime reports argument errors separately.
 *
 * $SEEALSO$
 * FileOpen(), FileRead(), FileWrite(), FileSeek(), FileClose(), FileTemp()
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
   IF ! FileClose( pFile )
      QOut( FileError() ) // 6: the resource is already closed
   ENDIF
   FErase( cName )

RETURN
