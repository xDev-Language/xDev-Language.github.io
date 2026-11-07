/*
 * $DOC$
 * $NAME$
 * AEval()
 *
 * $ONELINER$
 * Execute a code block for each element in an array
 *
 * $SYNTAX$
 * AEval( aArray, bBlock, [nStart], [nCount] ) --> aArray
 *
 * $ARGUMENTS$
 * aArray
 * bBlock
 * nStart
 * nCount
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
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
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aPrices := { 4.50, 3.20, 8.99 }
   LOCAL nTotal  := 0
   LOCAL cList   := ""

   AEval( aPrices, {| nPrice | nTotal += nPrice } )
   Check( 'nTotal                         ', nTotal, 16.69 )

   AEval( { "a", "b", "c" }, {| cItem, nPos | cList += Str( nPos, 1 ) + cItem } )
   Check( 'cList                          ', cList, "1a2b3c" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
