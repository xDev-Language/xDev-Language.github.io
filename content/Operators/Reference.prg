/*
 * $DOC$
 * $NAME$
 * Reference (@)
 *
 * $ONELINER$
 * Pass a variable by reference so the callee can change its value.
 *
 * $SYNTAX$
 * Routine( @variable )
 * @idFunction()
 *
 * $DESCRIPTION$
 * Pass a variable by reference so the callee can change its value. In a native callback context, @idFunction() supplies the address of a function with the required signature.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nBalance := 80
   LOCAL nCharge

   FOR EACH nCharge IN { 30, 60 }
      IF Reserve( @nBalance, nCharge )
         QOut( "Reserved", nCharge )
      ELSE
         QOut( "Declined", nCharge )
      ENDIF
      QOut( "Available", nBalance )
   NEXT

   RETURN

STATIC FUNCTION Reserve( nAvailable, nAmount )

   IF nAmount > nAvailable
      RETURN .F.
   ENDIF
   nAvailable -= nAmount

   RETURN .T.
