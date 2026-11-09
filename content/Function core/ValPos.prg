/*
 * $DOC$
 * $NAME$
 * ValPos()
 *
 * $ONELINER$
 * Return the numeric value of a digit at a specified position in a string
 *
 * $SYNTAX$
 * ValPos( cString, [nPos] ) --> nValue
 *
 * $ARGUMENTS$
 * cString
 * nPos
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
 * ValPos( "AX4B", 3 ) OK
 * ValPos( "2024" )    OK
 * ValPos( "AX4B", 1 ) OK
 * ValPos( "AX4B", 9 ) OK
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

   Check( 'ValPos( "AX4B", 3 ) ', ValPos( "AX4B", 3 ), 4 )
   Check( 'ValPos( "2024" )    ', ValPos( "2024" ), 4 )
   Check( 'ValPos( "AX4B", 1 ) ', ValPos( "AX4B", 1 ), 0 )
   Check( 'ValPos( "AX4B", 9 ) ', ValPos( "AX4B", 9 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
