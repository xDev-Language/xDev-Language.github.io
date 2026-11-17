/* $DOC$
 * $NAME$ RecNo()
 * $ONELINER$ Return the identity at the record pointer
 * $SYNTAX$ RecNo() --> Identity
 * $ARGUMENTS$ None.
 * $RETURNS$ Current record identity.
 * $DESCRIPTION$ RecNo() returns the physical identity of the current record.
 * $NOTES$ The value can be zero at a boundary.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ RecCount(), DbGoto(), DbGoTop()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoTop()
   QOut( "Record: " + LTrim( Str( RecNo() ) ) )
   DbCloseArea()

RETURN
