/*
 * $DOC$
 * $NAME$
 * GTSDL3
 *
 * $ONELINER$
 * SDL3 terminal driver for xDev
 *
 * $SYNTAX$
 * REQUEST GTSDL3
 *
 * $ARGUMENTS$
 * None. `REQUEST GTSDL3` includes the driver at link time.
 *
 * $RETURNS$
 * No runtime value.
 *
 * $DESCRIPTION$
 * GTSDL3 is the xDev terminal window driver built on SDL3. It provides a UTF-8
 * text screen in a resizable window for Windows, Linux X11 and Linux Wayland.
 * Standard functions such as DispOutAt(), Inkey(), SetColor() and DispBox()
 * use the driver.
 *
 * The driver supports resizing, maximization, Alt+Enter full screen, DPI
 * scaling, keyboard and mouse input, clipboard text, a blinking cursor, window
 * title and icon, images, sound, message boxes and file dialogs. It includes a
 * 9x18 bitmap font, so no font file is needed. Settings and queries use
 * GtInfo( GTI_* ); see Functions GT for their reference pages.
 * All GTSDL3 control and query functions are documented in the Functions GT
 * category.
 *
 * Build with `make` and install with `make install`. SDL3 is supplied by the
 * system through `pkg-config sdl3`. macOS is not supported.
 *
 * $NOTES$
 * The request belongs in the source file containing Main(). The driver is
 * selected by the linker; it is not opened by a runtime function.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * GT: SDL3
 *
 * $CATEGORY$
 * User libraries GTSDL3
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Functions GT, GTI_VERSION, GTI_SCREENWIDTH, GTI_FILEDIALOG
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

REQUEST GTSDL3

PROCEDURE Main()

   QOut( "GT: " + GtInfo( GTI_VERSION ) )

RETURN
