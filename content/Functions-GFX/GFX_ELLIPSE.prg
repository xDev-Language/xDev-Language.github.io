/*
 * $DOC$
 * $NAME$
 * GFX_ELLIPSE
 *
 * $ONELINER$
 * Draw the outline of an ellipse
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_ELLIPSE, nTop, nLeft, nRadiusV, nRadiusH, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_ELLIPSE` The operation, from gfxdef.ch.
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
 * GFX_ELLIPSE draws an ellipse one pixel wide around the center, with its axes along the rows
 * and columns of the window. It is 2 * nRadiusV + 1 pixels high and 2 * nRadiusH + 1 pixels
 * wide. Equal radii draw a circle. The pixels inside keep their color. A negative radius draws
 * nothing, and the part outside the window or the clip is not drawn.
 *
 * $NOTES$
 * The vertical radius comes first, in the same order as the row and the column of the center.
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
 * GFX_FILLEDELLIPSE, GFX_CIRCLE, GfxPrimitive()
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
   LOCAL nRow := nTop + 120
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // From a flat ellipse to a tall one, through a circle in the middle
   FOR nIndex := 0 TO 10
      GfxPrimitive( GFX_ELLIPSE, nRow, 180, 10 + nIndex * 10, 110 - nIndex * 10, ;
                    GfxPrimitive( GFX_MAKECOLOR, 255, 255 - nIndex * 20, nIndex * 25 ) )
   NEXT

   // An atom: three orbits and a nucleus
   GfxPrimitive( GFX_ELLIPSE, nRow, 540, 30, 120, 0x60C0FF )
   GfxPrimitive( GFX_ELLIPSE, nRow, 540, 120, 30, 0x60C0FF )
   GfxPrimitive( GFX_ELLIPSE, nRow, 540, 75, 75, 0x60C0FF )
   GfxPrimitive( GFX_FILLEDCIRCLE, nRow, 540, 12, 0xFF4040 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Right end of the flat orbit ', GfxPrimitive( GFX_GETPIXEL, nRow, 660 ), 0x60C0FF )
   Check( 'Top of the tall orbit       ', GfxPrimitive( GFX_GETPIXEL, nRow - 120, 540 ), 0x60C0FF )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
