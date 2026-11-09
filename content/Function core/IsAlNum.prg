/*
 * $DOC$
 * $NAME$
 * IsAlNum()
 *
 * $ONELINER$
 * Check if the first character of a string is alpha-numeric
 *
 * $SYNTAX$
 * IsAlNum( cString ) --> lIsAlphaNumeric
 *
 * $ARGUMENTS$
 * cString
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
 * IsAlNum( "ABC" )   OK
 * IsAlNum( "123" )   OK
 * IsAlNum( " xDev" ) OK
 * IsAlNum( ".Net" )  OK
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

   Check( 'IsAlNum( "ABC" )   ', IsAlNum( "ABC" ), .T. )
   Check( 'IsAlNum( "123" )   ', IsAlNum( "123" ), .T. )
   Check( 'IsAlNum( " xDev" ) ', IsAlNum( " xDev" ), .F. )
   Check( 'IsAlNum( ".Net" )  ', IsAlNum( ".Net" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
