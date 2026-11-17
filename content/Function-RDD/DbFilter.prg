/*
 * $DOC$
 * $NAME$
 * DbFilter()
 *
 * $ONELINER$
 * Return the current filter expression
 *
 * $SYNTAX$
 * DbFilter() --> cFilter
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The filter expression as text, or an empty string when no filter is active.
 *
 * $DESCRIPTION$
 * DbFilter() returns the expression currently restricting records in the
 * current work area. It does not evaluate or change the filter.
 *
 * $NOTES$
 * With no open work area, the result is an empty string.
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
 * DbSetFilter(), DbClearFilter(), DbLocate()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Filter: " + IIF( Empty( DbFilter() ), "EMPTY", DbFilter() ) )

   RETURN
