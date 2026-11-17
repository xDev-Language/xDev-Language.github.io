/*
 * $DOC$
 * $NAME$
 * Alias()
 *
 * $ONELINER$
 * Return a specified work area alias
 *
 * $SYNTAX$
 * Alias( [nWorkArea] ) --> cAlias
 *
 * $ARGUMENTS$
 * nWorkArea
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "alias_demo.dbf", { { "NAME", "C", 20, 0 } } )
   DbUseArea( .T., , "alias_demo.dbf", "Staff" )

   QOut( "Current alias: " + Alias() )
   QOut( "Alias by area: " + Alias( Select() ) )

   DbCloseArea()
   QOut( "After close: " + IIF( Used(), "OPEN", "CLOSED" ) )
   FErase( "alias_demo.dbf" )

RETURN
