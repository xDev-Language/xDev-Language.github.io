/* $DOC$
 * $NAME$
 * Select()
 * $ONELINER$ Return the selected work-area number
 * $SYNTAX$ Select( [cAlias] ) --> nWorkArea
 * $ARGUMENTS$ Optional alias to look up.
 * $RETURNS$ Selected area number, or area number of the alias.
 * $DESCRIPTION$ Select() reports the current work-area number or resolves an alias to its number.
 * $NOTES$ An unknown alias returns zero.
 * $EXAMPLES$
 * $OUTPUT$
 * $CATEGORY$ Functions RDD
 * $HEADER$
 * $SEEALSO$ DbSelectArea(), Alias(), Used()
 * $DOCEND$ */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Selected area: " + LTrim( Str( Select() ) ) )
   DbCloseArea()

RETURN
