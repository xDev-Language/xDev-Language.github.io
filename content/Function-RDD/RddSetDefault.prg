/* $DOC$
 * $NAME$ RddSetDefault()
 * $ONELINER$ Return or set the default RDD
 * $SYNTAX$ RddSetDefault( [cNewDefaultRDD] ) --> cPreviousDefaultRDD
 * $ARGUMENTS$ Optional new driver name.
 * $RETURNS$ Previous default driver name.
 * $DESCRIPTION$ Reads or changes the driver selected when database operations omit a driver.
 * $NOTES$ The driver must be registered.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ RddName(), DbSetDriver(), RddList()
 * $DOCEND$ */

PROCEDURE Main()

   QOut( "Default RDD: " + RddSetDefault() )

RETURN
