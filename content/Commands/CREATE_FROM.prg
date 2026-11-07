/*
 * $DOC$
 * $NAME$
 * CREATE FROM
 *
 * $ONELINER$
 * CREATE FROM Create a new .dbf file from a structure extended file
 *
 * $SYNTAX$
 * CREATE xcDatabase FROM xcExtendedDatabase [NEW]
 *    [ALIAS xcAlias] [VIA cDriver]
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Commands
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   // First create inventory_structure.dbf with CREATE, then define its fields.
   CREATE "inventory" FROM "inventory_structure" NEW ALIAS Stock

   ? "Created alias:", Alias(), "fields:", FCount()

   RETURN
