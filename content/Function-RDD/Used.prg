/* $DOC$
 * $NAME$
 * Used()
 * $ONELINER$ Determine whether a database file is open
 * $SYNTAX$ Used() --> lDbfOpen
 * $ARGUMENTS$ None.
 * $RETURNS$ `.T.` when the current work area is open.
 * $DESCRIPTION$ Used() reports whether the current work area contains an open database file.
 * $NOTES$ It does not change the selected area.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ DbUseArea(), DbCloseArea(), Alias()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Used: " + IIF( Used(), "YES", "NO" ) )
   DbCloseArea()

RETURN
