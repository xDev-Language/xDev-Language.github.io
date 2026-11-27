/*
 * $DOC$
 * $NAME$
 * GTXWC
 *
 * $ONELINER$
 * X11 terminal driver for xDev
 *
 * $SYNTAX$
 * REQUEST GTXWC
 *
 * $ARGUMENTS$
 * None. `REQUEST GTXWC` includes the driver at link time.
 *
 * $RETURNS$
 * No runtime value.
 *
 * $DESCRIPTION$
 * GTXWC is the xDev terminal window driver for Linux, built directly on Xlib.
 * It provides a UTF-8 text screen in an X11 window. DispOutAt(), Inkey(),
 * SetColor(), DispBox() and the other terminal functions use the driver.
 *
 * The driver supports Linux X11 and Wayland through XWayland, resizing,
 * maximization, full screen, screen scaling, keyboard and mouse input,
 * clipboard text, a blinking cursor, window title and icon, images, sound,
 * message boxes and file dialogs. It uses the X11 Unicode fixed 9x18 font from
 * the xfonts-base package. Settings are documented under Functions GT.
 * All GTXWC control and query functions are documented in the Functions GT
 * category.
 *
 * Build with `make` and install with `make install`. Xlib comes from
 * `pkg-config x11` and `libx11-dev`. File dialogs use zenity, sound uses
 * paplay or aplay, links use xdg-open and theme information uses gdbus when
 * those programs are installed. Windows and macOS are not supported.
 *
 * $NOTES$
 * Put REQUEST GTXWC in the source file containing Main(). The driver is linked
 * into the program and is not opened by a runtime function.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * GT: XWC
 *
 * $CATEGORY$
 * User libraries GTXWC
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Functions GT, GTI_VERSION, GTI_FILEDIALOG, GTI_FONTSEL
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

REQUEST GTXWC

PROCEDURE Main()

   QOut( "GT: " + GtInfo( GTI_VERSION ) )

RETURN
