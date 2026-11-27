/*
 * $DOC$
 * $NAME$
 * DLL FUNCTION
 *
 * $ONELINER$
 * Declare a value-returning function imported from a DLL
 *
 * $SYNTAX$
 * DLL [STATIC] FUNCTION idName( [idParam AS type [, ...]] ) AS resultType [PASCAL] [FROM symbol] LIB "file.dll"
 *
 * $ARGUMENTS$
 * AS gives each parameter and the result its native type. FROM specifies
 * the export when its name differs from idName. LIB names the DLL.
 * STATIC limits the declaration to the current file.
 *
 * $DESCRIPTION$
 * Declare the function at module level. The linker resolves the export
 * when building the program. The declaration must use a fixed parameter
 * list matching the native signature. PSZ represents a UTF-8 C string.
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
 * DLL PROCEDURE, CALLBACK FUNCTION, STRUCT
 *
 * $DOCEND$
 */

DLL FUNCTION ScaleCoordinate( value AS INT32, numerator AS INT32, denominator AS INT32 ) AS INT32 FROM MulDiv LIB "kernel32.dll"

PROCEDURE Main()

   LOCAL nOffset
   LOCAL nDpi := 144

   // Convert layout coordinates from 96-DPI units to device pixels.
   // MulDiv rounds the product divided by the denominator.
   FOR EACH nOffset IN { -3, 0, 3, 96 }
      QOut( "Layout coordinate", nOffset, "pixel", ScaleCoordinate( nOffset, nDpi, 96 ) )
   NEXT

   RETURN
