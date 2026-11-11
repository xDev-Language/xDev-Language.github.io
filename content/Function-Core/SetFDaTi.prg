/*
 * $DOC$
 * $NAME$
 * SetFDaTi()
 *
 * $ONELINER$
 * Set the last change date and time of a file
 *
 * $SYNTAX$
 * SetFDaTi( cFileName, [dFileDate], [cFileTime] ) --> lSuccess
 *
 * $ARGUMENTS$
 * cFileName
 * dFileDate
 * cFileTime
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
 * SetFDaTi( "setfdati.txt", SToD( "19910101" ), "01:10:00" ) OK
 * DToS( FileDate( "setfdati.txt" ) )                         OK
 * FileTime( "setfdati.txt" )                                 OK
 * SetFDaTi( "setfdati.txt" )                                 OK
 * FileDate( "setfdati.txt" ) == Date()                       OK
 * SetFDaTi( "no-such-file.txt" )                             OK
 * FErase( "setfdati.txt" )                                   OK
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

   LOCAL lText := MemoWrit( "setfdati.txt", "xDev", .F. )

   Check( 'SetFDaTi( "setfdati.txt", SToD( "19910101" ), "01:10:00" ) ', SetFDaTi( "setfdati.txt", SToD( "19910101" ), "01:10:00" ), .T. )
   Check( 'DToS( FileDate( "setfdati.txt" ) )                         ', DToS( FileDate( "setfdati.txt" ) ), "19910101" )
   Check( 'FileTime( "setfdati.txt" )                                 ', FileTime( "setfdati.txt" ), "01:10:00" )
   Check( 'SetFDaTi( "setfdati.txt" )                                 ', SetFDaTi( "setfdati.txt" ), .T. )
   Check( 'FileDate( "setfdati.txt" ) == Date()                       ', FileDate( "setfdati.txt" ) == Date(), .T. )
   Check( 'SetFDaTi( "no-such-file.txt" )                             ', SetFDaTi( "no-such-file.txt" ), .F. )
   Check( 'FErase( "setfdati.txt" )                                   ', FErase( "setfdati.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
