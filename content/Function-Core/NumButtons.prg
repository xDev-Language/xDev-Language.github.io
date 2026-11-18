/*
 * $DOC$
 * $NAME$
 * NumButtons()
 *
 * $ONELINER$
 * Return the number of mouse buttons
 *
 * $SYNTAX$
 * NumButtons( ) --> nButtonCount
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The number of buttons the GT reports, 0 without a mouse.
 *
 * $DESCRIPTION$
 * NumButtons() asks the GT, for example before the program offers an action on the right
 * button.
 *
 * $NOTES$
 * NumButtons() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NumButtons() is a number         OK
 * NumButtons() is not negative     OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * MPresent(), MRow(), MCol()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nButtons := NumButtons()

   Check( 'NumButtons() is a number         ', ValType( nButtons ), "N" )
   Check( 'NumButtons() is not negative     ', nButtons >= 0, .T. )

   QOut( "" )
   QOut( "The mouse has " + LTrim( Str( nButtons ) ) + " buttons" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
