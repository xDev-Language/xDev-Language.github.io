/*
 * $DOC$
 * $NAME$
 * Draw an SVG image
 *
 * $ONELINER$
 * Draw rounded shapes, arcs, sectors, paths and text in an SVG file.
 *
 * $DESCRIPTION$
 * Build with `xdev svg.prg` and run the program. It writes `drawing.svg` in the current directory. The first outline uses the default pen. The remaining outlines use the blue pen with rounded ends and joins.
 *
 * $SEEALSO$
 * SVG, svgInit(), svgPen(), svgPath(), svgArc(), svgClose()
 *
 * $DOCEND$
 */

#include "svg.ch"

PROCEDURE Main()

   LOCAL nSvg := svgInit( "drawing.svg", 560, 320 )
   LOCAL aFilled := { { 35, 192 }, { 70, 123 }, { 105, 192 } }
   LOCAL aOutline := { { 125, 192 }, { 160, 123 }, { 195, 192 } }

   IF nSvg == 0
      QOut( "Cannot create drawing.svg", FError() )
      ErrorLevel( 1 )
      RETURN
   ENDIF

   svgComment( nSvg, "SVG example -- shapes and paths" )
   svgFilledRect( nSvg, 0, 0, 560, 320, "#F2F2F2" )
   svgRect( nSvg, 10, 10, 540, 300, 12 )

   svgPen( nSvg, 3, "#264D73", .T. )
   svgText( nSvg, 280, 42, "Shapes & paths", "sans-serif", 20, FONT_WEIGHT_BOLD, "#1A3550", SVG_ALIGN_CENTER )
   svgLine( nSvg, 25, 60, 535, 60 )
   svgFilledCircle( nSvg, 70, 93, 22, "#264D73" )
   svgCircle( nSvg, 140, 93, 22 )
   svgFilledEllipse( nSvg, 227, 93, 35, 18, "#264D73" )
   svgEllipse( nSvg, 323, 93, 35, 18 )
   svgFilledRect( nSvg, 407, 75, 89, 36, "#264D73", 8 )

   svgFilledPolygon( nSvg, aFilled, "#264D73", 8 )
   svgPolygon( nSvg, aOutline, 8 )
   svgArc( nSvg, 260, 163, 31, 15, 290 )
   svgFilledPie( nSvg, 360, 163, 31, 0, 245, "#264D73" )
   svgPie( nSvg, 460, 163, 31, 0, -245 )

   svgPath( nSvg, "M 55 262 C 100 200 160 300 215 235" )
   svgFilledPath( nSvg, "M 310 265 Q 375 210 440 265 Z", "currentColor" )
   svgClose( nSvg )

RETURN
