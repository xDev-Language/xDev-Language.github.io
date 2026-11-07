/*
 * $DOC$
 * $NAME$
 * GetClearB()
 *
 * $ONELINER$
 * Return the default character for clearing the screen
 *
 * $SYNTAX$
 * GetClearB( ) --> nClearCharacter
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

   Check( 'GetClearB()        ', GetClearB(), 32 )
   Check( 'Chr( GetClearB() ) ', Chr( GetClearB() ), " " )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
