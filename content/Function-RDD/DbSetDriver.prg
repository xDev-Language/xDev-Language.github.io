/*
 * $DOC$
 * $NAME$
 * DbSetDriver()
 *
 * $ONELINER$
 * Return or set the default database driver
 *
 * $SYNTAX$
 * DbSetDriver( [cDriver] ) --> cCurrentDriver
 *
 * $ARGUMENTS$
 * `cDriver` Optional new default driver name.
 *
 * $RETURNS$
 * The current driver before any new setting is applied.
 *
 * $DESCRIPTION$
 * DbSetDriver() reads the default RDD name and can replace it when cDriver is
 * supplied. The default is used by database operations that omit a driver.
 *
 * $NOTES$
 * The named driver must be registered.
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
 * RddSetDefault(), DbUseArea()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Driver: " + DbSetDriver() )

RETURN
