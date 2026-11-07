/*
 * $DOC$
 * $NAME$
 * ACCEPT
 *
 * $ONELINER$
 * ACCEPT Place keyboard input into a memory variable
 *
 * $SYNTAX$
 * ACCEPT [expPrompt] TO idVar
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
 * Commands
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   LOCAL cCode := Space( 12 )

   ACCEPT "Enter the shipment tracking code: " TO cCode

   IF Empty( AllTrim( cCode ) )
      ? "No shipment was selected."
   ELSE
      ? "Tracking code queued:", AllTrim( cCode )
   ENDIF

   RETURN
