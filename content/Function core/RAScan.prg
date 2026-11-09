/*
 * $DOC$
 *
 * $NAME$
 * RAScan()
 *
 * $ONELINER$
 * Search an array from a starting position towards the first element
 *
 * $SYNTAX$
 * RAScan( aArray, xbSearch, [nStart], [nCount], [lExact], [lASCII] ) --> nPosition
 *
 * $ARGUMENTS$
 * aArray is searched for xbSearch, a value or predicate block. nStart defaults to the last element; nCount
 * defaults to nStart. lExact defaults to .F. and lASCII to .F..
 *
 * $RETURNS$
 * The matched array position, or 0 when not found or the range is empty.
 *
 * $DESCRIPTION$
 * Search proceeds backwards, including nStart. nCount limits the number of inspected elements and is clamped at
 * the beginning of the array. An out-of-range nStart or non-positive nCount returns 0. A predicate receives the
 * element and its original index, as in AScan(). Value comparisons follow AScan(), including Set( _SET_EXACT ) when
 * lExact is false. With lASCII true, a one-byte string can match its numeric byte code in either direction.
 *
 * $NOTES$
 * The array and search value are retained while a callback runs. The callback may modify the array; positions
 * no longer present are skipped. Numeric range arguments use their integer part. Wrong argument types or a
 * missing search value raise error 1102. Deliberately invalid calls in the example must produce the stated
 * error code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Last matching value: OK
 * Limited start: OK
 * Limited count: OK
 * Predicate index: OK
 * Not found: OK
 * Empty array: OK
 * Zero count: OK
 * Start beyond end: OK
 * NIL value: OK
 * Exact text: OK
 * ASCII disabled: OK
 * ASCII enabled: OK
 * ASCII reverse types: OK
 * Array identity: OK
 * Expected argument error: OK
 * Expected missing search error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * AScan(), ATail(), AEval()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aValues := { 1, 2, 1, 3 }
   LOCAL aSame := { 1 }

   s_Check( 'Last matching value', RAScan( aValues, 1 ), 3 )
   s_Check( 'Limited start', RAScan( aValues, 1, 2 ), 1 )
   s_Check( 'Limited count', RAScan( aValues, 1, 2, 1 ), 0 )
   s_Check( 'Predicate index', RAScan( aValues, {| x, i | x == 1 .AND. i > 1 } ), 3 )
   s_Check( 'Not found', RAScan( aValues, 9 ), 0 )
   s_Check( 'Empty array', RAScan( {}, 1 ), 0 )
   s_Check( 'Zero count', RAScan( aValues, 1, 4, 0 ), 0 )
   s_Check( 'Start beyond end', RAScan( aValues, 1, 5 ), 0 )
   s_Check( 'NIL value', RAScan( { 1, NIL, 2 }, NIL ), 2 )
   s_Check( 'Exact text', RAScan( { "ab", "abc" }, "ab", NIL, NIL, .T. ), 1 )
   s_Check( 'ASCII disabled', RAScan( { "A" }, 65 ), 0 )
   s_Check( 'ASCII enabled', RAScan( { "A" }, 65, NIL, NIL, NIL, .T. ), 1 )
   s_Check( 'ASCII reverse types', RAScan( { 65 }, "A", NIL, NIL, NIL, .T. ), 1 )
   s_Check( 'Array identity', RAScan( { {}, aSame }, aSame, NIL, NIL, .T. ), 2 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| RAScan( 1, 1 ) } ), 1102 )
   s_Check( 'Expected missing search error', s_ErrorCode( {|| RAScan( aValues ) } ), 1102 )

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
