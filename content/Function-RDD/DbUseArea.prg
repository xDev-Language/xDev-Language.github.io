/*
 * $DOC$
 * $NAME$
 * DbUseArea()
 *
 * $ONELINER$
 * Open a database file in a work area
 *
 * $SYNTAX$
 * DbUseArea( [lNewArea], [cDriver], cName, [xcAlias], [lShared], [lReadonly], [nConnection], [aIndexBindings] ) --> NIL
 *
 * $ARGUMENTS$
 * `lNewArea` Opens a new area. `cDriver` Optional RDD. `cName` File name.
 * `xcAlias` Alias. `lShared` Sharing mode. `lReadonly` Read-only mode.
 * Remaining arguments select connection and index bindings.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbUseArea() resolves the requested RDD, opens cName, assigns an alias and
 * installs the file in a work area. With lNewArea true it allocates a new
 * area; otherwise it closes the file already selected in the current area
 * before opening the new one. cDriver selects the RDD, while an omitted driver
 * uses the default RDD. lShared controls sharing and lReadonly prevents writes.
 * An index-binding array can attach known indexes during the open operation.
 * The opened area becomes selected and its record pointer starts at the first
 * visible record when one exists. DbUseArea() does not copy records or alter
 * another area when lNewArea is true.
 *
 * $NOTES$
 * The file must exist, use UTF-8 names, and be readable by the selected RDD.
 * Invalid driver names, aliases, connections, index bindings or file access
 * raise a runtime error. A sharing conflict can set NetErr(). Use
 * DbCloseArea() when finished; DbUseArea() differs from DbCreate() because it
 * opens an existing file instead of defining a new structure.
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
 * DbCloseArea(), Alias(), Used()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Open: " + Alias() + " / " + IIF( Used(), "YES", "NO" ) )
   DbCloseArea()

RETURN
