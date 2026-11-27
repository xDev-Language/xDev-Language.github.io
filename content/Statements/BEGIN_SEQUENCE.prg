/*
 * $DOC$
 * $NAME$
 * BEGIN SEQUENCE
 *
 * $ONELINER$
 * Define a sequence of statements for a BREAK
 *
 * $SYNTAX$
 * BEGIN SEQUENCE
 *    statements...
 * [RECOVER [USING idVar]
 *    statements...]
 * ENDSEQUENCE
 *
 * $ARGUMENTS$
 * `BREAK exp` leaves the sequence and continues after the nearest RECOVER,
 * or after ENDSEQUENCE when there is no RECOVER. `exp` is the value passed to the
 * variable of RECOVER USING.
 * `RECOVER USING idVar` is the recover point of the sequence. `idVar` is a
 * declared variable that receives the value of BREAK; in error handling
 * this is usually an Error object.
 * `ENDSEQUENCE` is the end of the sequence.
 *
 * $DESCRIPTION$
 * BEGIN SEQUENCE ... ENDSEQUENCE is a control structure for exception and runtime
 * error handling. It covers its statements and every procedure and function
 * they call. When a BREAK is executed anywhere in that code, control goes to
 * the statement after RECOVER. Without RECOVER it goes to the statement after
 * ENDSEQUENCE. When the statements reach RECOVER without a BREAK, control goes to the
 * statement after ENDSEQUENCE.
 *
 * A runtime error does not end the sequence by itself. To handle it in the
 * sequence, make the error block pass the Error object to BREAK:
 * ErrorBlock( {| oError | Break( oError ) } ). The object then arrives in the
 * variable of RECOVER USING, where it can be asked for SubCode, Description
 * and the other information about the error.
 *
 * Sequences can be nested, and one function can contain more than one.
 * Each sequence should cover one separate operation.
 *
 * $NOTES$
 * BREAK as a statement and the Break() function do the same.
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
 * Break(), ErrorBlock(), RETURN
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aBatch
   LOCAL nPosted := 0
   LOCAL nPending
   LOCAL nAmount
   LOCAL cReason

   FOR EACH aBatch IN { { 8, 12 }, { 7, -3, 10 }, { 5 } }
      nPending := 0
      BEGIN SEQUENCE
         FOR EACH nAmount IN aBatch
            IF nAmount <= 0
               BREAK "Quantity must be positive"
            ENDIF
            nPending += nAmount
         NEXT
         // Commit only after every line has passed validation.
         nPosted += nPending
      RECOVER USING cReason
         QOut( "Rejected batch", cReason )
      ENDSEQUENCE
      QOut( "Posted so far", nPosted )
   NEXT

   RETURN
