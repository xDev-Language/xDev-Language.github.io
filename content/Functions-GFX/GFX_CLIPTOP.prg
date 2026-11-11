/*
 * $DOC$
 * $NAME$
 * GFX_CLIPTOP
 *
 * $ONELINER$
 * Return the top row of the clip
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_CLIPTOP ) --> nTop
 *
 * $ARGUMENTS$
 * `GFX_CLIPTOP` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * The first pixel row inside the clip, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_CLIPTOP returns the top edge of the rectangle set by GFX_SETCLIP. Together with
 * GFX_CLIPLEFT, GFX_CLIPBOTTOM and GFX_CLIPRIGHT it saves the clip, so a procedure can set its
 * own clip and restore the previous one at the end.
 *
 * $NOTES$
 * Without a clip the result depends on the driver. GTWVT and GTGLFW start with the edges of
 * the window, and after GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 ) every driver returns 0.
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
 * GFX_SETCLIP, GFX_CLIPLEFT, GFX_CLIPBOTTOM, GFX_CLIPRIGHT
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

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_SETCLIP, nTop, 0, nTop + 200, 600 )

   GfxPrimitive( GFX_ACQUIRESCREEN )
   Badge( nTop + 20, 40, "One" )
   Badge( nTop + 20, 240, "Two" )
   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'GFX_CLIPTOP after Badge()   ', GfxPrimitive( GFX_CLIPTOP ), nTop )
   Check( 'GFX_CLIPRIGHT after Badge() ', GfxPrimitive( GFX_CLIPRIGHT ), 600 )

   GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

// Draws inside its own clip and restores the clip of the caller
STATIC PROCEDURE Badge( nTop, nLeft, cText )

   LOCAL nOldTop    := GfxPrimitive( GFX_CLIPTOP )
   LOCAL nOldLeft   := GfxPrimitive( GFX_CLIPLEFT )
   LOCAL nOldBottom := GfxPrimitive( GFX_CLIPBOTTOM )
   LOCAL nOldRight  := GfxPrimitive( GFX_CLIPRIGHT )

   GfxPrimitive( GFX_SETCLIP, nTop, nLeft, nTop + 80, nLeft + 160 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 80, nLeft + 80, 100, 0x3060C0 )
   GfxText( nTop + 25, nLeft + 50, cText, 0xFFFFFF, 30, 0 )

   GfxPrimitive( GFX_SETCLIP, nOldTop, nOldLeft, nOldBottom, nOldRight )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
