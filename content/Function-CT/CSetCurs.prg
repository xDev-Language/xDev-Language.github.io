/*
 * $DOC$
 * $NAME$
 * CSetCurs()
 *
 * $ONELINER$
 * Query or change whether the cursor is visible
 *
 * $SYNTAX$
 * CSetCurs( [lNewMode] ) --> lOldMode
 *
 * $ARGUMENTS$
 * `lNewMode` .T. shows the cursor with the normal shape, .F. hides it. Without the argument the
 * cursor does not change.
 *
 * $RETURNS$
 * .T. when the cursor was visible before the call, .F. when it was hidden.
 *
 * $DESCRIPTION$
 * CSetCurs() is the logical form of SetCursor(): any visible shape counts as .T.
 *
 * $NOTES$
 * CSetCurs() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * CSetCurs() with a visible cursor OK
 * CSetCurs( .F. ) gives .T.        OK
 * the cursor is hidden             OK
 * CSetCurs( .T. ) gives .F.        OK
 * the cursor has the normal shape  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetCursor(), SaveCursor(), RestCursor()
 *
 * $DOCEND$
 */

#include "setcurs.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   Scroll()
   SetPos( 0, 0 )
   SetCursor( SC_INSERT )

   Check( 'CSetCurs() with a visible cursor ', CSetCurs(), .T. )
   Check( 'CSetCurs( .F. ) gives .T.        ', CSetCurs( .F. ), .T. )
   Check( 'the cursor is hidden             ', SetCursor(), SC_NONE )
   Check( 'CSetCurs( .T. ) gives .F.        ', CSetCurs( .T. ), .F. )
   Check( 'the cursor has the normal shape  ', SetCursor(), SC_NORMAL )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
