/*
 * $DOC$
 * $NAME$
 * RenameFile()
 *
 * $ONELINER$
 * Rename a file and handle errors
 *
 * $SYNTAX$
 * RenameFile( cOldFile, cNewFile ) --> nErrorCode
 *
 * $ARGUMENTS$
 * cOldFile
 * cNewFile
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL lText := MemoWrit( "old.txt", "xDev", .F. )

   Check( 'RenameFile( "old.txt", "new.txt" )  ', RenameFile( "old.txt", "new.txt" ), 0 )
   Check( 'File( "new.txt" )                   ', File( "new.txt" ), .T. )
   Check( 'RenameFile( "old.txt", "new2.txt" ) ', RenameFile( "old.txt", "new2.txt" ), -2 )
   Check( 'FErase( "new.txt" )                 ', FErase( "new.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
