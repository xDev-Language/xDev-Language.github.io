/*
 * $DOC$
 * $NAME$
 * GFX_RELEASESCREEN
 *
 * $ONELINER$
 * End a group of drawing operations and show it
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_RELEASESCREEN ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_RELEASESCREEN` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * 1 when a GFX_ACQUIRESCREEN was ended. Without an open GFX_ACQUIRESCREEN, GTXWC and GTGLFW
 * return 0 and GTWVT and GTSDL3 return 1. On a terminal without graphics the result is 0.
 *
 * $DESCRIPTION$
 * GFX_RELEASESCREEN ends the group started by GFX_ACQUIRESCREEN. It works like DispEnd(): when
 * the last open GFX_ACQUIRESCREEN is ended, the pixels and the text drawn since the first one
 * are shown together.
 *
 * In nested pairs only the outermost GFX_RELEASESCREEN updates the screen. A procedure can
 * therefore use its own pair and still be called from inside a bigger drawing.
 *
 * $NOTES$
 * A missing GFX_RELEASESCREEN leaves the screen without updates. Call it on every way out of
 * the drawing code.
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
 * GFX_ACQUIRESCREEN, GfxPrimitive(), DispEnd()
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
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   QOut( "Five tiles, each drawn by its own procedure with its own pair," )
   QOut( "appear together at the outer GFX_RELEASESCREEN after a second" )

   GfxPrimitive( GFX_ACQUIRESCREEN )
   FOR nIndex := 0 TO 4
      DrawTile( nTop, 20 + nIndex * 110, nIndex )
   NEXT
   Inkey( 1 )
   Check( 'Outer GFX_RELEASESCREEN ', GfxPrimitive( GFX_RELEASESCREEN ), 1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

// A tile with its own pair: alone it would be shown at once,
// inside an open pair it waits for the outer GFX_RELEASESCREEN
STATIC PROCEDURE DrawTile( nTop, nLeft, nIndex )

   GfxPrimitive( GFX_ACQUIRESCREEN )
   GfxPrimitive( GFX_FILLEDRECT, nTop, nLeft, nTop + 100, nLeft + 100, ;
                 GfxPrimitive( GFX_MAKECOLOR, 50 * nIndex, 120, 255 - 50 * nIndex ) )
   GfxPrimitive( GFX_RECT, nTop, nLeft, nTop + 100, nLeft + 100, 0xFFFFFF )
   GfxPrimitive( GFX_RELEASESCREEN )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
