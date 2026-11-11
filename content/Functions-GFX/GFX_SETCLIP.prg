/*
 * $DOC$
 * $NAME$
 * GFX_SETCLIP
 *
 * $ONELINER$
 * Limit drawing to a rectangle of the window
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_SETCLIP, nTop, nLeft, nBottom, nRight ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_SETCLIP` The operation, from gfxdef.ch.
 * `nTop` The first pixel row inside the clip.
 * `nLeft` The first pixel column inside the clip.
 * `nBottom` The last pixel row inside the clip.
 * `nRight` The last pixel column inside the clip.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_SETCLIP sets the clip, the rectangle in which drawing operations and GfxText() change
 * pixels. The edges are inside the clip. Pixels outside it keep their color, and a shape that
 * crosses the edge is cut off there. The corners can be given in any order: the smaller row
 * is the top and the smaller column is the left edge.
 *
 * The clip stays until the next GFX_SETCLIP. GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 ) removes
 * it, and the whole window can be drawn on again. GFX_CLIPTOP, GFX_CLIPLEFT, GFX_CLIPBOTTOM
 * and GFX_CLIPRIGHT return the current edges.
 *
 * $NOTES$
 * The clip does not affect text output in cells, only graphics.
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
 * GFX_CLIPTOP, GFX_CLIPLEFT, GFX_CLIPBOTTOM, GFX_CLIPRIGHT, GfxPrimitive()
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
   LOCAL nHeight := GtInfo( GTI_SCREENHEIGHT )
   LOCAL nWidth  := GtInfo( GTI_SCREENWIDTH )
   LOCAL nCol

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )

   // Corners in reverse order are sorted
   Check( 'GFX_SETCLIP                 ', GfxPrimitive( GFX_SETCLIP, nTop + 150, 400, nTop + 30, 100 ), 1 )
   Check( 'GFX_CLIPTOP, GFX_CLIPLEFT   ', ;
          { GfxPrimitive( GFX_CLIPTOP ), GfxPrimitive( GFX_CLIPLEFT ) }, { nTop + 30, 100 } )

   // Lines across the whole window, visible only inside the clip
   FOR nCol := 0 TO nWidth - 1 STEP 12
      GfxPrimitive( GFX_LINE, nTop, nCol, nHeight - 1, nCol + 200, 0x40C0FF )
   NEXT
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 90, 400, 60, 0xFFC000 )

   Check( 'Pixel outside the clip      ', GfxPrimitive( GFX_GETPIXEL, nTop + 90, 450 ), 0 )
   Check( 'Pixel inside the clip       ', GfxPrimitive( GFX_GETPIXEL, nTop + 90, 380 ), 0xFFC000 )

   // Without the clip the circle is drawn whole
   GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 )
   GfxPrimitive( GFX_CIRCLE, nTop + 90, 400, 60, 0xFFFFFF )
   Check( 'After the clip is removed   ', GfxPrimitive( GFX_GETPIXEL, nTop + 90, 460 ), 0xFFFFFF )

   GfxPrimitive( GFX_RELEASESCREEN )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   LOCAL lOk := ValType( xResult ) == "A" .AND. Len( xResult ) == Len( xExpected )
   LOCAL nIndex

   IF lOk
      FOR nIndex := 1 TO Len( xResult )
         lOk := lOk .AND. xResult[ nIndex ] == xExpected[ nIndex ]
      NEXT
   ELSE
      lOk := ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected
   ENDIF

   QOut( cTitle + IIF( lOk, "OK", "ERROR" ) )

RETURN
