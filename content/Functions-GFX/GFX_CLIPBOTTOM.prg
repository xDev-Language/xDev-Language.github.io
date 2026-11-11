/*
 * $DOC$
 * $NAME$
 * GFX_CLIPBOTTOM
 *
 * $ONELINER$
 * Return the bottom row of the clip
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_CLIPBOTTOM ) --> nBottom
 *
 * $ARGUMENTS$
 * `GFX_CLIPBOTTOM` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * The last pixel row inside the clip, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_CLIPBOTTOM returns the bottom edge of the rectangle set by GFX_SETCLIP. The row itself
 * is inside the clip, so the clip is GFX_CLIPBOTTOM - GFX_CLIPTOP + 1 pixels high.
 *
 * $NOTES$
 * Without a clip the result depends on the driver. GTWVT and GTGLFW start with the edges of
 * the window, and after GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 ) every driver returns 0.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $IMAGE$
 * GFX_CLIPBOTTOM.png
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_SETCLIP, GFX_CLIPTOP, GFX_CLIPLEFT, GFX_CLIPRIGHT
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
   LOCAL nHigh
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   QOut( "A curtain that falls down, one step of the clip at a time" )

   FOR nIndex := 1 TO 20
      GfxPrimitive( GFX_SETCLIP, nTop, 100, nTop + nIndex * 10 - 1, 500 )
      nHigh := GfxPrimitive( GFX_CLIPBOTTOM ) - GfxPrimitive( GFX_CLIPTOP ) + 1

      GfxPrimitive( GFX_ACQUIRESCREEN )
      GfxPrimitive( GFX_FILLEDRECT, nTop, 100, nTop + 199, 500, 0x902020 )
      GfxText( nTop + 80, 200, LTrim( Str( nHigh ) ) + " px", 0xFFFFFF, 40, 0 )
      GfxPrimitive( GFX_RELEASESCREEN )

      Inkey( 0.05 )
   NEXT

   Check( 'GFX_CLIPBOTTOM              ', GfxPrimitive( GFX_CLIPBOTTOM ), nTop + 199 )
   Check( 'Height of the clip          ', nHigh, 200 )

   GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
