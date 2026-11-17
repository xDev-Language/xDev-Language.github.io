/*
 * $DOC$
 * $NAME$
 * LUpdate()
 *
 * $ONELINER$
 * Return the last database modification date
 *
 * $SYNTAX$
 * LUpdate() --> dModification
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Date of the last modification, or an empty date without an open area.
 *
 * $DESCRIPTION$
 * LUpdate() reads the date stored in the current database file header.
 *
 * $NOTES$
 * The value is supplied by the active RDD.
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
 * Header(), DbCommit(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Updated: " + DToS( LUpdate() ) )
   DbCloseArea()

RETURN
