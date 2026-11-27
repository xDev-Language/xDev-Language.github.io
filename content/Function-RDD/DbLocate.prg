/*
 * $DOC$
 * $NAME$
 * DbLocate()
 *
 * $ONELINER$
 * Search sequentially for a matching record
 *
 * $SYNTAX$
 * DbLocate( [bForCondition], [bWhileCondition], [nNextRecords], [nRecord], [lRest] ) --> NIL
 *
 * $ARGUMENTS$
 * `bForCondition` Match block. `bWhileCondition` Stop block.
 * `nNextRecords`, `nRecord`, `lRest` Limit the search scope.
 *
 * $RETURNS$
 * NIL. FOUND() reports whether a matching record was found.
 *
 * $DESCRIPTION$
 * DbLocate() scans records in the current work area until the FOR condition
 * succeeds or the selected scope ends. On success, the matching record becomes current.
 *
 * $NOTES$
 * DbContinue() resumes a locate search after the current match.
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
 * DbContinue(), Found(), DbGoTop()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbLocate( {|| FIELD->NAME == "Anna" } )
   QOut( Found() )
   DbCloseArea()

   RETURN
