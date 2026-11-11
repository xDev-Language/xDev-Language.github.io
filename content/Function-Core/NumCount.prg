/*
 * $DOC$
 *
 * $NAME$
 * NumCount()
 *
 * $ONELINER$
 * Read, set or increment a shared integer counter
 *
 * $SYNTAX$
 * NumCount( [nValue], [lIsStart] ) --> nCounter
 *
 * $ARGUMENTS$
 * `nValue`: signed 64-bit numeric value; omitted or NIL means 0. A fractional part is discarded towards zero.
 * `lIsStart`: .T. sets the counter to nValue; .F., NIL or omission adds nValue to it.
 *
 * $RETURNS$
 * The signed 64-bit counter value after the requested operation.
 *
 * $DESCRIPTION$
 * Maintains one counter shared by all calls in the program, initially 0. A call without arguments reads its current value. Every successful call returns the value after setting or adding.
 * The counter is not a local variable and is not a loop index. To restart it explicitly, use NumCount( 0, .T. ).
 *
 * $NOTES$
 * Wrong argument types raise error 1102. An input outside the signed 64-bit range or an overflowing increment raises error 3106. An error leaves the existing counter unchanged. The example verifies deliberate errors and restores the counter to 0.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Initially zero: OK
 * Set: OK
 * Increment: OK
 * Decrement: OK
 * Read: OK
 * Fraction discarded: OK
 * NIL increment: OK
 * Expected error: input type: OK
 * Expected error: mode type: OK
 * Errors preserve counter: OK
 * Set maximum: OK
 * Expected overflow: OK
 * Overflow preserves counter: OK
 * Set minimum: OK
 * Expected underflow: OK
 * Underflow preserves counter: OK
 * Expected excessive input: OK
 * Reset with NIL: OK
 * Read reset counter: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * PCount()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Initially zero', NumCount(), 0 )
   s_Check( 'Set', NumCount( 10, .T. ), 10 )
   s_Check( 'Increment', NumCount( 5 ), 15 )
   s_Check( 'Decrement', NumCount( -3 ), 12 )
   s_Check( 'Read', NumCount(), 12 )
   s_Check( 'Fraction discarded', NumCount( 2.9 ), 14 )
   s_Check( 'NIL increment', NumCount( NIL ), 14 )
   s_Check( 'Expected error: input type', s_ErrorCode( {|| NumCount( "1" ) } ), 1102 )
   s_Check( 'Expected error: mode type', s_ErrorCode( {|| NumCount( 1, 1 ) } ), 1102 )
   s_Check( 'Errors preserve counter', NumCount(), 14 )
   s_Check( 'Set maximum', NumCount( 9223372036854775807, .T. ), 9223372036854775807 )
   s_Check( 'Expected overflow', s_ErrorCode( {|| NumCount( 1 ) } ), 3106 )
   s_Check( 'Overflow preserves counter', NumCount(), 9223372036854775807 )
   s_Check( 'Set minimum', NumCount( -9223372036854775807 - 1, .T. ), -9223372036854775807 - 1 )
   s_Check( 'Expected underflow', s_ErrorCode( {|| NumCount( -1 ) } ), 3106 )
   s_Check( 'Underflow preserves counter', NumCount(), -9223372036854775807 - 1 )
   s_Check( 'Expected excessive input', s_ErrorCode( {|| NumCount( 1e30 ) } ), 3106 )
   s_Check( 'Reset with NIL', NumCount( NIL, .T. ), 0 )
   s_Check( 'Read reset counter', NumCount(), 0 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN

STATIC FUNCTION s_ErrorCode( bAction )

   LOCAL nCode := 0
   LOCAL oError
   LOCAL bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER USING oError
      nCode := oError:SubCode
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
