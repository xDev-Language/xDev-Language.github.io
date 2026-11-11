/*
 * $DOC$
 * $NAME$
 * GFX_MAKECOLOR
 *
 * $ONELINER$
 * Make a color number from its red, green and blue parts
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_MAKECOLOR, nRed, nGreen, nBlue ) --> nColor
 *
 * $ARGUMENTS$
 * `GFX_MAKECOLOR` The operation, from gfxdef.ch.
 * `nRed` The red part from 0 to 255.
 * `nGreen` The green part from 0 to 255.
 * `nBlue` The blue part from 0 to 255.
 *
 * $RETURNS$
 * The color as a number 0xRRGGBB, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_MAKECOLOR joins three parts into the color number that the drawing operations take. A
 * part below 0 is taken as 0 and a part above 255 as 255.
 *
 * The result is the same as nRed * 0x10000 + nGreen * 0x100 + nBlue for parts in range, so a
 * fixed color can also be written as a literal like 0xFF8000.
 *
 * $NOTES$
 * The color does not depend on the driver: all graphics drivers use 0xRRGGBB.
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
 * GfxPrimitive(), GFX_GETPIXEL, GFX_FILLEDRECT
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

   LOCAL nTop   := 8 * GtInfo( GTI_FONTSIZE )
   LOCAL nWidth := GtInfo( GTI_SCREENWIDTH )
   LOCAL nCol

   Scroll()
   SetPos( 0, 0 )

   Check( 'GFX_MAKECOLOR( 255, 128, 0 )  ', GfxPrimitive( GFX_MAKECOLOR, 255, 128, 0 ), 0xFF8000 )
   Check( 'GFX_MAKECOLOR( 0, 0, 0 )      ', GfxPrimitive( GFX_MAKECOLOR, 0, 0, 0 ), 0x000000 )
   Check( 'GFX_MAKECOLOR( 300, -5, 64 )  ', GfxPrimitive( GFX_MAKECOLOR, 300, -5, 64 ), 0xFF0040 )

   // Gradients: red, green and blue, and gray where all parts are equal
   GfxPrimitive( GFX_ACQUIRESCREEN )
   FOR nCol := 0 TO nWidth - 1
      GfxPrimitive( GFX_LINE, nTop, nCol, nTop + 30, nCol, ;
                    GfxPrimitive( GFX_MAKECOLOR, Int( nCol * 255 / nWidth ), 0, 0 ) )
      GfxPrimitive( GFX_LINE, nTop + 40, nCol, nTop + 70, nCol, ;
                    GfxPrimitive( GFX_MAKECOLOR, 0, Int( nCol * 255 / nWidth ), 0 ) )
      GfxPrimitive( GFX_LINE, nTop + 80, nCol, nTop + 110, nCol, ;
                    GfxPrimitive( GFX_MAKECOLOR, 0, 0, Int( nCol * 255 / nWidth ) ) )
      GfxPrimitive( GFX_LINE, nTop + 120, nCol, nTop + 150, nCol, ;
                    GfxPrimitive( GFX_MAKECOLOR, Int( nCol * 255 / nWidth ), Int( nCol * 255 / nWidth ), ;
                                  Int( nCol * 255 / nWidth ) ) )
   NEXT
   GfxPrimitive( GFX_RELEASESCREEN )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
