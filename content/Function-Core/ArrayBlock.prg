/*
 * $DOC$
 * $NAME$
 * ArrayBlock()
 *
 * $ONELINER$
 * Create a set/get code block for an array element
 *
 * $SYNTAX$
 * ArrayBlock( aArray, nIndex ) --> bAccessor
 *
 * $ARGUMENTS$
 * aArray is the array retained by the returned block. nIndex is the one-based
 * position accessed by the block.
 *
 * $RETURNS$
 * A code block bound to the selected array element.
 *
 * $DESCRIPTION$
 * Evaluating the returned block without an argument reads the element.
 * Evaluating it with one argument assigns that value to the element and
 * returns the assigned value.
 *
 * $NOTES$
 * The block keeps the array and index used when it was created. Normal array
 * index rules apply when the block is evaluated.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Read element: OK
 * Assigned value: OK
 * Array changed: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Eval(), Array()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aNames := { "Ada" }
   LOCAL bName  := ArrayBlock( aNames, 1 )

   s_Check( "Read element", Eval( bName ), "Ada" )
   s_Check( "Assigned value", Eval( bName, "Grace" ), "Grace" )
   s_Check( "Array changed", aNames[ 1 ], "Grace" )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
