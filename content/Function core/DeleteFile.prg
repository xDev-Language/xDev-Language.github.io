/*
 * $DOC$
 * $NAME$
 * DeleteFile()
 *
 * $ONELINER$
 * Delete a file with error handling
 *
 * $SYNTAX$
 * DeleteFile( cFileName ) --> nErrorCode
 *
 * $ARGUMENTS$
 * cFileName
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

   LOCAL lText := MemoWrit( "deletefile.txt", "xDev", .F. )

   Check( 'DeleteFile( "deletefile.txt" ) ', DeleteFile( "deletefile.txt" ), 0 )
   Check( 'File( "deletefile.txt" )       ', File( "deletefile.txt" ), .F. )
   Check( 'DeleteFile( "deletefile.txt" ) ', DeleteFile( "deletefile.txt" ), -2 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
