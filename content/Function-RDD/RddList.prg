/* $DOC$
 * $NAME$
 * RddList()
 * $ONELINER$
 * Return the available database drivers
 * $SYNTAX$
 * RddList( [nRDDType] ) --> aRDDList
 * $ARGUMENTS$
 * Optional driver-type selector.
 * $RETURNS$
 * Array of registered RDD names.
 * $DESCRIPTION$
 * Lists database drivers registered in the current runtime session.
 * $NOTES$
 * An empty list is valid when no driver is registered.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * RddInfo(), RddName(), RddSetDefault()
 * $DOCEND$
 * */

PROCEDURE Main()

   QOut( "RDD count: " + LTrim( Str( Len( RddList() ) ) ) )

RETURN
