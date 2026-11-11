/*
 * $DOC$
 * $NAME$
 * GFX_LINE
 *
 * $ONELINER$
 * Draw a straight line between two pixels
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_LINE, nTop, nLeft, nBottom, nRight, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_LINE` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the first end.
 * `nLeft` The pixel column of the first end.
 * `nBottom` The pixel row of the second end.
 * `nRight` The pixel column of the second end.
 * `nColor` The color as 0xRRGGBB.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_LINE draws a line one pixel wide from the first end to the second, both ends included.
 * The names of the arguments only give their order: the second end can be above or left of
 * the first, so a line can go in any direction. The part outside the window or the clip is
 * not drawn.
 *
 * $NOTES$
 * A thicker line is drawn as several parallel lines, and a horizontal or vertical bar also
 * with GFX_FILLEDRECT.
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
 * GFX_RECT, GFX_PUTPIXEL, GfxPrimitive()
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
   LOCAL nRow    := nTop + 120
   LOCAL nCol    := 200
   LOCAL nAngle
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // A fan of lines from one center, in every direction
   FOR nIndex := 0 TO 35
      nAngle := nIndex * Pi() / 18
      GfxPrimitive( GFX_LINE, nRow, nCol, nRow + Int( Sin( nAngle ) * 110 ), nCol + Int( Cos( nAngle ) * 110 ), ;
                    GfxPrimitive( GFX_MAKECOLOR, 255, nIndex * 7, 255 - nIndex * 7 ) )
   NEXT

   // A string art curve of straight lines
   FOR nIndex := 0 TO 20
      GfxPrimitive( GFX_LINE, nTop + nIndex * 12, 400, nTop + 240, 400 + nIndex * 18, 0x40C0FF )
   NEXT

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Line to the right           ', GfxPrimitive( GFX_GETPIXEL, nRow, nCol + 110 ), 0xFF00FF )
   Check( 'Last line of the curve      ', GfxPrimitive( GFX_GETPIXEL, nTop + 240, 760 ), 0x40C0FF )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
