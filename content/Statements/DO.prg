/*
 * $DOC$
 * $NAME$
 * DO
 *
 * $ONELINER$
 * Call a routine using statement syntax
 *
 * $SYNTAX$
 * DO idRoutine [WITH exp1 [, exp2 ...]]
 *
 * $ARGUMENTS$
 * idRoutine names the routine. WITH supplies arguments in order. Use @idVar
 * to pass a variable by reference. An empty argument slot passes NIL.
 *
 * $DESCRIPTION$
 * DO calls the named routine and discards its result. When the routine
 * returns, execution continues with the following statement.
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
 * PROCEDURE, FUNCTION, RETURN
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nStock := 12
   LOCAL nOrder

   FOR EACH nOrder IN { 5, 9, 7 }
      DO Reserve WITH @nStock, nOrder
   NEXT
   QOut( "Closing stock", nStock )

   RETURN

STATIC PROCEDURE Reserve( nAvailable, nRequested )

   IF nRequested > nAvailable
      QOut( "Short by", nRequested - nAvailable )
      RETURN
   ENDIF
   nAvailable -= nRequested
   QOut( "Reserved", nRequested )

   RETURN
