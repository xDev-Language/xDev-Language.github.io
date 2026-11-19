/*
 * $DOC$
 * $NAME$
 * CALLBACK FUNCTION
 *
 * $ONELINER$
 * Declare a native callback signature with a return value
 *
 * $SYNTAX$
 * CALLBACK FUNCTION idType( [idParam AS type [, ...]] ) AS resultType
 *
 * $ARGUMENTS$
 * Declare the native type of each parameter and of the result.
 *
 * $DESCRIPTION$
 * This module-level declaration names a C function pointer type. Use it
 * as the type of a callback parameter. Pass @idFunction() to supply an
 * xDev function with the matching signature. Errors raised in a callback
 * are reported after control returns from the native call.
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
 * CALLBACK PROCEDURE, DLL FUNCTION, FUNCTION
 *
 * $DOCEND$
 */

CALLBACK FUNCTION DateFormatVisitor( address AS PTR ) AS INT32
DLL FUNCTION EnumDateFormatsW( visit AS DateFormatVisitor, locale AS UINT32, flags AS UINT32 ) AS INT32 LIB "kernel32.dll"

STATIC s_nFormats := 0

PROCEDURE Main()

   LOCAL nStatus := EnumDateFormatsW( @CountFormat(), 0x0409, 1 )

   IF s_nFormats == 3
      QOut( "At least three short date formats are available" )
   ELSEIF nStatus != 0
      QOut( "Available short date formats", s_nFormats )
   ELSE
      QOut( "Date format enumeration failed" )
   ENDIF

   RETURN

STATIC FUNCTION CountFormat( address AS PTR ) AS INT32

   s_nFormats++
   IF s_nFormats >= 3
      RETURN 0
   ENDIF

   RETURN 1
