/*
 * $DOC$
 * $NAME$
 * #include
 *
 * $ONELINER$
 * Read a header at the current position
 *
 * $SYNTAX$
 * #include "file.ch"
 *
 * $DESCRIPTION$
 * Use a double-quoted filename. For a relative path, xDev looks beside the including file first, then along the configured include paths. Definitions from the header are available on subsequent lines.
 *
 * The database structure header supplies the column indices used to read field definitions.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#include "dbstruct.ch"

PROCEDURE Main()

   LOCAL aFields := { { "CODE", "C", 8, 0 }, { "PRICE", "N", 9, 2 } }
   LOCAL aField

   FOR EACH aField IN aFields
      QOut( aField[ DBS_NAME ], aField[ DBS_TYPE ], "width", aField[ DBS_LEN ] )
      IF aField[ DBS_DEC ] > 0
         QOut( "Decimal places", aField[ DBS_DEC ] )
      ENDIF
   NEXT

   RETURN
