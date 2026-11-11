/*
 * $DOC$
 * $NAME$
 * GFX_FLOODFILL
 *
 * $ONELINER$
 * Fill an area of one color, starting from a pixel
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_FLOODFILL, nTop, nLeft, nColor ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_FLOODFILL` The operation, from gfxdef.ch.
 * `nTop` The pixel row of the start pixel.
 * `nLeft` The pixel column of the start pixel.
 * `nColor` The new color as 0xRRGGBB. It is the third number, not the fifth.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_FLOODFILL takes the color of the start pixel and paints with nColor every pixel of
 * that color that can be reached from it, like the bucket of a paint program. It goes from
 * a pixel to its four neighbors above, below, left and right, and stops at pixels of any
 * other color. The area does not leak through a diagonal step of a line, so the outlines of
 * GFX_LINE, GFX_CIRCLE and GFX_ELLIPSE close it.
 *
 * The fill stays inside the clip. When the start pixel is outside the clip, or already has
 * nColor, nothing changes.
 *
 * $NOTES$
 * An area with a gap in its outline is filled together with everything outside it. The fill
 * looks at exact colors, so text cells and GfxText() can also stop it.
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
 * GFX_GETPIXEL, GFX_LINE, GFX_SETCLIP, GfxPrimitive()
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
   LOCAL nRow := nTop + 110

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // A star of five lines, filled in the middle and in one point
   Star( nRow, 160, 100, 0xFFFFFF )
   GfxPrimitive( GFX_FLOODFILL, nRow, 160, 0xFFD000 )
   GfxPrimitive( GFX_FLOODFILL, nRow - 80, 160, 0xFF6000 )

   // Two circles that overlap: three areas
   GfxPrimitive( GFX_CIRCLE, nRow, 420, 80, 0xFFFFFF )
   GfxPrimitive( GFX_CIRCLE, nRow, 520, 80, 0xFFFFFF )
   GfxPrimitive( GFX_FLOODFILL, nRow, 380, 0x2060FF )
   GfxPrimitive( GFX_FLOODFILL, nRow, 470, 0x20C040 )
   GfxPrimitive( GFX_FLOODFILL, nRow, 560, 0xFF2020 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'Middle of the star          ', GfxPrimitive( GFX_GETPIXEL, nRow, 160 ), 0xFFD000 )
   Check( 'Top point of the star       ', GfxPrimitive( GFX_GETPIXEL, nRow - 80, 160 ), 0xFF6000 )
   Check( 'Overlap of the circles      ', GfxPrimitive( GFX_GETPIXEL, nRow, 470 ), 0x20C040 )
   Check( 'Outside stays as it was     ', GfxPrimitive( GFX_GETPIXEL, nRow, 620 ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

// A five-pointed star drawn with five lines, from every point to the second next one
STATIC PROCEDURE Star( nRow, nCol, nRadius, nColor )

   LOCAL nIndex
   LOCAL nFrom
   LOCAL nTo

   FOR nIndex := 0 TO 4
      nFrom := nIndex * 4 * Pi() / 5 - Pi() / 2
      nTo   := ( nIndex + 1 ) * 4 * Pi() / 5 - Pi() / 2
      GfxPrimitive( GFX_LINE, nRow + Int( Sin( nFrom ) * nRadius ), nCol + Int( Cos( nFrom ) * nRadius ), ;
                    nRow + Int( Sin( nTo ) * nRadius ), nCol + Int( Cos( nTo ) * nRadius ), nColor )
   NEXT

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
