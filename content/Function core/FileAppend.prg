/*
 * $DOC$
 * $NAME$
 * FileAppend()
 *
 * $ONELINER$
 * Append the contents of one file to another
 *
 * $SYNTAX$
 * FileAppend( cSourceFile, cTargetFile ) --> nBytesAdded
 *
 * $ARGUMENTS$
 * cSourceFile
 * cTargetFile
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

   LOCAL lFirst  := MemoWrit( "first.txt", "Hello ", .F. )
   LOCAL lSecond := MemoWrit( "second.txt", "World", .F. )

   Check( 'FileAppend( "second.txt", "first.txt" )        ', FileAppend( "second.txt", "first.txt" ), 5 )
   Check( 'FileStr( "first.txt" )                         ', FileStr( "first.txt" ), "Hello World" )
   Check( 'FileAppend( "no-such-file.txt", "first.txt" )  ', FileAppend( "no-such-file.txt", "first.txt" ), 0 )
   Check( 'FErase( "first.txt" ) + FErase( "second.txt" ) ', FErase( "first.txt" ) + FErase( "second.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
