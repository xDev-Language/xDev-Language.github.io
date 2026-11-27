/*
 * $DOC$
 * $NAME$
 * IsDir()
 *
 * $ONELINER$
 * Test whether a name or a mask finds a directory
 *
 * $SYNTAX$
 * IsDir( cDirSpec ) --> lIsDirectory
 *
 * $ARGUMENTS$
 * `cDirSpec` A directory name, or a mask with * and ?.
 *
 * $RETURNS$
 * .T. when the first entry found is a directory, otherwise .F.
 *
 * $DESCRIPTION$
 * IsDir() is the same function as IsDirectory(). See there.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IsDir() of a directory           OK
 * IsDir() of a file                OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IsDirectory(), DirExists()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DirMake( "isdir-demo" )
   MemoWrit( "isdir-file.txt", "text", .F. )

   Check( 'IsDir() of a directory           ', IsDir( "isdir-demo" ), .T. )
   Check( 'IsDir() of a file                ', IsDir( "isdir-file.txt" ), .F. )

   FErase( "isdir-file.txt" )
   DirRemove( "isdir-demo" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
