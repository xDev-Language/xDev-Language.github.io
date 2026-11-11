/*
 * $DOC$
 * $NAME$
 * Asc()
 *
 * $ONELINER$
 * Convert a character to its ASCII value
 *
 * $SYNTAX$
 * Asc( cExp ) --> nCode
 *
 * $ARGUMENTS$
 * cExp
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
 * Asc( "A" )             OK
 * Asc( "xDev" )          OK
 * Chr( Asc( "A" ) + 1 )  OK
 * Asc( "ż" )             OK
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

   Check( 'Asc( "A" )             ', Asc( "A" ), 65 )
   Check( 'Asc( "xDev" )          ', Asc( "xDev" ), 120 )
   Check( 'Chr( Asc( "A" ) + 1 )  ', Chr( Asc( "A" ) + 1 ), "B" )
   Check( 'Asc( "ż" )             ', Asc( "ż" ), 197 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
