/*
 * $DOC$
 * $NAME$
 * DbPack()
 *
 * $ONELINER$
 * Remove records marked for deletion
 *
 * $SYNTAX$
 * DbPack() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbPack() scans the current file, omits records marked by DbDelete(), rewrites
 * the remaining records, and rebuilds active indexes. The current record
 * identity and pointer can change because records are renumbered during the
 * rewrite. The area remains open after packing.
 *
 * $NOTES$
 * The work area must be writable and free of conflicting locks. I/O, sharing or
 * index errors raise a runtime error. DbPack() removes only deleted records;
 * DbZap() removes every record regardless of its deletion mark.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DbDelete(), DbRecall(), DbZap()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbPack()
   QOut( "DbPack: OK" )
   DbCloseArea()

   RETURN
