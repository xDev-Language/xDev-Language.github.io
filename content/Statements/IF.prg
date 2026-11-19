/*
 * $DOC$
 * $NAME$
 * IF
 *
 * $ONELINER$
 * Execute a block when a logical condition is true
 *
 * $SYNTAX$
 * IF lCondition
 *    statements...
 * [ELSEIF lOther
 *    statements...] ...
 * [ELSE
 *    statements...]
 * ENDIF
 *
 * $ARGUMENTS$
 * Each condition must produce a logical value.
 *
 * $DESCRIPTION$
 * Conditions are evaluated in order. The first true condition selects its block.
 * ELSE runs when every condition is false. Execution continues after ENDIF
 * when the selected block finishes or when no block is selected.
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
 * DO CASE, SWITCH
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nFree := 10
   LOCAL nRequest

   FOR EACH nRequest IN { -2, 6, 5, 4 }
      IF nRequest <= 0
         QOut( "Invalid quantity", nRequest )
      ELSEIF nRequest > nFree
         QOut( "Short by", nRequest - nFree )
      ELSE
         nFree -= nRequest
         QOut( "Reserved", nRequest, "remaining", nFree )
      ENDIF
   NEXT

   RETURN
