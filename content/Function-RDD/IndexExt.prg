/*
 * $DOC$
 * $NAME$
 * IndexExt()
 *
 * $ONELINER$
 * Return the default index-file extension
 *
 * $SYNTAX$
 * IndexExt() --> cExtension
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Extension used by the linked database driver.
 *
 * $DESCRIPTION$
 * IndexExt() returns the default filename extension used for index files by the current RDD.
 *
 * $NOTES$
 * The extension does not include a leading period.
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
 * OrdBagExt(), DbCreateIndex(), DbSetIndex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Index extension: " + IndexExt() )

RETURN
