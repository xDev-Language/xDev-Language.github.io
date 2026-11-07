/*
 * $DOC$
 * $NAME$
 * GetClearA()
 *
 * $ONELINER$
 * Return the default color attribute for clearing the screen
 *
 * $SYNTAX$
 * GetClearA( ) --> nClearAttribute
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

   Check( 'GetClearA()                    ', GetClearA(), 7 )
   Check( 'NToColor( GetClearA(), .T. )   ', NToColor( GetClearA(), .T. ), "W/N" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
