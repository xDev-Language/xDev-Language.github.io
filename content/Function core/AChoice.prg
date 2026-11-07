/*
 * $DOC$
 * $NAME$
 * AChoice()
 *
 * $ONELINER$
 * Execute a pop-up menu
 *
 * $SYNTAX$
 * AChoice( nTop, nLeft, nBottom, nRight, acMenuItems, [alSelectableItems | lSelectableItems], [bUserBlock], [nInitialItem], [nWindowRow] ) --> nPosition
 *
 * $ARGUMENTS$
 * nTop
 * nLeft
 * nBottom
 * nRight
 * acMenuItems
 * alSelectableItems
 * lSelectableItems
 * bUserBlock
 * nInitialItem
 * nWindowRow
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

#include "std.ch"
#include "inkey.ch"
#include "achoice.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL aMenu      := { "New", "Open", "-------", "Save", "Exit" }
   LOCAL aAvailable := { .T., .T., .F., .T., .T. }
   LOCAL nChoice

   SetColor( "W+/B,N/W,,,W/B" )

   // the user presses Down twice and Enter; the line "-------" is skipped
   KEYBOARD Chr( K_DOWN ) + Chr( K_DOWN ) + Chr( K_ENTER )
   Check( 'Down, Down, Enter        ', AChoice( 2, 40, 6, 50, aMenu, aAvailable ), 4 )

   // the first letter jumps to the item
   KEYBOARD "s" + Chr( K_ENTER )
   Check( 'S, Enter                 ', AChoice( 2, 40, 6, 50, aMenu, aAvailable ), 4 )

   KEYBOARD Chr( K_END ) + Chr( K_ENTER )
   Check( 'End, Enter               ', AChoice( 2, 40, 6, 50, aMenu, aAvailable ), 5 )

   KEYBOARD Chr( K_ESC )
   Check( 'Esc                      ', AChoice( 2, 40, 6, 50, aMenu, aAvailable ), 0 )

   // a code block decides whether an item is available
   aAvailable[ 2 ] := {|| File( "data.txt" ) }
   KEYBOARD Chr( K_DOWN ) + Chr( K_ENTER )
   Check( 'Down, Enter, no data.txt ', AChoice( 2, 40, 6, 50, aMenu, aAvailable ), 4 )

   // a user block handles the keys AChoice() leaves to it
   KEYBOARD Chr( K_DOWN ) + Chr( K_ENTER )
   nChoice := AChoice( 2, 40, 6, 50, aMenu, .T., {| nMode | s_MenuKeys( nMode ) } )
   Check( 'Down, Enter, user block  ', nChoice, 2 )

   // now it is your turn
   nChoice := AChoice( 2, 40, 6, 50, aMenu, { .T., .T., .F., .T., .T. } )
   QOut( "You chose " + IIF( nChoice == 0, "nothing", aMenu[ nChoice ] ) )

   Inkey( 0 )

RETURN

STATIC FUNCTION s_MenuKeys( nMode )

   IF nMode == AC_EXCEPT
      DO CASE
      CASE LastKey() == K_ENTER
         RETURN AC_SELECT
      CASE LastKey() == K_ESC
         RETURN AC_ABORT
      ENDCASE
   ENDIF

RETURN AC_CONT

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
