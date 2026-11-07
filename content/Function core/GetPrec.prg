/*
 * $DOC$
 * $NAME$
 * GetPrec()
 *
 * $ONELINER$
 * Return the computing precision for trigonometric functions
 *
 * $SYNTAX$
 * GetPrec( ) --> nDecimalPlaces
 *
 * $ARGUMENTS$
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

   Check( 'GetPrec()     ', GetPrec(), 16 )
   Check( 'SetPrec( 10 ) ', SetPrec( 10 ), "" )
   Check( 'GetPrec()     ', GetPrec(), 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
