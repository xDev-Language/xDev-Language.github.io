/*
 * $DOC$
 * $NAME$
 * Ceiling()
 *
 * $ONELINER$
 * Round a number toward positive infinity
 *
 * $SYNTAX$
 * Ceiling( nValue ) --> nInteger
 *
 * $ARGUMENTS$
 * nValue
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
 * Ceiling( 1.9 )  OK
 * Ceiling( 1.1 )  OK
 * Ceiling( 0.9 )  OK
 * Ceiling( -0.1 ) OK
 * Ceiling( -0.9 ) OK
 * Ceiling( -1.1 ) OK
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

   Check( 'Ceiling( 1.9 )  ', Ceiling( 1.9 ), 2 )
   Check( 'Ceiling( 1.1 )  ', Ceiling( 1.1 ), 2 )
   Check( 'Ceiling( 0.9 )  ', Ceiling( 0.9 ), 1 )
   Check( 'Ceiling( -0.1 ) ', Ceiling( -0.1 ), 0 )
   Check( 'Ceiling( -0.9 ) ', Ceiling( -0.9 ), 0 )
   Check( 'Ceiling( -1.1 ) ', Ceiling( -1.1 ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
