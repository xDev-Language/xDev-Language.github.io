/*
 * $DOC$
 * $NAME$
 * LToC()
 *
 * $ONELINER$
 * Convert a logical value to a character
 *
 * $SYNTAX$
 * LToC( [lLogic] ) --> cChar
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

   Check( 'LToC()      ', LToC(), "F" )
   Check( 'LToC( .F. ) ', LToC( .F. ), "F" )
   Check( 'LToC( .T. ) ', LToC( .T. ), "T" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
