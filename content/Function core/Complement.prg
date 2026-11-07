/*
 * $DOC$
 * $NAME$
 * Complement()
 *
 * $ONELINER$
 * Create the complement of a value of type C, D, L, M or N
 *
 * $SYNTAX$
 * Complement( xValue ) --> xComplement
 *
 * $ARGUMENTS$
 * xValue
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

   LOCAL dToday := Date()

   Check( 'Complement( .T. )                            ', Complement( .T. ), .F. )
   Check( 'Complement( .F. )                            ', Complement( .F. ), .T. )
   Check( 'Complement( 99 )                             ', Complement( 99 ), -99 )
   Check( 'Complement( -9.9 )                           ', Complement( -9.9 ), 9.9 )
   Check( 'Asc( Complement( "A" ) )                     ', Asc( Complement( "A" ) ), 190 )
   Check( 'Complement( Complement( "xDev" ) )           ', Complement( Complement( "xDev" ) ), "xDev" )
   Check( 'DToS( Complement( SToD( "19000101" ) ) )     ', DToS( Complement( SToD( "19000101" ) ) ), "10991231" )
   Check( 'DToS( Complement( SToD( "" ) ) )             ', DToS( Complement( SToD( "" ) ) ), "30000101" )
   Check( 'Empty( Complement( SToD( "30000101" ) ) )    ', Empty( Complement( SToD( "30000101" ) ) ), .T. )
   Check( 'Complement( Complement( dToday ) ) == dToday ', Complement( Complement( dToday ) ) == dToday, .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
