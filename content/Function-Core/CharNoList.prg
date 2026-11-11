/*
 * $DOC$
 * $NAME$
 * CharNoList()
 *
 * $ONELINER$
 * Return a string of all characters not included in a string
 *
 * $SYNTAX$
 * CharNoList( [cString] ) --> cNotInString
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
 * CharRem( CharNoList( "XYZ" ), cString ) OK
 * Len( CharNoList() )                     OK
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

   LOCAL cString := "ABXCDYEF"

   Check( 'CharRem( CharNoList( "XYZ" ), cString ) ', CharRem( CharNoList( "XYZ" ), cString ), "XY" )
   Check( 'Len( CharNoList() )                     ', Len( CharNoList() ), 256 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
