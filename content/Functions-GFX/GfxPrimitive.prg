/*
 * $DOC$
 * $NAME$
 * GfxPrimitive()
 *
 * $ONELINER$
 * Draw a graphics primitive or query the graphics state of the window
 *
 * $SYNTAX$
 * GfxPrimitive( nType, [nTop], [nLeft], [nBottom], [nRight], [nColor] ) --> nResult
 *
 * $ARGUMENTS$
 * `nType` One of the GFX_* constants from gfxdef.ch. The constant selects the operation and
 * gives the other arguments their meaning:
 *
 * | nType | Arguments | Result |
 * |---|---|---|
 * | GFX_ACQUIRESCREEN | | 1 |
 * | GFX_RELEASESCREEN | | 1 |
 * | GFX_MAKECOLOR | nRed, nGreen, nBlue | the color |
 * | GFX_CLIPTOP | | the top row of the clip |
 * | GFX_CLIPLEFT | | the left column of the clip |
 * | GFX_CLIPBOTTOM | | the bottom row of the clip |
 * | GFX_CLIPRIGHT | | the right column of the clip |
 * | GFX_SETCLIP | nTop, nLeft, nBottom, nRight | 1 |
 * | GFX_DRAWINGMODE | [nMode] | the drawing mode |
 * | GFX_GETPIXEL | nTop, nLeft | the color of the pixel |
 * | GFX_PUTPIXEL | nTop, nLeft, nColor | 1 |
 * | GFX_LINE | nTop, nLeft, nBottom, nRight, nColor | 1 |
 * | GFX_RECT | nTop, nLeft, nBottom, nRight, nColor | 1 |
 * | GFX_FILLEDRECT | nTop, nLeft, nBottom, nRight, nColor | 1 |
 * | GFX_CIRCLE | nTop, nLeft, nRadius, nColor | 1 |
 * | GFX_FILLEDCIRCLE | nTop, nLeft, nRadius, nColor | 1 |
 * | GFX_ELLIPSE | nTop, nLeft, nRadiusV, nRadiusH, nColor | 1 |
 * | GFX_FILLEDELLIPSE | nTop, nLeft, nRadiusV, nRadiusH, nColor | 1 |
 * | GFX_FLOODFILL | nTop, nLeft, nColor | 1 |
 *
 * `nTop` The second argument. Its meaning depends on nType, see the table.
 * `nLeft` The third argument, see the table.
 * `nBottom` The fourth argument, see the table.
 * `nRight` The fifth argument, see the table.
 * `nColor` The sixth argument, see the table.
 *
 * $RETURNS$
 * The number from the table: 1 for a drawing operation, the color for GFX_MAKECOLOR and
 * GFX_GETPIXEL, an edge for the GFX_CLIP* queries and the mode for GFX_DRAWINGMODE. On a
 * terminal without graphics every call returns 0 and draws nothing.
 *
 * $DESCRIPTION$
 * GfxPrimitive() draws with pixels in the window of the graphics terminal drivers GTWVT, GTSDL3,
 * GTXWC and GTGLFW. Pixels are counted from the top left corner of the window. A position is
 * given as the row first and the column second, both from 0. GtInfo( GTI_SCREENHEIGHT ) and
 * GtInfo( GTI_SCREENWIDTH ) return the size of the window in pixels, GtInfo( GTI_FONTSIZE ) and
 * GtInfo( GTI_FONTWIDTH ) the size of one text cell, and GtInfo( GTI_ISGRAPHIC ) tells whether
 * the terminal can draw at all.
 *
 * The arguments after nType are taken by position, and an omitted one is 0. The names in the
 * syntax fit the rectangle operations. The other operations use fewer numbers: the color of
 * GFX_PUTPIXEL and GFX_FLOODFILL is the third argument and the color of GFX_CIRCLE and
 * GFX_FILLEDCIRCLE the fourth.
 *
 * A color is a number 0xRRGGBB with the red, green and blue parts from 0 to 255, written as a
 * literal like 0xFF8000 or made by GFX_MAKECOLOR.
 *
 * Text and graphics share the pixels of the window. A text cell that changes is painted again
 * over the pixels below it, and graphics stay until text covers them or the window is cleared,
 * as by Scroll(). When the window changes its size, the graphics are lost and only the text
 * is painted again.
 *
 * Drawing operations between GFX_ACQUIRESCREEN and GFX_RELEASESCREEN are shown together, like
 * text output between DispBegin() and DispEnd(). GFX_SETCLIP limits drawing to a rectangle,
 * and GFX_DRAWINGMODE selects solid or XOR drawing on the drivers that support XOR.
 *
 * $NOTES$
 * The GFX_* constants are defined in gfxdef.ch and the GTI_* constants in gtinfo.ch.
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
 * GfxText(), GFX_ACQUIRESCREEN, GFX_MAKECOLOR, GFX_SETCLIP, GFX_LINE, GFX_FILLEDRECT, GFX_CIRCLE
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

   LOCAL nHeight := GtInfo( GTI_SCREENHEIGHT )
   LOCAL nWidth  := GtInfo( GTI_SCREENWIDTH )
   LOCAL nCell   := GtInfo( GTI_FONTSIZE )
   LOCAL nSky    := GfxPrimitive( GFX_MAKECOLOR, 40, 90, 200 )
   LOCAL nTop    := 3 * nCell
   LOCAL nGround := Int( nHeight * 3 / 4 )
   LOCAL nAngle
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   DispOutAt( 0, 0, "GfxPrimitive() on a window of " + LTrim( Str( nWidth ) ) + " x " + ;
                    LTrim( Str( nHeight ) ) + " pixels" )
   DispOutAt( 1, 0, "Any key or 10 seconds ends the program" )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // Sky and grass
   GfxPrimitive( GFX_FILLEDRECT, nTop, 0, nHeight - 1, nWidth - 1, nSky )
   GfxPrimitive( GFX_FILLEDRECT, nGround, 0, nHeight - 1, nWidth - 1, 0x208020 )

   // The sun with twelve rays
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 60, nWidth - 100, 30, 0xFFD000 )
   FOR nIndex := 0 TO 11
      nAngle := nIndex * Pi() / 6
      GfxPrimitive( GFX_LINE, nTop + 60 + Int( Sin( nAngle ) * 40 ), nWidth - 100 + Int( Cos( nAngle ) * 40 ), ;
                    nTop + 60 + Int( Sin( nAngle ) * 55 ), nWidth - 100 + Int( Cos( nAngle ) * 55 ), 0xFFD000 )
   NEXT

   // A cloud of two ellipses
   GfxPrimitive( GFX_FILLEDELLIPSE, nTop + 50, 420, 20, 50, 0xFFFFFF )
   GfxPrimitive( GFX_FILLEDELLIPSE, nTop + 40, 460, 25, 40, 0xFFFFFF )

   // A house: walls, a door and a roof of three lines filled with red
   GfxPrimitive( GFX_FILLEDRECT, nGround - 60, 60, nGround + 60, 220, 0xC06030 )
   GfxPrimitive( GFX_RECT, nGround - 60, 60, nGround + 60, 220, 0x000000 )
   GfxPrimitive( GFX_FILLEDRECT, nGround, 120, nGround + 60, 160, 0x603010 )
   GfxPrimitive( GFX_LINE, nGround - 60, 60, nGround - 120, 140, 0x000000 )
   GfxPrimitive( GFX_LINE, nGround - 120, 140, nGround - 60, 220, 0x000000 )
   GfxPrimitive( GFX_FLOODFILL, nGround - 70, 140, 0xA00000 )

   GfxText( nTop + 10, 10, "Hello, pixels!", 0xFFFFFF, 2 * nCell, 0 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Inkey( 10 )

RETURN
