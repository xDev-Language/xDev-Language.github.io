/*
 * $DOC$
 * $NAME$
 * FileStr()
 *
 * $ONELINER$
 * Read a string from a file beginning at a specified offset
 *
 * $SYNTAX$
 * FileStr( cFileName, [nBytes], [nStart], [lCtrl_Z] ) --> cString
 *
 * $ARGUMENTS$
 * cFileName
 * nBytes
 * nStart
 * lCtrl_Z
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

   LOCAL lText := MemoWrit( "filestr.txt", "ABCDEFGHIJ", .F. )
   LOCAL lEof  := MemoWrit( "filestr2.txt", "abc" + Chr( 26 ) + "def", .F. )

   Check( 'FileStr( "filestr.txt" )                           ', FileStr( "filestr.txt" ), "ABCDEFGHIJ" )
   Check( 'FileStr( "filestr.txt", 4, 2 )                     ', FileStr( "filestr.txt", 4, 2 ), "CDEF" )
   Check( 'FileStr( "filestr2.txt", .T. )                     ', FileStr( "filestr2.txt", .T. ), "abc" )
   Check( 'FileStr( "no-such-file.txt" )                      ', FileStr( "no-such-file.txt" ), "" )
   Check( 'FErase( "filestr.txt" ) + FErase( "filestr2.txt" ) ', FErase( "filestr.txt" ) + FErase( "filestr2.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
