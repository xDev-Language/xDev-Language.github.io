/*
 * $DOC$
 * $NAME$
 * Dbf()
 *
 * $ONELINER$
 * Return the alias of the current work area
 *
 * $SYNTAX$
 * Dbf() --> cAlias
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The alias of the current work area, or an empty string when no area is open.
 *
 * $DESCRIPTION$
 * Dbf() is an alias for Alias(). It returns the alias assigned to the current
 * work area without changing the selection.
 *
 * $NOTES$
 * The returned text is in uppercase when the alias was created in the usual RDD form.
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
 * Alias(), Select(), Used()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "dbf_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "dbf_demo.dbf", "People" )
   QOut( "Alias: " + Dbf() )
   DbCloseArea()
   FErase( "dbf_demo.dbf" )

RETURN
