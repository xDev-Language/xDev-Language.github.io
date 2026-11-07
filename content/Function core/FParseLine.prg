/*
 * $DOC$
 *
 * $NAME$
 * FParseLine()
 *
 * $ONELINER$
 * Parse one CSV record
 *
 * $SYNTAX$
 * FParseLine( cTextLine, [cDelimiter] ) --> aTextFields
 *
 * $ARGUMENTS$
 * cTextLine is one record. cDelimiter defaults to comma and must be one byte other than a double quote.
 *
 * $RETURNS$
 * An array of strings; empty input or malformed quoted syntax gives an empty array.
 *
 * $DESCRIPTION$
 * Parse one CSV record. Quoted fields retain embedded delimiters and decode doubled quotes. After a closing
 * quote, spaces and tabs may precede the delimiter. Unquoted whitespace is preserved. Leading, trailing and
 * repeated delimiters create empty fields. Binary zeroes are retained.
 *
 * $NOTES$
 * Quotes inside unquoted fields, unclosed quotes and junk after closing quotes are malformed data, not
 * exceptions. Wrong argument types or an invalid delimiter raise error 1102. Checks labelled Expected
 * deliberately exercise failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FReadLine(), ATokens()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aData := FParseLine( '"Jones, Mr",Male,"Director, President"' )
   LOCAL aEmpty := FParseLine( ",a,," )
   LOCAL aQuote := FParseLine( '"a""b",c' )
   LOCAL aCustom := FParseLine( "one;two", ";" )
   LOCAL aBinary := FParseLine( "A" + Chr( 0 ) + ",B" )

   s_Check( 'Field count', Len( aData ), 3 )
   s_Check( 'Quoted delimiter', aData[1], "Jones, Mr" )
   s_Check( 'Unquoted field', aData[2], "Male" )
   s_Check( 'Final quoted field', aData[3], "Director, President" )
   s_Check( 'Empty-field count', Len( aEmpty ), 4 )
   s_Check( 'Leading empty field', aEmpty[1], "" )
   s_Check( 'Trailing empty field', aEmpty[4], "" )
   s_Check( 'Escaped quote', aQuote[1], 'a"b' )
   s_Check( 'Custom delimiter', aCustom[2], "two" )
   s_Check( 'Binary data', aBinary[1], "A" + Chr( 0 ) )
   s_Check( 'Empty input', Len( FParseLine( "" ) ), 0 )
   s_Check( 'Malformed quote returns empty', Len( FParseLine( '"unclosed' ) ), 0 )
   s_Check( 'Trailing junk returns empty', Len( FParseLine( '"a"junk' ) ), 0 )
   s_Check( 'Expected delimiter error', s_ErrorCode( {|| FParseLine( "a,b", "||" ) } ), 1102 )
   s_Check( 'Expected type error', s_ErrorCode( {|| FParseLine( 1 ) } ), 1102 )

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
