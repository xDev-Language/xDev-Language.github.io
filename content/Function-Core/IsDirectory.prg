/*
 * $DOC$
 * $NAME$
 * IsDirectory()
 *
 * $ONELINER$
 * Test whether a name or a mask finds a directory
 *
 * $SYNTAX$
 * IsDirectory( cDirName ) --> lIsDirectory
 *
 * $ARGUMENTS$
 * `cDirName` A directory name, or a mask with * and ?.
 *
 * $RETURNS$
 * .T. when the first entry found is a directory, otherwise .F.
 *
 * $DESCRIPTION$
 * IsDirectory() looks for files and directories like Directory( cDirName, "D" ) and tests the
 * first entry. A mask such as "data*" gives .T. when its first match is a directory.
 *
 * $NOTES$
 * DirExists() tests one exact name and takes no mask. IsDir() is the same function as
 * IsDirectory().
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * a directory gives .T.            OK
 * a mask of the directory          OK
 * a file gives .F.                 OK
 * a missing name gives .F.         OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IsDir(), DirExists(), Directory()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DirMake( "isdir-demo" )
   MemoWrit( "isdir-file.txt", "text", .F. )

   Check( 'a directory gives .T.            ', IsDirectory( "isdir-demo" ), .T. )
   Check( 'a mask of the directory          ', IsDirectory( "isdir-d*" ), .T. )
   Check( 'a file gives .F.                 ', IsDirectory( "isdir-file.txt" ), .F. )
   Check( 'a missing name gives .F.         ', IsDirectory( "isdir-none" ), .F. )

   FErase( "isdir-file.txt" )
   DirRemove( "isdir-demo" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
