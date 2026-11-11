/*
 * $DOC$
 * $NAME$
 * GFX_FILLEDELLIPSE
 *
 * $ONELINER$
 * Draw a filled ellipse
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_FILLEDELLIPSE, nTop, nLeft, nRadiusV, nRadiusH, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_FILLEDELLIPSE` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the center.
 * `nLeft` The pixel column of the center.
 * `nRadiusV` The vertical radius in pixels, from the center up and down.
 * `nRadiusH` The horizontal radius in pixels, from the center left and right.
 * `nColor` The color as 0xRRGGBB.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_FILLEDELLIPSE paints every pixel of the ellipse, its outline included, with nColor. The
 * ellipse has the same pixels as GFX_ELLIPSE with the same arguments, together with the
 * inside. A negative radius draws nothing, and the part outside the window or the clip is not
 * drawn.
 *
 * $NOTES$
 * A radius of 0 paints a line: GfxPrimitive( GFX_FILLEDELLIPSE, nTop, nLeft, 0, nRadiusH,
 * nColor ) is a horizontal line 2 * nRadiusH + 1 pixels long.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_ELLIPSE, GFX_FILLEDCIRCLE, GfxPrimitive()
 *
 * $DOCEND$
 */

#include "gfxdef.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nTop := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nRow := nTop + 100

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // Two eyes: the white, the iris and the pupil
   Eye( nRow, 220 )
   Eye( nRow, 480 )

   // A shadow below them
   GfxPrimitive( GFX_FILLEDELLIPSE, nRow + 120, 350, 12, 220, 0x404040 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'The pupil                   ', GfxPrimitive( GFX_GETPIXEL, nRow, 220 ), 0x000000 )
   Check( 'The iris                    ', GfxPrimitive( GFX_GETPIXEL, nRow, 220 + 25 ), 0x3080C0 )
   Check( 'The white                   ', GfxPrimitive( GFX_GETPIXEL, nRow, 220 - 60 ), 0xFFFFFF )
   Check( 'Its outline, 100 px left    ', GfxPrimitive( GFX_GETPIXEL, nRow, 220 - 100 ), 0x808080 )
   Check( 'Left of the outline         ', GfxPrimitive( GFX_GETPIXEL, nRow, 220 - 101 ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Eye( nRow, nCol )

   GfxPrimitive( GFX_FILLEDELLIPSE, nRow, nCol, 50, 100, 0xFFFFFF )
   GfxPrimitive( GFX_ELLIPSE, nRow, nCol, 50, 100, 0x808080 )
   GfxPrimitive( GFX_FILLEDELLIPSE, nRow, nCol, 40, 36, 0x3080C0 )
   GfxPrimitive( GFX_FILLEDELLIPSE, nRow, nCol, 18, 16, 0x000000 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
