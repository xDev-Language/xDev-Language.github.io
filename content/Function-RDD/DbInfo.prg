/*
 * $DOC$
 * $NAME$
 * DbInfo()
 *
 * $ONELINER$
 * Return or change information about an open database file
 *
 * $SYNTAX$
 * DbInfo( nInfoType, [expNewSetting] ) --> uCurrentSetting
 *
 * $ARGUMENTS$
 * `nInfoType` Information selector. `expNewSetting` Optional setting supported by the selector.
 *
 * $RETURNS$
 * The selected current setting or information value.
 *
 * $DESCRIPTION$
 * DbInfo() queries information about the database file in the current work
 * area. Some selectors also accept a new setting and return the previous value.
 *
 * $NOTES$
 * Selector constants are defined by the RDD headers. A work area must be open.
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
 * DbFieldInfo(), RddInfo(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( DbInfo( 1 ) )
   DbCloseArea()

   RETURN
