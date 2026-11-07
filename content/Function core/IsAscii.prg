/*
 * $DOC$
 * $NAME$
 * IsAscii()
 *
 * $ONELINER$
 * Check if the first character of a string is a 7-bit ASCII character
 *
 * $SYNTAX$
 * IsAscii( cString ) --> lIs7BitChar
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

   Check( 'IsAscii( "xDev" )   ', IsAscii( "xDev" ), .T. )
   Check( 'IsAscii( " xDev" )  ', IsAscii( " xDev" ), .T. )
   Check( 'IsAscii( "Łódź" )   ', IsAscii( "Łódź" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
