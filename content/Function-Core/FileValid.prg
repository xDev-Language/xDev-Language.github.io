/*
 * $DOC$
 * $NAME$
 * FileValid()
 *
 * $ONELINER$
 * Test if a string contains a valid file name
 *
 * $SYNTAX$
 * FileValid( cFileName, [nMaxName], [nMaxExtension], [lNoExtension], [lSpaces] ) --> lIsValid
 *
 * $ARGUMENTS$
 * cFileName
 * nMaxName
 * nMaxExtension
 * lNoExtension
 * lSpaces
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
 * FileValid( "letter.txt" )               OK
 * FileValid( "my letter.txt" )            OK
 * FileValid( "my letter.txt", , , , .F. ) OK
 * FileValid( "readme.txt", 8, 3 )         OK
 * FileValid( "longername.txt", 8, 3 )     OK
 * FileValid( "readme.txt", , , .T. )      OK
 * FileValid( "dir/file.txt" )             OK
 * FileValid( ".." )                       OK
 * FileValid( "" )                         OK
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

   Check( 'FileValid( "letter.txt" )               ', FileValid( "letter.txt" ), .T. )
   Check( 'FileValid( "my letter.txt" )            ', FileValid( "my letter.txt" ), .T. )
   Check( 'FileValid( "my letter.txt", , , , .F. ) ', FileValid( "my letter.txt", , , , .F. ), .F. )
   Check( 'FileValid( "readme.txt", 8, 3 )         ', FileValid( "readme.txt", 8, 3 ), .T. )
   Check( 'FileValid( "longername.txt", 8, 3 )     ', FileValid( "longername.txt", 8, 3 ), .F. )
   Check( 'FileValid( "readme.txt", , , .T. )      ', FileValid( "readme.txt", , , .T. ), .F. )
   Check( 'FileValid( "dir/file.txt" )             ', FileValid( "dir/file.txt" ), .F. )
   Check( 'FileValid( ".." )                       ', FileValid( ".." ), .F. )
   Check( 'FileValid( "" )                         ', FileValid( "" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
