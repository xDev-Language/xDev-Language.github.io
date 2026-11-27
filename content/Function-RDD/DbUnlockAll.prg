/*
 * $DOC$
 * $NAME$
 * DbUnlockAll()
 *
 * $ONELINER$
 * Release record locks in all work areas
 *
 * $SYNTAX$
 * DbUnlockAll() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbUnlockAll() visits every open work area and releases all record locks in
 * each one. It does not select a different area, move any record pointer or
 * change field data.
 *
 * $NOTES$
 * File locks are not changed. An area-level unlock failure can raise an error.
 * Use DbUnlock() when the operation must stay within one area.
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
 * DbUnlock(), DbRLockList(), DbCloseAll()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUnlockAll()
   QOut( "All record locks released" )

RETURN
