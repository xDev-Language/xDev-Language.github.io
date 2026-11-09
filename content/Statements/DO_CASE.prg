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
 * and any number of CASE blocks. DO CASE ... ENDCASE works the same as
 * IF ... ELSEIF ... ENDIF; neither form has an advantage over the other.
 *
 * $NOTES$
 * DO CASE ends only with ENDCASE. OTHERWISE must be the last block.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * 0: no choice
 * 1: first choice
 * 2: second choice
 * 7: unknown choice
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

   LOCAL nChoice

   FOR EACH nChoice IN { 0, 1, 2, 7 }
      QOut( LTrim( Str( nChoice ) ) + ": " + s_Describe( nChoice ) )
   NEXT

   RETURN

STATIC FUNCTION s_Describe( nChoice )

   LOCAL cText

   DO CASE
   CASE nChoice == 0
      cText := "no choice"
   CASE nChoice == 1
      cText := "first choice"
   CASE nChoice == 2
      cText := "second choice"
   OTHERWISE
      cText := "unknown choice"
   ENDCASE

   RETURN cText
