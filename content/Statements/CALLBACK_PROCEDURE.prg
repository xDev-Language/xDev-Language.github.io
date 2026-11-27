/*
 * $DOC$
 * $NAME$
 * CALLBACK PROCEDURE
 *
 * $ONELINER$
 * Declare a native callback signature for a void function
 *
 * $SYNTAX$
 * CALLBACK PROCEDURE idType( [idParam AS type [, ...]] )
 *
 * $ARGUMENTS$
 * Declare the native type of each parameter.
 *
 * $DESCRIPTION$
 * This module-level declaration names a C function pointer type for a
 * callback that returns void. Use it as the type of a callback parameter
 * and pass @idProcedure() with the matching signature.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * CALLBACK FUNCTION, DLL PROCEDURE, PROCEDURE
 *
 * $DOCEND$
 */

CALLBACK PROCEDURE PointVisitor( x AS INT32, y AS INT32, threshold AS INT64 )
DLL FUNCTION LineDDA( x1 AS INT32, y1 AS INT32, x2 AS INT32, y2 AS INT32, visit AS PointVisitor, threshold AS INT64 ) AS INT32 LIB "gdi32.dll"

STATIC s_nPoints := 0
STATIC s_nHigh := 0

PROCEDURE Main()

   // Count raster points on or above the inspection threshold.
   IF LineDDA( 0, 0, 12, 6, @InspectPoint(), 3 ) != 0
      QOut( "Raster points", s_nPoints, "at or above threshold", s_nHigh )
   ELSE
      QOut( "Line enumeration failed" )
   ENDIF

   RETURN

STATIC PROCEDURE InspectPoint( x AS INT32, y AS INT32, threshold AS INT64 )

   s_nPoints++
   IF y >= threshold
      s_nHigh++
   ENDIF

   RETURN
