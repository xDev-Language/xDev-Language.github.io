/*
 * $DOC$
 * $NAME$
 * Floor()
 *
 * $ONELINER$
 * Round a number toward negative infinity
 *
 * $SYNTAX$
 * Floor( nValue ) --> nInteger
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

   Check( 'Floor( 1.9 )  ', Floor( 1.9 ), 1 )
   Check( 'Floor( 1.1 )  ', Floor( 1.1 ), 1 )
   Check( 'Floor( 0.9 )  ', Floor( 0.9 ), 0 )
   Check( 'Floor( -0.1 ) ', Floor( -0.1 ), -1 )
   Check( 'Floor( -0.9 ) ', Floor( -0.9 ), -1 )
   Check( 'Floor( -1.1 ) ', Floor( -1.1 ), -2 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
