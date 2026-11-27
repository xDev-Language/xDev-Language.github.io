/*
 * $DOC$
 * $NAME$
 * DbRSelect()
 *
 * $ONELINER$
 * Return the target work area of a relation
 *
 * $SYNTAX$
 * DbRSelect( nRelation ) --> nWorkArea
 *
 * $ARGUMENTS$
 * `nRelation` One-based relation number. Zero selects relation 1.
 *
 * $RETURNS$
 * The child work-area number, or 0 when no such relation exists.
 *
 * $DESCRIPTION$
 * DbRSelect() returns the work-area number targeted by a relation from the
 * current work area.
 *
 * $NOTES$
 * It does not change the selected work area.
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
 * DbRelation(), DbSetRelation(), Select()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Related work area: " + LTrim( Str( DbRSelect( 1 ) ) ) )

   RETURN
