/*
 * $DOC$
 * $NAME$
 * FileTime()
 *
 * $ONELINER$
 * Return the change time of a file
 *
 * $SYNTAX$
 * FileTime( cFileName ) --> cFileTime
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

   LOCAL lText := MemoWrit( "filetime.txt", "xDev", .F. )

   Check( 'Len( FileTime( "filetime.txt" ) )        ', Len( FileTime( "filetime.txt" ) ), 8 )
   Check( 'SetFDaTi( "filetime.txt", , "12:34:56" ) ', SetFDaTi( "filetime.txt", , "12:34:56" ), .T. )
   Check( 'FileTime( "filetime.txt" )               ', FileTime( "filetime.txt" ), "12:34:56" )
   Check( 'FileTime( "no-such-file.txt" )           ', FileTime( "no-such-file.txt" ), "" )
   Check( 'FErase( "filetime.txt" )                 ', FErase( "filetime.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
