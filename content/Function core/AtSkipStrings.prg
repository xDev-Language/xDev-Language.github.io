/*
 * $DOC$
 * $NAME$
 * AtSkipStrings()
 *
 * $ONELINER$
 * Find a byte sequence outside quoted parts of a string
 *
 * $SYNTAX$
 * AtSkipStrings( cSearch, cString ) --> nPos
 *
 * $ARGUMENTS$
 * `cSearch`: the exact, case-sensitive byte sequence to find.
 * `cString`: the text to search.
 *
 * $RETURNS$
 * The first matching byte position, counted from 1 in the complete string,
 * or 0 if no match exists. An empty search string returns 0.
 *
 * $DESCRIPTION$
 * Searches from left to right, skipping parts enclosed in single quotes,
 * double quotes or square brackets. The opening and closing delimiters are
 * excluded from searching. A match must lie entirely in an unquoted part.
 * A quote is closed only by its matching delimiter. Other delimiters inside
 * that quoted part have no special meaning. Square brackets do not nest.
 * If a closing delimiter is missing, the remainder of the text is skipped.
 * Backslashes have no escape meaning in the text being searched.
 *
 * $NOTES$
 * Positions count bytes, including Chr(0), rather than Unicode characters.
 * Neither argument is changed. Missing or non-string arguments raise error
 * 1102. The deliberately invalid calls below must raise that error;
 * s_ErrorCode() catches it so the example can continue.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Plain match: OK
 * Double quotes: OK
 * Single quotes: OK
 * Brackets: OK
 * Only quoted: OK
 * Before quote: OK
 * Empty quoted part: OK
 * Other quotes inside brackets: OK
 * All quote styles: OK
 * No crossing delimiters: OK
 * Unclosed double quote: OK
 * Unclosed bracket: OK
 * Case sensitive: OK
 * Empty search: OK
 * Empty text: OK
 * Longer search: OK
 * Binary data: OK
 * UTF-8 byte position: OK
 * Expected error: search type: OK
 * Expected error: text type: OK
 * Expected error: missing text: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * At(), RAt(), SubStr(), ATokens()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Plain match', AtSkipStrings( "abc", "12abc" ), 3 )
   s_Check( 'Double quotes', AtSkipStrings( "abc", '"abc"12abc' ), 8 )
   s_Check( 'Single quotes', AtSkipStrings( "abc", "'abc'12abc" ), 8 )
   s_Check( 'Brackets', AtSkipStrings( "abc", "[abc]12abc" ), 8 )
   s_Check( 'Only quoted', AtSkipStrings( "abc", '"abc"' ), 0 )
   s_Check( 'Before quote', AtSkipStrings( "abc", 'abc"abc"' ), 1 )
   s_Check( 'Empty quoted part', AtSkipStrings( "abc", '""abc' ), 3 )
   s_Check( 'Other quotes inside brackets', AtSkipStrings( "abc", '["abc"]abc' ), 8 )
   s_Check( 'All quote styles', AtSkipStrings( ";", '";"' + "';'" + '[;];' ), 10 )
   s_Check( 'No crossing delimiters', AtSkipStrings( 'a"b', 'a"b"' ), 0 )
   s_Check( 'Unclosed double quote', AtSkipStrings( "abc", '12"abc' ), 0 )
   s_Check( 'Unclosed bracket', AtSkipStrings( "abc", '12[abc' ), 0 )
   s_Check( 'Case sensitive', AtSkipStrings( "ABC", "abc" ), 0 )
   s_Check( 'Empty search', AtSkipStrings( "", "abc" ), 0 )
   s_Check( 'Empty text', AtSkipStrings( "a", "" ), 0 )
   s_Check( 'Longer search', AtSkipStrings( "abcd", "abc" ), 0 )
   s_Check( 'Binary data', AtSkipStrings( Chr( 0 ), '"' + Chr( 0 ) + '"' + Chr( 0 ) ), 4 )
   s_Check( 'UTF-8 byte position', AtSkipStrings( "x", "ąx" ), 3 )
   s_Check( 'Expected error: search type', s_ErrorCode( {|| AtSkipStrings( 1, "abc" ) } ), 1102 )
   s_Check( 'Expected error: text type', s_ErrorCode( {|| AtSkipStrings( "a", NIL ) } ), 1102 )
   s_Check( 'Expected error: missing text', s_ErrorCode( {|| AtSkipStrings( "a" ) } ), 1102 )

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
