/* $DOC$
 * $NAME$
 * RddName()
 * $ONELINER$
 * Return the driver name of the current work area
 * $SYNTAX$
 * RddName() --> cRDDName
 * $ARGUMENTS$
 * None.
 * $RETURNS$
 * Active RDD name.
 * $DESCRIPTION$
 * Returns the driver name used by the current work area.
 * $NOTES$
 * A work area must be open.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * RddList(), RddInfo(), DbUseArea()
 * $DOCEND$
 * */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "RDD: " + RddName() )
   DbCloseArea()

RETURN
