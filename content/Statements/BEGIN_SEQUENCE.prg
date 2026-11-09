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
 * [BREAK [exp]]
 *    statements...
 * [RECOVER [USING idVar]]
 *    statements...
 * END [SEQUENCE]
 *
 * $ARGUMENTS$
 * `BREAK exp` leaves the sequence and continues after the nearest RECOVER,
 * or after END when there is no RECOVER. `exp` is the value passed to the
 * variable of RECOVER USING.
 * `RECOVER USING idVar` is the recover point of the sequence. `idVar` is a
 * declared variable that receives the value of BREAK; in error handling
 * this is usually an Error object.
 * `END` is the end of the sequence. END SEQUENCE means the same.
 *
 * $DESCRIPTION$
 * BEGIN SEQUENCE ... END is a control structure for exception and runtime
 * error handling. It covers its statements and every procedure and function
 * they call. When a BREAK is executed anywhere in that code, control goes to
 * the statement after RECOVER. Without RECOVER it goes to the statement after
 * END. When the statements reach RECOVER without a BREAK, control goes to the
 * statement after END.
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
 * Before BREAK
 * RECOVER got: stopped
 * After END SEQUENCE
 * Error 1102: Argument error
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

   LOCAL xValue
   LOCAL xNumber := 1
   LOCAL oError
   LOCAL bPrevious

   // BREAK with a value goes to RECOVER USING
   BEGIN SEQUENCE
      QOut( "Before BREAK" )
      BREAK "stopped"
      QOut( "This line is skipped" )
   RECOVER USING xValue
      QOut( "RECOVER got: " + xValue )
   END SEQUENCE

   // without RECOVER, BREAK goes to the statement after END
   BEGIN SEQUENCE
      BREAK
   END SEQUENCE
   QOut( "After END SEQUENCE" )

   // a runtime error becomes a BREAK through the error block
   bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )
   BEGIN SEQUENCE
      Upper( xNumber )
   RECOVER USING oError
      QOut( "Error " + LTrim( Str( oError:SubCode ) ) + ": " + oError:Description )
   END SEQUENCE
   ErrorBlock( bPrevious )

   RETURN
