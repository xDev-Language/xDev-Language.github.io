/*
 * $DOC$
 * $NAME$
 * DbRLockList()
 *
 * $ONELINER$
 * Return the current record-lock list
 *
 * $SYNTAX$
 * DbRLockList() --> aRecordLocks
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * An array containing identities of records locked by the current work area.
 *
 * $DESCRIPTION$
 * DbRLockList() asks the active RDD for every record identity locked by the
 * current work area and returns those identities in an array. It does not move
 * the record pointer, acquire locks or release them. The result is a snapshot;
 * later lock operations do not update an array already returned.
 *
 * $NOTES$
 * A work area must be open. RDD or I/O failures raise an error. Use DbRUnlock()
 * for one identity, DbUnlock() for all locks in this area, and DbUnlockAll()
 * for all open areas.
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
 * DbRLock(), DbRUnlock()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Locks: " + LTrim( Str( Len( DbRLockList() ) ) ) )

   RETURN
