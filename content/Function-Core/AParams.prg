/*
 * $DOC$
 * $NAME$
 * AParams()
 *
 * $ONELINER$
 * Return all arguments passed to the current routine
 *
 * $SYNTAX$
 * AParams() --> aArguments
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * An array containing the arguments in their original order.
 *
 * $DESCRIPTION$
 * Creates a new array from the arguments supplied to the routine containing
 * the AParams() call. The values keep their original order. An explicitly
 * passed NIL is included. A declared parameter omitted by the caller is not
 * included.
 *
 * $NOTES$
 * The compiler supplies the current routine arguments. AParams() accepts no
 * arguments. Passing an argument is a compile-time error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Argument count: OK
 * First argument: OK
 * Explicit NIL: OK
 * Last argument: OK
 * Omitted parameters: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * PCount(), Array()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aArguments := s_CollectArguments( "first", NIL, 3 )

   s_Check( "Argument count", Len( aArguments ), 3 )
   s_Check( "First argument", aArguments[ 1 ], "first" )
   s_Check( "Explicit NIL", aArguments[ 2 ] == NIL, .T. )
   s_Check( "Last argument", aArguments[ 3 ], 3 )
   s_Check( "Omitted parameters", Len( s_CollectArguments( "only" ) ), 1 )

RETURN

STATIC FUNCTION s_CollectArguments( xFirst, xSecond, xThird )

RETURN AParams()

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
