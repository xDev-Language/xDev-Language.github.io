/*
 * $DOC$
 * $NAME$
 * TimeValid()
 *
 * $ONELINER$
 * Check if a character string is a valid time string
 *
 * $SYNTAX$
 * TimeValid( cTime ) --> lIsTimeString
 *
 * $ARGUMENTS$
 * cTime
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
 * TimeValid( "12:59:59:99" )  OK
 * TimeValid( "12" )           OK
 * TimeValid( Trim( cBegin ) ) OK
 * TimeValid( cBegin )         OK
 * TimeValid( "24" )           OK
 * TimeValid( "12:60" )        OK
 * TimeValid( "12:1" )         OK
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

   LOCAL cBegin := "12:30      "

   Check( 'TimeValid( "12:59:59:99" )  ', TimeValid( "12:59:59:99" ), .T. )
   Check( 'TimeValid( "12" )           ', TimeValid( "12" ), .T. )
   Check( 'TimeValid( Trim( cBegin ) ) ', TimeValid( Trim( cBegin ) ), .T. )
   Check( 'TimeValid( cBegin )         ', TimeValid( cBegin ), .F. )
   Check( 'TimeValid( "24" )           ', TimeValid( "24" ), .F. )
   Check( 'TimeValid( "12:60" )        ', TimeValid( "12:60" ), .F. )
   Check( 'TimeValid( "12:1" )         ', TimeValid( "12:1" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
