/*
 * $DOC$
 * $NAME$
 * DbSelectArea()
 *
 * $ONELINER$
 * Change the current work area
 *
 * $SYNTAX$
 * DbSelectArea( nArea | cAlias ) --> NIL
 *
 * $ARGUMENTS$
 * `nArea` Work-area number, or `cAlias` alias to select.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbSelectArea() changes the selected work area by number or alias. The
 * selected area becomes the target of subsequent database operations.
 *
 * $NOTES$
 * The alias must exist when an alias is supplied.
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
 * Select(), Alias(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbSelectArea( "People" )
   QOut( "Selected: " + Alias() )
   DbCloseArea()

RETURN
