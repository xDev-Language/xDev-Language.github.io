/*
 * $DOC$
 * $NAME$
 * GTI_CARGO
 *
 * $ONELINER$
 * Store a value of the program in the terminal
 *
 * $SYNTAX$
 * GtInfo( GTI_CARGO, [xValue] ) --> xPrevious
 *
 * $ARGUMENTS$
 * `GTI_CARGO` The selector, from gtinfo.ch.
 * `xValue` Any value.
 *
 * $RETURNS$
 * The value stored before the call, NIL at the start.
 *
 * $DESCRIPTION$
 * The terminal only keeps the value. The program can use it for its own data about the terminal.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
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
 * GtInfo()
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

PROCEDURE Main()

   QOut( "Previous cargo: " + ValType( GtInfo( GTI_CARGO, "demo" ) ) )
   QOut( "Stored cargo: " + GtInfo( GTI_CARGO ) )

RETURN
