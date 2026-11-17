/* $DOC$
 * $NAME$ OrdListRebuild()
 * $ONELINER$ Rebuild all orders in the order list
 * $SYNTAX$ OrdListRebuild() --> NIL
 * $ARGUMENTS$ None.
 * $RETURNS$ NIL.
 * $DESCRIPTION$ Rebuilds every order currently loaded in the current work area.
 * $NOTES$ The index files must be writable.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ OrdListClear(), DbReindex(), OrdCreate()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   OrdListRebuild()
   QOut( "Orders rebuilt" )
   DbCloseArea()

RETURN
