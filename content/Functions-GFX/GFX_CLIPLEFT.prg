/*
 * $DOC$
 * $NAME$
 * GFX_CLIPLEFT
 *
 * $ONELINER$
 * Return the left column of the clip
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_CLIPLEFT ) --> nLeft
 *
 * $ARGUMENTS$
 * `GFX_CLIPLEFT` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * The first pixel column inside the clip, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_CLIPLEFT returns the left edge of the rectangle set by GFX_SETCLIP. The value is the
 * smaller of the two columns given to GFX_SETCLIP, so it is the left edge also when the
 * corners were given in reverse order.
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
 * GFX_CLIPLEFT.png
 * 
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_SETCLIP, GFX_CLIPTOP, GFX_CLIPBOTTOM, GFX_CLIPRIGHT
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

   LOCAL nTop  := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nLeft
   LOCAL nIndex

   Scroll()
   SetPos( 0, 0 )

   QOut( "A window that opens from the right edge to the left" )

   FOR nIndex := 1 TO 30
      GfxPrimitive( GFX_SETCLIP, nTop, 600 - nIndex * 15, nTop + 150, 600 )

      // Every step draws the stripes again; only the part inside the clip changes
      GfxPrimitive( GFX_ACQUIRESCREEN )
      nLeft := GfxPrimitive( GFX_CLIPLEFT )
      GfxPrimitive( GFX_FILLEDRECT, nTop, 0, nTop + 150, 600, 0x203040 )
      GfxPrimitive( GFX_FILLEDRECT, nTop, nLeft, nTop + 150, nLeft + 3, 0xFFFFFF )
      GfxPrimitive( GFX_RELEASESCREEN )

      Inkey( 0.03 )
   NEXT

   Check( 'GFX_CLIPLEFT                ', GfxPrimitive( GFX_CLIPLEFT ), 150 )

   // The corners in reverse order give the same left edge
   GfxPrimitive( GFX_SETCLIP, nTop + 150, 600, nTop, 150 )
   Check( 'GFX_CLIPLEFT, reverse order ', GfxPrimitive( GFX_CLIPLEFT ), 150 )

   GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
