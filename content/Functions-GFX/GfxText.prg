/*
 * $DOC$
 * $NAME$
 * GfxText()
 *
 * $ONELINER$
 * Draw text at a pixel position of the window
 *
 * $SYNTAX$
 * GfxText( nTop, nLeft, cText, nColor, nSize, nWidth ) --> NIL
 *
 * $ARGUMENTS$
 * `nTop` The pixel row of the top edge of the text.
 * `nLeft` The pixel column of the left edge of the text.
 * `cText` The text in UTF-8. It ends at the first carriage return or line feed.
 * `nColor` The color of the characters as 0xRRGGBB.
 * `nSize` The height of the characters in pixels. 0 is the height of a text cell.
 * `nWidth` The width of every character in pixels. 0 is half of the height.
 *
 * $RETURNS$
 * NIL
 *
 * $DESCRIPTION$
 * GfxText() draws characters with the font of the window, scaled to the given size, at any
 * pixel position, independent of the text cells. Only the characters are painted and the
 * pixels between them keep their color. Every character takes nWidth pixels, so the text is
 * nWidth times the number of characters wide.
 *
 * The clip set by GFX_SETCLIP limits the text, and calls between GFX_ACQUIRESCREEN and
 * GFX_RELEASESCREEN are shown together with the other graphics. On a terminal without graphics
 * GfxText() does nothing.
 *
 * $NOTES$
 * All six arguments are required, also when nSize and nWidth are 0.
 *
 * Like the pixels of GfxPrimitive(), the text is covered when a text cell over it is painted
 * again. Keep it away from the rows used by text output, or draw it again after the output.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GfxPrimitive(), GFX_SETCLIP, GFX_MAKECOLOR, GFX_FILLEDRECT
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

   LOCAL nWidth := GtInfo( GTI_SCREENWIDTH )
   LOCAL nCell  := GtInfo( GTI_FONTSIZE )
   LOCAL nRow   := 3 * nCell
   LOCAL nSize

   Scroll()
   SetPos( 0, 0 )

   DispOutAt( 0, 0, "GfxText() draws at pixel positions, in any size" )
   DispOutAt( 1, 0, "Any key or 10 seconds ends the program" )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // The same text in growing sizes, the width follows the height
   FOR nSize := 8 TO 40 STEP 8
      GfxText( nRow, 10, "Zażółć gęślą jaźń " + LTrim( Str( nSize ) ) + " px", 0xFFFFFF, nSize, 0 )
      nRow += nSize + 4
   NEXT

   // Narrow and wide characters of the cell height
   GfxText( nRow, 10, "narrow", 0x80C0FF, 0, 5 )
   GfxText( nRow, 100, "wide", 0xFFC080, 0, 20 )
   nRow += 2 * nCell

   // Text on a filled rectangle: the rectangle shows between the characters
   GfxPrimitive( GFX_FILLEDRECT, nRow, 10, nRow + 40, Min( 330, nWidth - 1 ), 0x204080 )
   GfxText( nRow + 8, 20, "Transparent background", 0xFFFF00, 24, 12 )

   GfxPrimitive( GFX_RELEASESCREEN )

   Inkey( 10 )

RETURN
