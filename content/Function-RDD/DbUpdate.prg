/*
 * $DOC$
 * $NAME$
 * DbUpdate()
 *
 * $ONELINER$
 * Update records from another work area
 *
 * $SYNTAX$
 * DbUpdate( cAlias, bKey, lRandom, bAction ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cAlias` Source alias. `bKey` Matching-key block. `lRandom` Random matching mode.
 * `bAction` Block applied to a matching destination record.
 *
 * $RETURNS$
 * `.T.` when the update completes; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbUpdate() scans the current destination area and searches cAlias for a
 * matching source record using bKey. For every match it evaluates bAction in
 * the destination context. lRandom selects random matching rather than the
 * sequential update strategy. The destination pointer is traversed during the
 * operation and the source area is temporarily selected as needed; callers
 * should not depend on either pointer remaining unchanged.
 *
 * $NOTES$
 * Both work areas must be open and writable where bAction assigns fields.
 * Missing aliases, invalid blocks, incompatible key values or file errors raise
 * a runtime error. DbUpdate() changes existing records; DbJoin() creates a new
 * file and DbSetRelation() only maintains navigation between areas.
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
 * DbJoin(), DbSetRelation(), DbEval()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "target.dbf", "Target" )
   DbUseArea( .T., , "source.dbf", "Source" )
   DbSelectArea( "Target" )
   QOut( "Updated: " + IIF( DbUpdate( "Source", {|| FIELD->ID }, .F., {|| NIL } ), "YES", "NO" ) )
   DbCloseAll()

RETURN
