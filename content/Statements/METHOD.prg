/*
 * $DOC$
 * $NAME$
 * METHOD
 *
 * $ONELINER$
 * Declare and implement a class method
 *
 * $SYNTAX$
 * CREATE CLASS idClass
 *    METHOD idMethod( [idParam [, ...]] )
 * ENDCLASS
 *
 * METHOD idMethod( [idParam [, ...]] ) [AS resultType] CLASS idClass
 *    statements...
 *    [RETURN [exp]]
 *
 * $ARGUMENTS$
 * idMethod names the method. idClass identifies its class.
 * The implementation may declare types for parameters and the result.
 *
 * $DESCRIPTION$
 * Call a method with oObject:idMethod( ... ). Self is the current object.
 * Within a method, :: names a member of Self. Use RETURN exp to give the
 * caller a value.
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
 * CREATE CLASS, RETURN, FUNCTION
 *
 * $DOCEND$
 */

CREATE CLASS Ledger
   DATA balance INIT 100
   METHOD Debit( nAmount )
ENDCLASS

METHOD Debit( nAmount ) CLASS Ledger

   IF nAmount <= 0 .OR. nAmount > ::balance
      RETURN .F.
   ENDIF
   ::balance -= nAmount

   RETURN .T.

PROCEDURE Main()

   LOCAL oAccount := Ledger()
   LOCAL nAmount

   FOR EACH nAmount IN { 70, 45, 30 }
      QOut( "Debit", nAmount, "accepted", oAccount:Debit( nAmount ) )
   NEXT
   QOut( "Remaining balance", oAccount:balance )

   RETURN
