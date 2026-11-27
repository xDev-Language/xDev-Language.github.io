/*
 * $DOC$
 * $NAME$
 * DbRUnlock()
 *
 * $ONELINER$
 * Release record locks
 *
 * $SYNTAX$
 * DbRUnlock( [xIdentity] ) --> NIL
 *
 * $ARGUMENTS$
 * `xIdentity` Optional record identity. Without it, all record locks are released.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbRUnlock() releases the lock for xIdentity, or all record locks when the
 * argument is omitted. It leaves the current area and record pointer unchanged
 * and does not alter field values.
 *
 * $NOTES$
 * The area must be open and the identity must be positive when supplied.
 * Invalid identities or RDD unlock failures raise an error. DbRUnlock() is
 * selective; DbUnlock() always releases every lock in the current area.
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
 * DbRLock(), DbRLockList(), DbCloseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbRUnlock()
   QOut( "DbRUnlock: OK" )

   RETURN
