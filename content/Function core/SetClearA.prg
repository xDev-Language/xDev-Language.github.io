/*
 * $DOC$
 * $NAME$
 * SetClearA()
 *
 * $ONELINER$
 * Set the default color attribute for clearing the screen
 *
 * $SYNTAX$
 * SetClearA( [xColor] ) --> cNull
 *
 * $ARGUMENTS$
 * xColor
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

   SetClearA( "W+/B" )
   Check( 'GetClearA() after SetClearA( "W+/B" ) ', GetClearA(), 31 )

   SetClearA()
   Check( 'GetClearA() after SetClearA()         ', GetClearA(), 7 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
