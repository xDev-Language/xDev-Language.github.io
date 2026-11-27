/*
 * $DOC$
 * $NAME$
 * DbJoin()
 *
 * $ONELINER$
 * Create a file by merging records from two work areas
 *
 * $SYNTAX$
 * DbJoin( cAlias, cFile, [aFields], [bFor] ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cAlias` Alias of the second work area. `cFile` Destination file.
 * `aFields` Optional fields to copy. `bFor` Optional condition block.
 *
 * $RETURNS$
 * `.T.` when the joined file is created successfully; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbJoin() combines records from the current work area and the work area named
 * by cAlias, writing matching combinations to a new database file.
 *
 * $NOTES$
 * Both source areas must be open. The current selection remains available afterward.
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
 * DbCopy(), DbUseArea(), DbEval()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbUseArea( .T., , "cities.dbf", "Cities" )
   QOut( "Joined: " + IIF( DbJoin( "Cities", "joined.dbf" ), "YES", "NO" ) )
   DbCloseAll()
   FErase( "joined.dbf" )

   RETURN
