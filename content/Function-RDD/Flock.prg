/*
 * $DOC$
 * $NAME$
 * FLock()
 *
 * $ONELINER$
 * Lock the current database file
 *
 * $SYNTAX$
 * FLock() --> lSuccess
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * `.T.` when the file lock is acquired; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * FLock() asks the active RDD for an exclusive lock on the current database
 * file. It does not move the record pointer or change field data. The lock
 * covers the file rather than one record and remains until the RDD releases it
 * or the work area closes.
 *
 * $NOTES$
 * The area must be open in a sharing mode that allows locking. Another user's
 * lock, a read-only area or an I/O failure can make the result false or raise an
 * error. FLock() differs from RLock(), which protects one record only.
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
 * DbRLock(), DbUnlock(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "File locked: " + IIF( FLock(), "YES", "NO" ) )
   DbCloseArea()

RETURN
