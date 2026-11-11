/*
 * $DOC$
 * $NAME$
 * WSetMove()
 *
 * $ONELINER$
 * Allow or forbid moving windows interactively
 *
 * $SYNTAX$
 * WSetMove( [lMove] ) --> lPreviousMove
 *
 * $ARGUMENTS$
 * `lMove` .T. allows the user to move the selected window, .F. forbids it. Without the argument
 * the setting does not change.
 *
 * $RETURNS$
 * The previous setting. At the start it is .T.
 *
 * $DESCRIPTION$
 * In CA-Clipper Tools the user moves the selected window with the cursor keys while Scroll Lock
 * is on. WSetMove() does not change WMove(), which always moves the window.
 *
 * $NOTES$
 * xDev keeps the setting, but the interactive moving is not available yet: the GT drivers do
 * not report the Scroll Lock state.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * WStep(), WMove(), WMode()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'WSetMove()                     ', WSetMove(), .T. )
   Check( 'WSetMove( .F. )                ', WSetMove( .F. ), .T. )
   Check( 'WSetMove() after .F.           ', WSetMove(), .F. )
   Check( 'WSetMove( .T. )                ', WSetMove( .T. ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
