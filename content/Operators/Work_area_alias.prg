/*
 * $DOC$
 * $NAME$
 * Work area alias (->)
 *
 * $ONELINER$
 * Read or write a field in the named work area.
 *
 * $SYNTAX$
 * alias->field
 * FIELD->field
 * alias->( expression )
 *
 * $DESCRIPTION$
 * Read or write a field in the named work area. FIELD selects the current area. Parentheses after the arrow evaluate an expression in the selected area. Parentheses around an alias variable use its value as the work area selector.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nOriginal := Select()
   LOCAL nArea

   // Inspect two areas and show which area is current after each expression.
   FOR EACH nArea IN { 1, 2 }
      QOut( "Inside selected area", ( nArea )->( Select() ) )
      QOut( "Back in original area", Select() == nOriginal )
   NEXT

   RETURN
