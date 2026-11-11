/*
 * $DOC$
 * $NAME$
 * FileDate()
 *
 * $ONELINER$
 * Return the date of a file
 *
 * $SYNTAX$
 * FileDate( cFileName ) --> dDate
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
 * FileDate( "filedate.txt" ) == Date()           OK
 * SetFDaTi( "filedate.txt", SToD( "20240115" ) ) OK
 * DToS( FileDate( "filedate.txt" ) )             OK
 * Empty( FileDate( "no-such-file.txt" ) )        OK
 * FErase( "filedate.txt" )                       OK
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

   LOCAL lText := MemoWrit( "filedate.txt", "xDev", .F. )

   Check( 'FileDate( "filedate.txt" ) == Date()           ', FileDate( "filedate.txt" ) == Date(), .T. )
   Check( 'SetFDaTi( "filedate.txt", SToD( "20240115" ) ) ', SetFDaTi( "filedate.txt", SToD( "20240115" ) ), .T. )
   Check( 'DToS( FileDate( "filedate.txt" ) )             ', DToS( FileDate( "filedate.txt" ) ), "20240115" )
   Check( 'Empty( FileDate( "no-such-file.txt" ) )        ', Empty( FileDate( "no-such-file.txt" ) ), .T. )
   Check( 'FErase( "filedate.txt" )                       ', FErase( "filedate.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
