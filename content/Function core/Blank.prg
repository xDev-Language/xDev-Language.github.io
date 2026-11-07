/*
 * $DOC$
 * $NAME$
 * Blank()
 *
 * $ONELINER$
 * Return an empty value for the data types A, C, D, L, M and N
 *
 * $SYNTAX$
 * Blank( xValue, [lSpaces] ) --> xEmptyValue
 *
 * $ARGUMENTS$
 * xValue
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

   LOCAL cName   := "Anna"
   LOCAL aList   := { 1, 2, 3 }
   LOCAL hPerson := { "name" => "Anna" }

   Check( 'Blank( 99 )                 ', Blank( 99 ), 0 )
   Check( 'Blank( .T. )                ', Blank( .T. ), .F. )
   Check( 'Blank( "abc" )              ', Blank( "abc" ), "" )
   Check( 'Blank( "abc", .T. )         ', Blank( "abc", .T. ), "   " )
   Check( 'Empty( Blank( Date() ) )    ', Empty( Blank( Date() ) ), .T. )
   Check( 'Blank( @cName )             ', Blank( @cName ), "" )
   Check( 'cName                       ', cName, "" )
   Check( 'Len( Blank( aList ) )       ', Len( Blank( aList ) ), 0 )
   Check( 'Len( aList )                ', Len( aList ), 3 )
   Check( 'ValType( Blank( hPerson ) ) ', ValType( Blank( hPerson ) ), "H" )
   Check( 'Len( Blank( hPerson ) )     ', Len( Blank( hPerson ) ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
