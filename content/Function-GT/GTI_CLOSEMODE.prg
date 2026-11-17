/*
 * $DOC$
 * $NAME$
 * GTI_CLOSEMODE
 *
 * $ONELINER$
 * Query or change what the close button does
 *
 * $SYNTAX$
 * GtInfo( GTI_CLOSEMODE, [nMode] ) --> nMode
 *
 * $ARGUMENTS$
 * `GTI_CLOSEMODE` The selector, from gtinfo.ch.
 * `nMode` 0, 1 or 2.
 *
 * $RETURNS$
 * The mode before the call.
 *
 * $DESCRIPTION$
 * The modes:
 *
 * | nMode | The close button |
 * |---|---|
 * | 0 | ends the program |
 * | 1 | sends K_CLOSE to Inkey() |
 * | 2 | is disabled |
 *
 * With mode 1 the program can ask whether to save its data before it ends.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
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
 * GTI_CLOSABLE, Inkey()
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

PROCEDURE Main()

   QOut( "Previous close mode: " + LTrim( Str( GtInfo( GTI_CLOSEMODE ) ) ) )

RETURN
