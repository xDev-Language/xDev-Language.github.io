/*
 * $DOC$
 * $NAME$
 * SetPrec()
 *
 * $ONELINER$
 * Specify the computing precision for trigonometric functions
 *
 * $SYNTAX$
 * SetPrec( nDecimalPlaces ) --> cNullString
 *
 * $ARGUMENTS$
 * nDecimalPlaces
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
 * SetPrec( 10 ) OK
 * GetPrec()     OK
 * SetPrec( 99 ) OK
 * GetPrec()     OK
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

   Check( 'SetPrec( 10 ) ', SetPrec( 10 ), "" )
   Check( 'GetPrec()     ', GetPrec(), 10 )
   Check( 'SetPrec( 99 ) ', SetPrec( 99 ), "" )
   Check( 'GetPrec()     ', GetPrec(), 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
