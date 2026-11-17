/*
 * $DOC$
 * $NAME$
 * GTWVT
 *
 * $ONELINER$
 * Windows terminal driver for xDev
 *
 * $SYNTAX$
 * REQUEST GTWVT
 *
 * $ARGUMENTS$
 * None. `REQUEST GTWVT` includes the driver at link time.
 *
 * $RETURNS$
 * No runtime value.
 *
 * $DESCRIPTION$
 * GTWVT is the xDev terminal window driver for Windows. It provides a UTF-8
 * text screen in its own resizable window. DispOutAt(), Inkey(), SetColor(),
 * DispBox() and the other terminal functions use the driver.
 *
 * The window supports resizing, maximization, full screen with Alt+Enter and
 * monitor scaling. The program can select font name, size, weight and quality.
 * GTWVT also provides mouse input, clipboard text, a blinking cursor, window
 * title and icon, message boxes and file dialogs. Settings are queried through
 * GtInfo( GTI_* ); see Functions GT for the complete reference.
 * All GTWVT control and query functions are documented in the Functions GT
 * category.
 *
 * Build with `make` and install with `make install`. GTWVT supports Windows
 * only; Linux and macOS are not supported by this driver.
 *
 * $NOTES$
 * Put REQUEST GTWVT in the source file containing Main(). The driver is chosen
 * by the linker and does not require a runtime initialization call.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * GT: WVT
 *
 * $CATEGORY$
 * User libraries GTWVT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Functions GT, GTI_FONTNAME, GTI_FONTSIZE, GTI_VERSION
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

REQUEST GTWVT

PROCEDURE Main()

   QOut( "GT: " + GtInfo( GTI_VERSION ) )

RETURN
