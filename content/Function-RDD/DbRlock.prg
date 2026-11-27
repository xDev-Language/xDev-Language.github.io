/*
 * $DOC$
 * $NAME$
 * DbRLock()
 *
 * $ONELINER$
 * Lock a record
 *
 * $SYNTAX$
 * DbRLock( [xIdentity] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `xIdentity` Optional record identity. Without it, the current record is locked.
 *
 * $RETURNS$
 * `.T.` when the record is locked; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbRLock() resolves the current record or xIdentity, asks the active RDD for a
 * record lock, and returns whether it succeeded. The record pointer does not
 * move. A successful lock is added to the current area's lock list and remains
 * until DbRUnlock(), DbUnlock() or area close releases it.
 *
 * $NOTES$
 * The area must be open in a compatible sharing mode. Invalid identities,
 * read-only state, sharing conflicts or I/O failures can raise an error or
 * return `.F.` according to the RDD. DbRLock() keeps other locks; RLock()
 * explicitly releases the area's other record locks first.
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
 * DbRUnlock(), DbRLockList(), FLock()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Record locked: " + IIF( DbRLock(), "YES", "NO" ) )

   RETURN
