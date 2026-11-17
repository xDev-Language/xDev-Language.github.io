/*
 * $DOC$
 * $NAME$
 * DbUnlock()
 *
 * $ONELINER$
 * Release all record locks in the current work area
 *
 * $SYNTAX$
 * DbUnlock() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbUnlock() enumerates the current work area's record locks, releases them,
 * and leaves the area, record pointer and file open. It affects no other work
 * area and does not modify records.
 *
 * $NOTES$
 * It does not release a file lock made by FLock(). The area must be open; RDD
 * unlock failures can raise an error. Use DbRUnlock() when only one lock should
 * be released and DbUnlockAll() for every work area.
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
 * DbRLock(), DbRUnlock(), DbUnlockAll()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbRLock()
   DbUnlock()
   QOut( "Locks after unlock: " + LTrim( Str( Len( DbRLockList() ) ) ) )
   DbCloseArea()

RETURN
