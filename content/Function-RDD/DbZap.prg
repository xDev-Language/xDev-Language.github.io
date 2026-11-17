/*
 * $DOC$
 * $NAME$
 * DbZap()
 *
 * $ONELINER$
 * Remove all records from the current database file
 *
 * $SYNTAX$
 * DbZap() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbZap() removes every record from the current work area's file, clears its
 * record pointer state and rebuilds the active indexes while preserving the
 * field structure. The area remains open but all previous record identities
 * and data are lost.
 *
 * $NOTES$
 * The work area must be writable and free of conflicting locks. I/O, sharing or
 * index errors raise a runtime error. Unlike DbPack(), DbZap() does not depend
 * on deletion marks and removes records that were not marked.
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
 * DbPack(), DbDelete(), DbCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbZap()
   QOut( "Records after zap: " + LTrim( Str( DbCount() ) ) )
   DbCloseArea()

RETURN
