/*
 * $DOC$
 * $NAME$
 * Pi()
 *
 * $ONELINER$
 * Return the mathematical constant pi
 *
 * $SYNTAX$
 * Pi( ) --> nPi
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

   LOCAL nRadius := 2

   Check( 'Round( Pi(), 6 )               ', Round( Pi(), 6 ), 3.141593 )
   Check( 'Round( Pi() * nRadius ^ 2, 6 ) ', Round( Pi() * nRadius ^ 2, 6 ), 12.566371 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
