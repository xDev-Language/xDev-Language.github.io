/*
 * $DOC$
 * $NAME$
 * StrFile()
 *
 * $ONELINER$
 * Write a string to a file starting at a specified position
 *
 * $SYNTAX$
 * StrFile( cString, cFileName, [lUseExisting], [nOffset], [lTruncate] ) --> nBytesWritten
 *
 * $ARGUMENTS$
 * cString
 * cFileName
 * lUseExisting
 * nOffset
 * lTruncate
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
 * StrFile( Replicate( "X", 20 ), "strfile.txt" )  OK
 * StrFile( "AAAAA", "strfile.txt", .T., 10 )      OK
 * FileStr( "strfile.txt" )                        OK
 * StrFile( "AAAAA", "strfile.txt", .T., 10, .T. ) OK
 * FileStr( "strfile.txt" )                        OK
 * StrFile( "ABC", "strfile.txt", .T. )            OK
 * FileStr( "strfile.txt" )                        OK
 * FErase( "strfile.txt" )                         OK
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

   Check( 'StrFile( Replicate( "X", 20 ), "strfile.txt" )  ', StrFile( Replicate( "X", 20 ), "strfile.txt" ), 20 )
   Check( 'StrFile( "AAAAA", "strfile.txt", .T., 10 )      ', StrFile( "AAAAA", "strfile.txt", .T., 10 ), 5 )
   Check( 'FileStr( "strfile.txt" )                        ', FileStr( "strfile.txt" ), "XXXXXXXXXXAAAAAXXXXX" )
   Check( 'StrFile( "AAAAA", "strfile.txt", .T., 10, .T. ) ', StrFile( "AAAAA", "strfile.txt", .T., 10, .T. ), 5 )
   Check( 'FileStr( "strfile.txt" )                        ', FileStr( "strfile.txt" ), "XXXXXXXXXXAAAAA" )
   Check( 'StrFile( "ABC", "strfile.txt", .T. )            ', StrFile( "ABC", "strfile.txt", .T. ), 3 )
   Check( 'FileStr( "strfile.txt" )                        ', FileStr( "strfile.txt" ), "XXXXXXXXXXAAAAAABC" )
   Check( 'FErase( "strfile.txt" )                         ', FErase( "strfile.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
