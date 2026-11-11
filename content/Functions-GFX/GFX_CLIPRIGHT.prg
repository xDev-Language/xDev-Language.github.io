/*
 * $DOC$
 * $NAME$
 * GFX_CLIPRIGHT
 *
 * $ONELINER$
 * Return the right column of the clip
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_CLIPRIGHT ) --> nRight
 *
 * $ARGUMENTS$
 * `GFX_CLIPRIGHT` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * The last pixel column inside the clip, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_CLIPRIGHT returns the right edge of the rectangle set by GFX_SETCLIP. The column itself
 * is inside the clip, so the clip is GFX_CLIPRIGHT - GFX_CLIPLEFT + 1 pixels wide.
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
 * GFX_SETCLIP, GFX_CLIPTOP, GFX_CLIPLEFT, GFX_CLIPBOTTOM
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

   GfxPrimitive( GFX_ACQUIRESCREEN )
   GfxPrimitive( GFX_FILLEDRECT, nTop, 0, nTop + 200, 700, 0x206040 )

   // A frame on the clip shows where drawing is possible
   GfxPrimitive( GFX_SETCLIP, nTop + 20, 120, nTop + 180, 520 )
   FrameClip( 0xFFFF00 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 100, 520, 50, 0xFF6000 )
   GfxPrimitive( GFX_RELEASESCREEN )

   Check( 'GFX_CLIPRIGHT               ', GfxPrimitive( GFX_CLIPRIGHT ), 520 )
   Check( 'Width of the clip           ', GfxPrimitive( GFX_CLIPRIGHT ) - GfxPrimitive( GFX_CLIPLEFT ) + 1, 401 )
   Check( 'Circle on the right edge    ', GfxPrimitive( GFX_GETPIXEL, nTop + 100, 520 ), 0xFF6000 )
   Check( 'Circle cut off right of it  ', GfxPrimitive( GFX_GETPIXEL, nTop + 100, 521 ), 0x206040 )

   GfxPrimitive( GFX_SETCLIP, 0, 0, 0, 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

// Draws a frame on the edges of the current clip, the outermost pixels inside it
STATIC PROCEDURE FrameClip( nColor )

   GfxPrimitive( GFX_RECT, GfxPrimitive( GFX_CLIPTOP ), GfxPrimitive( GFX_CLIPLEFT ), ;
                 GfxPrimitive( GFX_CLIPBOTTOM ), GfxPrimitive( GFX_CLIPRIGHT ), nColor )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
