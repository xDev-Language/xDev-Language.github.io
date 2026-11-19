/*
 * $DOC$
 * $NAME$
 * DO CASE
 *
 * $ONELINER$
 * Execute one of several alternative blocks of statements
 *
 * $SYNTAX$
 * DO CASE
 * CASE lCondition1
 *    statements...
 * [CASE lCondition2]
 *    statements...
 * [OTHERWISE]
 *    statements...
 * ENDCASE
 *
 * $ARGUMENTS$
 * `CASE lCondition` defines a block of statements executed when
 * `lCondition` is true (.T.).
 * `OTHERWISE` defines a block of statements executed when none of the CASE
 * conditions is true (.T.).
 *
 * $DESCRIPTION$
 * DO CASE ... ENDCASE executes one of several blocks of statements, depending
 * on which condition is true (.T.). It runs the statements after the first
 * CASE whose condition is true, up to the next CASE, OTHERWISE or ENDCASE,
 * and then continues after ENDCASE.
 *
 * When no CASE condition is true, the statements after OTHERWISE are executed
 * up to ENDCASE. Without OTHERWISE, control goes to the statement after
 * ENDCASE.
 *
 * A DO CASE can contain any statements, including other control structures,
 * and any number of CASE blocks.
 *
 * $NOTES$
 * DO CASE ends only with ENDCASE. OTHERWISE must be the last block.
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
 * BEGIN SEQUENCE, DO WHILE, FOR, IF, SWITCH
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aParcel
   LOCAL aQueue := { { .T., 28 }, { .F., 28 }, { .F., 20 }, { .F., 3 } }

   FOR EACH aParcel IN aQueue
      // Damage takes priority even when the parcel also exceeds the limit.
      DO CASE
      CASE aParcel[ 1 ]
         QOut( "Hold for inspection" )
      CASE aParcel[ 2 ] > 20
         QOut( "Freight collection" )
      CASE aParcel[ 2 ] > 5
         QOut( "Courier collection" )
      OTHERWISE
         QOut( "Parcel locker" )
      ENDCASE
   NEXT

   RETURN
