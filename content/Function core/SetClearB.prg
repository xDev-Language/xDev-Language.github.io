/*
 * $DOC$
 * $NAME$
 * SetClearB()
 *
 * $ONELINER$
 * Set the default character attribute for clearing the screen
 *
 * $SYNTAX$
 * SetClearB( [xChar] ) --> cNull
 *
 * $ARGUMENTS$
 * xChar
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

   SetClearB( "." )
   Check( 'GetClearB() after SetClearB( "." ) ', GetClearB(), Asc( "." ) )

   SetClearB()
   Check( 'GetClearB() after SetClearB()      ', GetClearB(), 32 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
