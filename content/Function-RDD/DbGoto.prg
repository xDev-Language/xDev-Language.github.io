/*
 * $DOC$
 * $NAME$
 * DbGoto()
 *
 * $ONELINER$
 * Position the record pointer at an identity
 *
 * $SYNTAX$
 * DbGoto( xIdentity ) --> NIL
 *
 * $ARGUMENTS$
 * `xIdentity` Record identity. Positive values select a record; zero or a
 * negative value moves to the beginning boundary.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbGoto() positions the current work area's record pointer at the requested
 * physical record identity.
 *
 * $NOTES$
 * Filters and deleted-record settings affect whether the selected record is visible.
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
 * RecNo(), DbGoTop(), DbGoBottom()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoto( 1 )
   QOut( "Record: " + LTrim( Str( RecNo() ) ) )
   DbCloseArea()

   RETURN
