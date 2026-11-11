/*
 * $DOC$
 * $NAME$
 * GFX_GETPIXEL
 *
 * $ONELINER$
 * Return the color of a pixel of the window
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_GETPIXEL, nTop, nLeft ) --> nColor
 *
 * $ARGUMENTS$
 * `GFX_GETPIXEL` The operation, from gfxdef.ch.
 * `nTop` The pixel row.
 * `nLeft` The pixel column.
 *
 * $RETURNS$
 * The color of the pixel as 0xRRGGBB. A position outside the window and a terminal without
 * graphics return 0.
 *
 * $DESCRIPTION$
 * GFX_GETPIXEL reads the color that the window shows at the position, whether it comes from
 * graphics, from GfxText() or from a text cell. The clip does not limit reading.
 *
 * The result is a color as GFX_MAKECOLOR makes it. Its parts are Int( nColor / 0x10000 ) for
 * red, Int( nColor / 0x100 ) % 0x100 for green and nColor % 0x100 for blue.
 *
 * $NOTES$
 * 0 is also black, so a result of 0 does not show that the position was outside the window.
 * Compare the position with GtInfo( GTI_SCREENHEIGHT ) and GtInfo( GTI_SCREENWIDTH ) first.
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
 * GFX_PUTPIXEL, GFX_MAKECOLOR, GFX_FLOODFILL
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

   LOCAL nTop   := 10 * GtInfo( GTI_FONTSIZE )
   LOCAL aColor := { 0xFF0000, 0x00FF00, 0x0000FF, 0xFFFF00, 0x808080 }
   LOCAL nIndex
   LOCAL nColor

   Scroll()
   SetPos( 0, 0 )

   GfxPrimitive( GFX_ACQUIRESCREEN )
   FOR nIndex := 1 TO Len( aColor )
      GfxPrimitive( GFX_FILLEDRECT, nTop, nIndex * 120, nTop + 80, nIndex * 120 + 100, aColor[ nIndex ] )
   NEXT
   GfxPrimitive( GFX_RELEASESCREEN )

   // The colors read back from the middle of the squares
   FOR nIndex := 1 TO Len( aColor )
      nColor := GfxPrimitive( GFX_GETPIXEL, nTop + 40, nIndex * 120 + 50 )
      QOut( "Square " + LTrim( Str( nIndex ) ) + ": red " + Str( Int( nColor / 0x10000 ), 3 ) + ;
            ", green " + Str( Int( nColor / 0x100 ) % 0x100, 3 ) + ", blue " + Str( nColor % 0x100, 3 ) + ;
            IIF( nColor == aColor[ nIndex ], "   OK", "   ERROR" ) )
   NEXT

   Check( 'Outside the window          ', GfxPrimitive( GFX_GETPIXEL, -1, 0 ), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
