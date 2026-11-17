/*
 * $DOC$
 * $NAME$
 * GTGLFW
 *
 * $ONELINER$
 * GLFW and OpenGL terminal driver for xDev
 *
 * $SYNTAX$
 * REQUEST GTGLFW
 *
 * $ARGUMENTS$
 * None. `REQUEST GTGLFW` asks the linker to include the driver.
 *
 * $RETURNS$
 * The request has no runtime return value. It makes the GT driver available to the program.
 *
 * $DESCRIPTION$
 * GTGLFW is a terminal window driver for Windows and Linux. It uses GLFW and
 * OpenGL to provide an xDev text screen in its own resizable window. Standard
 * screen functions such as DispOutAt(), Inkey(), SetColor() and DispBox()
 * work through the driver.
 *
 * The driver displays UTF-8 text, accepts keyboard input, supports the
 * clipboard, resizing, maximization, DPI scaling, full screen with Alt+Enter,
 * a blinking cursor, mouse input, window titles and icons. It also provides
 * images, message boxes and file dialogs through GtInfo( GTI_* ).
 *
 * GTGLFW includes the built-in 9x18 bitmap font, so a separate font file is
 * not required. The terminal settings and queries are documented in the
 * `Functions GT` category. Use the GTI_* entries there for window, font,
 * clipboard, input and dialog settings.
 * All GTGLFW control and query functions are documented in the Functions GT
 * category.
 *
 * Supported platforms are Windows, Linux X11 and Linux Wayland. macOS is not
 * supported by this library.
 *
 * Build the library with `make`; `make install` copies it to the xDev library
 * directory. GLFW is supplied by the system through `pkg-config glfw3`.
 *
 * $NOTES$
 * The request must appear in the program that owns Main(). The driver is
 * selected at link time; it is not opened with a function call. A program can
 * use the regular terminal API after requesting GTGLFW.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * GT: GLFW
 * Screen width: 800
 *
 * $CATEGORY$
 * User libraries GTGLFW
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Functions GT, GTI_VERSION, GTI_SCREENWIDTH, GTI_FONTSIZE, GTI_FILEDIALOG
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

REQUEST GTGLFW

PROCEDURE Main()

   QOut( "GT: " + GtInfo( GTI_VERSION ) )
   QOut( "Screen width: " + LTrim( Str( GtInfo( GTI_SCREENWIDTH ) ) ) )

RETURN
