/*
 * $DOC$
 * $NAME$
 * NetErr()
 *
 * $ONELINER$
 * Read or set the network-error flag
 *
 * $SYNTAX$
 * NetErr( [lNewError] ) --> lError
 *
 * $ARGUMENTS$
 * `lNewError` Optional new value of the network-error flag.
 *
 * $RETURNS$
 * Previous network-error state.
 *
 * $DESCRIPTION$
 * NetErr() reports whether the last network database operation failed and can set a new state.
 *
 * $NOTES$
 * The flag is maintained by database operations such as locking and opening files.
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
 * DbRLock(), FLock(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   NetErr( .F. )
   QOut( "Network error: " + IIF( NetErr(), "YES", "NO" ) )

RETURN
