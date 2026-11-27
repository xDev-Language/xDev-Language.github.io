/*
 * $DOC$
 * $NAME$
 * GTI_MSGBOX
 *
 * $ONELINER$
 * Show a system message box
 *
 * $SYNTAX$
 * GtInfo( GTI_MSGBOX, cText | aMessage, [aButtons] ) --> nButton
 * GtInfo( GTI_MSGBOX, [lAlert] ) --> lAlert
 *
 * $ARGUMENTS$
 * `GTI_MSGBOX` The selector, from gtinfo.ch.
 * `cText` The message.
 * `aMessage` { cTitle, cText, cInfo, cDetail, aButtons } for a message with more parts.
 * `aButtons` The texts of the buttons. Without them the box has an OK button.
 * `lAlert` .T. makes Alert() use the system message box.
 *
 * $RETURNS$
 * The number of the chosen button, or 0. With lAlert or without an argument the Alert() setting
 * before the call.
 *
 * $DESCRIPTION$
 * The message box of the system appears over the window and waits for the user.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Ask for a decision about a draft and default to keeping it if the dialog is dismissed or unavailable.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * Alert()
 *
 * $DOCEND$
 */

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL aButtons := { "Keep editing", "Discard draft" }
   LOCAL aMessage := { "Close draft", "The draft has unsaved changes.", ;
                       "Choose what to do with the draft.", "", aButtons }
   LOCAL nButton := GtInfo( GTI_MSGBOX, aMessage )

   IF nButton == 2
      OutStd( "Discard selected.", Eol() )
   ELSE
      OutStd( "Draft kept.", Eol() )
   ENDIF

RETURN
