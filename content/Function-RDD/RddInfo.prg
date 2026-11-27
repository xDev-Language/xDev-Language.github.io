/* $DOC$
 * $NAME$
 * RddInfo()
 * $ONELINER$
 * Return or change information about a database driver
 * $SYNTAX$
 * RddInfo( nInfoType, [expNewSetting], [cDriver], [nConnection] ) --> uCurrentSetting
 * $ARGUMENTS$
 * Selector, optional setting, driver name and connection number.
 * $RETURNS$
 * Selected driver information or previous setting.
 * $DESCRIPTION$
 * Queries driver-level settings such as lock scheme or retry count.
 * $NOTES$
 * Selector constants are defined in the RDD headers.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$
 * Functions RDD
 * $HEADER$
 * $SEEALSO$
 * RddList(), RddName(), RddSetDefault()
 * $DOCEND$
 * */

PROCEDURE Main()

   QOut( "Driver setting type: " + ValType( RddInfo( 1 ) ) )

RETURN
