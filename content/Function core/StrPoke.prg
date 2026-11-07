/*
 * $DOC$
 *
 * $NAME$
 * StrPoke()
 *
 * $ONELINER$
 * Replace one byte in a string
 *
 * $SYNTAX$
 * StrPoke( cString, nPos, nASCII ) --> cString
 *
 * $ARGUMENTS$
 * `cString`: byte string to copy and modify. Pass it by reference to update the caller variable as well.
 * `nPos`: byte position counted from 1; its fractional part is discarded towards zero.
 * `nASCII`: numeric byte code from 0 to 255; its fractional part is discarded after range checking.
 *
 * $RETURNS$
 * The string after replacing the byte, or the original contents for an invalid position.
 *
 * $DESCRIPTION$
 * Returns a copy with one byte replaced. The string length is unchanged and the replacement may be Chr(0). A position outside the string leaves its contents unchanged.
 * Passing cString by value leaves the original variable unchanged. Passing @cString also stores the result in that variable. Other variables holding the old string retain their contents.
 *
 * $NOTES$
 * Positions count bytes, so modifying a byte inside a UTF-8 character may produce invalid UTF-8. Use this function for binary data or when the byte position is known.
 * Wrong argument types, missing arguments or a byte code outside 0..255 raise error 1102. The deliberate errors in the example are caught and verified.
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
 * StrPeek(), Chr(), Stuff()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cOriginal := "ABC"
   LOCAL cCopy := cOriginal
   LOCAL cResult

   s_Check( 'Replace first', StrPoke( "ABC", 1, 88 ), "XBC" )
   s_Check( 'Replace last', StrPoke( "ABC", 3, 90 ), "ABZ" )
   s_Check( 'Fractional position', StrPoke( "ABC", 1.9, 88 ), "XBC" )
   s_Check( 'Fractional byte', StrPoke( "ABC", 2, 88.9 ), "AXC" )
   s_Check( 'Unsigned byte', StrPoke( "A", 1, 255 ), Chr( 255 ) )
   s_Check( 'Empty string', StrPoke( "", 1, 65 ), "" )
   s_Check( 'Zero position', StrPoke( "ABC", 0, 88 ), "ABC" )
   s_Check( 'Beyond end', StrPoke( "ABC", 4, 88 ), "ABC" )
   s_Check( 'Huge position', StrPoke( "ABC", 1e30, 88 ), "ABC" )
   cResult := StrPoke( cOriginal, 2, 88 )
   s_Check( 'By-value result', cResult, "AXC" )
   s_Check( 'Original preserved', cOriginal, "ABC" )
   cResult := StrPoke( @cOriginal, 2, 0 )
   s_Check( 'By-reference result', cResult, "A" + Chr( 0 ) + "C" )
   s_Check( 'Reference updated', cOriginal, cResult )
   s_Check( 'Old copy preserved', cCopy, "ABC" )
   s_Check( 'Length preserved', Len( cOriginal ), 3 )
   s_Check( 'Expected error: negative byte', s_ErrorCode( {|| StrPoke( "ABC", 1, -1 ) } ), 1102 )
   s_Check( 'Expected error: excessive byte', s_ErrorCode( {|| StrPoke( "ABC", 1, 256 ) } ), 1102 )
   s_Check( 'Expected error: text type', s_ErrorCode( {|| StrPoke( 1, 1, 65 ) } ), 1102 )
   s_Check( 'Expected error: missing byte', s_ErrorCode( {|| StrPoke( "ABC", 1 ) } ), 1102 )

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
