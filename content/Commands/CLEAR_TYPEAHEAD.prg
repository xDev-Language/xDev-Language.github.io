/*
 * $DOC$
 * $NAME$
 * CLEAR TYPEAHEAD
 *
 * $ONELINER$
 * CLEAR TYPEAHEAD Empty the keyboard buffer
 *
 * $SYNTAX$
 * CLEAR TYPEAHEAD
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

   KEYBOARD "stale input"

   CLEAR TYPEAHEAD

   WAIT "The stale keystrokes were discarded; press a key to continue"

   RETURN
