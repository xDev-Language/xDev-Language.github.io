/*
 * $DOC$
 * $NAME$
 * GFX_DRAWINGMODE
 *
 * $ONELINER$
 * Query or select how drawn pixels are combined with the window
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_DRAWINGMODE, [nMode] ) --> nMode
 *
 * $ARGUMENTS$
 * `GFX_DRAWINGMODE` The operation, from gfxdef.ch.
 * `nMode` The new drawing mode, one of the GFX_MODE_* constants from gfxdef.ch:
 *
 * | nMode | Value | A drawn pixel gets |
 * |---|---|---|
 * | GFX_MODE_SOLID | 1 | the color |
 * | GFX_MODE_XOR | 2 | its old color XOR the color |
 * | GFX_MODE_ALPHA | 3 | reserved, no driver supports it |
 *
 * Without nMode, or with a mode the driver does not support, the mode does not change.
 *
 * $RETURNS$
 * The drawing mode after the call, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_DRAWINGMODE selects how the following drawing operations and GfxText() change pixels.
 * GFX_MODE_SOLID, the default, paints the color. In GFX_MODE_XOR every drawn pixel is combined
 * with the old one by a bitwise XOR, so drawing the same shape a second time gives the window
 * back its old pixels. This draws a cursor, a selection or a rubber band rectangle over a
 * picture without saving it.
 *
 * GTXWC and GTGLFW support GFX_MODE_SOLID and GFX_MODE_XOR. GTWVT and GTSDL3 always draw solid
 * and return GFX_MODE_SOLID. The result tells whether the requested mode was selected.
 *
 * $NOTES$
 * A program that needs XOR checks the result and draws without XOR on the other drivers.
 * Set GFX_MODE_SOLID again when the XOR drawing is done.
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
 * GfxPrimitive(), GFX_RECT, GFX_GETPIXEL
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

   Check( 'Default mode is SOLID          ', GfxPrimitive( GFX_DRAWINGMODE ), GFX_MODE_SOLID )

   // A picture to draw over
   GfxPrimitive( GFX_FILLEDRECT, nTop, 50, nTop + 200, 650, 0x204060 )
   GfxPrimitive( GFX_FILLEDCIRCLE, nTop + 100, 350, 80, 0xE0A020 )

   IF GfxPrimitive( GFX_DRAWINGMODE, GFX_MODE_XOR ) == GFX_MODE_XOR
      QOut( "XOR is supported: a rubber band rectangle moves over the picture" )

      FOR nIndex := 0 TO 40
         GfxPrimitive( GFX_RECT, nTop + 20, 70 + nIndex * 10, nTop + 180, 200 + nIndex * 10, 0xFFFFFF )
         Inkey( 0.05 )
         // The same rectangle again restores the pixels below it
         GfxPrimitive( GFX_RECT, nTop + 20, 70 + nIndex * 10, nTop + 180, 200 + nIndex * 10, 0xFFFFFF )
      NEXT

      Check( 'Pixels restored by XOR         ', GfxPrimitive( GFX_GETPIXEL, nTop + 20, 270 ), 0x204060 )
      GfxPrimitive( GFX_DRAWINGMODE, GFX_MODE_SOLID )
   ELSE
      QOut( "This driver draws only in GFX_MODE_SOLID" )
   ENDIF

   Check( 'Mode after the drawing         ', GfxPrimitive( GFX_DRAWINGMODE ), GFX_MODE_SOLID )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
