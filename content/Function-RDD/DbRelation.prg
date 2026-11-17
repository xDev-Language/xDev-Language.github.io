/*
 * $DOC$
 * $NAME$
 * DbRelation()
 *
 * $ONELINER$
 * Return the linking expression of a relation
 *
 * $SYNTAX$
 * DbRelation( nRelation ) --> cLinkExp
 *
 * $ARGUMENTS$
 * `nRelation` One-based relation number. Zero selects relation 1.
 *
 * $RETURNS$
 * The relation's linking expression, or an empty string when none exists.
 *
 * $DESCRIPTION$
 * DbRelation() returns the expression used to link the selected relation of
 * the current work area to its child area.
 *
 * $NOTES$
 * It does not change or remove the relation.
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
 * DbRSelect(), DbSetRelation(), DbClearRelation()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   QOut( "Relation: " + DbRelation( 1 ) )

   RETURN
