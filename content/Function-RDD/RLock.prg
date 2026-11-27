/* $DOC$
 * $NAME$
 * RLock()
 * $ONELINER$
 * Lock the current record and release other record locks
 * $SYNTAX$
 * RLock( [nRecord] ) --> lSuccess
 * $ARGUMENTS$
 * Optional record identity.
 * $RETURNS$
 * `.T.` when the lock is acquired.
 * $DESCRIPTION$
 * RLock() resolves the current or optional record identity, locks
 * that record and releases every other record lock held by the current work
 * area. The record pointer is not changed. The returned flag reports whether
 * the requested lock was acquired.
 * $NOTES$
 * The area must be open and shareable. Invalid identities, sharing
 * conflicts and RDD lock errors can make the result false or raise an error.
 * Unlike DbRLock(), RLock() deliberately drops the area's other record locks.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * DbRLock(), DbRUnlock(), DbRLockList()
 * $DOCEND$
 * */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Locked: " + IIF( RLock(), "YES", "NO" ) )
   DbRUnlock()
   DbCloseArea()

RETURN
