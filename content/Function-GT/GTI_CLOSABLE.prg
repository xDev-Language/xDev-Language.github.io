/*
 * $DOC$
 * $NAME$
 * GTI_CLOSABLE
 *
 * $ONELINER$
 * Query or change whether the close button ends the program
 *
 * $SYNTAX$
 * GtInfo( GTI_CLOSABLE, [lClosable] ) --> lClosable
 *
 * $ARGUMENTS$
 * `GTI_CLOSABLE` The selector, from gtinfo.ch.
 * `lClosable` .T. lets the close button end the program.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * With .F. the close button sends K_CLOSE to Inkey(), and the program decides what to do.
 * GTI_CLOSEMODE gives the same choice and a third one.
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
 * GTI_CLOSEMODE
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

PROCEDURE Main()

   QOut( "Previous closable: " + IIF( GtInfo( GTI_CLOSABLE ), "YES", "NO" ) )

RETURN
