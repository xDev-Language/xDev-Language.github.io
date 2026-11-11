/*
 * $DOC$
 * $NAME$
 * GFX_FILLEDRECT
 *
 * $ONELINER$
 * Draw a filled rectangle
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_FILLEDRECT, nTop, nLeft, nBottom, nRight, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_FILLEDRECT` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the top edge.
 * `nLeft` The pixel column of the left edge.
 * `nBottom` The pixel row of the bottom edge.
 * `nRight` The pixel column of the right edge.
 * `nColor` The color as 0xRRGGBB.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_FILLEDRECT paints every pixel of the rectangle, the edges included, with nColor. The
 * corners can be given in any order. The part outside the window or the clip is not drawn.
 *
 * A rectangle over the whole window clears the graphics with one color:
 * GfxPrimitive( GFX_FILLEDRECT, 0, 0, GtInfo( GTI_SCREENHEIGHT ) - 1,
 * GtInfo( GTI_SCREENWIDTH ) - 1, nColor ).
 *
 * $NOTES$
 * GFX_RECT draws only the outline of the same rectangle.
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
 * GFX_RECT, GFX_FILLEDCIRCLE, GfxPrimitive()
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

   LOCAL nTop    := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nBase   := nTop + 240
   LOCAL aValues := { 12, 30, 22, 45, 38, 50, 27, 41 }
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // A bar chart: one filled rectangle per value, from the base line up
   GfxPrimitive( GFX_FILLEDRECT, nTop, 40, nBase, 600, 0x202830 )
   FOR nIndex := 1 TO Len( aValues )
      GfxPrimitive( GFX_FILLEDRECT, nBase - aValues[ nIndex ] * 4, nIndex * 65, nBase, nIndex * 65 + 40, ;
                    IIF( aValues[ nIndex ] == 50, 0xFF6040, 0x40A0FF ) )
   NEXT
   GfxPrimitive( GFX_LINE, nBase, 40, nBase, 600, 0xFFFFFF )

   GfxPrimitive( GFX_RELEASESCREEN )

   // The corners given in reverse order paint the same rectangle
   GfxPrimitive( GFX_FILLEDRECT, nTop + 30, 700, nTop, 640, 0x80FF80 )
   Check( 'Top left corner             ', GfxPrimitive( GFX_GETPIXEL, nTop, 640 ), 0x80FF80 )
   Check( 'Bottom right corner         ', GfxPrimitive( GFX_GETPIXEL, nTop + 30, 700 ), 0x80FF80 )
   Check( 'Highest bar                 ', GfxPrimitive( GFX_GETPIXEL, nBase - 199, 6 * 65 + 20 ), 0xFF6040 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
