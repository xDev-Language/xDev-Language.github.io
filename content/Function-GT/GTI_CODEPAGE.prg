/*
 * $DOC$
 * $NAME$
 * GTI_CODEPAGE
 *
 * $ONELINER$
 * Query or change the code page of the terminal
 *
 * $SYNTAX$
 * GtInfo( GTI_CODEPAGE, [cCodepage | nCodepage] ) --> cCodepage
 *
 * $ARGUMENTS$
 * `GTI_CODEPAGE` The selector, from gtinfo.ch.
 * `cCodepage` The name of a code page, for example "UTF8" or "PL852".
 * `nCodepage` The number of a code page.
 *
 * $RETURNS$
 * The name of the code page before the call, or NIL when the new code page is unknown.
 *
 * $DESCRIPTION$
 * The code page tells how the terminal converts characters between the program and the screen and
 * keyboard.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver. It also works before a GT is
 * started.
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
 * CdpTerm(), CdpList()
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

PROCEDURE Main()

   QOut( "Code page: " + GtInfo( GTI_CODEPAGE ) )

RETURN
