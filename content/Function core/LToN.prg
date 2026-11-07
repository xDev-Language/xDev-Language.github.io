/*
 * $DOC$
 * $NAME$
 * LToN()
 *
 * $ONELINER$
 * Convert a logical value to a numeric value
 *
 * $SYNTAX$
 * LToN( [lLogic] ) --> nLogic
 *
 * $ARGUMENTS$
 * lLogic
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

   LOCAL lLeapYear := .T.

   Check( 'LToN()                  ', LToN(), 0 )
   Check( 'LToN( .F. )             ', LToN( .F. ), 0 )
   Check( 'LToN( .T. )             ', LToN( .T. ), 1 )
   Check( '365 + LToN( lLeapYear ) ', 365 + LToN( lLeapYear ), 366 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
