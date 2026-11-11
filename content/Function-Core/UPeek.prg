/*
 * $DOC$
 * $NAME$
 * UPeek()
 *
 * $ONELINER$
 * Read the Unicode scalar value at a character position in a UTF-8 string
 *
 * $SYNTAX$
 * UPeek( cString, nPosition ) --> nCodepoint
 *
 * $ARGUMENTS$
 * cString
 * The required UTF-8 character string.
 *
 * nPosition
 * The required numeric character position, counted from 1. Its fractional part
 * is discarded toward zero. Positions count Unicode scalars, not bytes.
 *
 * $RETURNS$
 * The Unicode scalar value of the selected character. Returns 0 when there is
 * no character at the requested position, including empty strings, positions
 * below 1 and positions beyond the last character. U+0000 also returns 0.
 *
 * $DESCRIPTION$
 * Walks through UTF-8 characters until nPosition is reached. Handles one to
 * four bytes per character, including emoji and embedded zero bytes. Combining
 * marks are separate positions; a visible symbol can occupy several positions.
 * The input string is not modified. No code page or GT driver is required.
 *
 * Malformed UTF-8 encountered while finding or reading the selected character
 * raises error 1102. Bytes following that character are not validated. Use
 * StrIsUTF8() when the complete string must be checked.
 *
 * $NOTES$
 * Missing arguments or incorrect argument types raise error 1102.
 * Non-finite or excessively large numeric positions do not select a character
 * and return 0. Negative positions do not count backward from the end.
 *
 * StrPeek() reads a byte position; UPeek() reads a Unicode character position.
 * UTF8Asc() reads the first UTF-8 character. Legacy text should be converted
 * to UTF-8 before using UPeek().
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ASCII position                    OK
 * Polish character position         OK
 * Four-byte character               OK
 * Highest Unicode scalar            OK
 * Embedded zero                     OK
 * Combining mark is a position      OK
 * Empty string                      OK
 * Zero position                     OK
 * Negative position                 OK
 * Beyond character count            OK
 * Huge position                     OK
 * Fractional position               OK
 * Byte position differs             OK
 * Tail is not validated             OK
 * Invalid selected character        OK
 * Invalid preceding character       OK
 * Incomplete sequence               OK
 * Wrong text type                   OK
 * Wrong position type               OK
 * Missing position                  OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UPoke(), UTF8Asc(), UTF8Chr(), StrIsUTF8(), UChars(), StrPeek()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'ASCII position', UPeek( "ABC", 2 ), 66 )
   Check( 'Polish character position', UPeek( "ął", 2 ), 0x0142 )
   Check( 'Four-byte character', UPeek( "a😃b", 2 ), 0x1F603 )
   Check( 'Highest Unicode scalar', UPeek( UTF8Chr( 0x10FFFF ), 1 ), 0x10FFFF )
   Check( 'Embedded zero', UPeek( "A" + Chr( 0 ) + "B", 2 ), 0 )
   Check( 'Combining mark is a position', UPeek( "a" + UTF8Chr( 0x0328 ), 2 ), 0x0328 )
   Check( 'Empty string', UPeek( "", 1 ), 0 )
   Check( 'Zero position', UPeek( "ABC", 0 ), 0 )
   Check( 'Negative position', UPeek( "ABC", -1 ), 0 )
   Check( 'Beyond character count', UPeek( "ął", 3 ), 0 )
   Check( 'Huge position', UPeek( "ABC", 1e100 ), 0 )
   Check( 'Fractional position', UPeek( "a😃b", 2.9 ), 0x1F603 )
   Check( 'Byte position differs', StrPeek( "ął", 2 ), 133 )
   Check( 'Tail is not validated', UPeek( "A" + Chr( 255 ), 1 ), 65 )
   Check( 'Invalid selected character', s_ErrorCode( {|| UPeek( "A" + Chr( 255 ), 2 ) } ), 1102 )
   Check( 'Invalid preceding character', s_ErrorCode( {|| UPeek( "A" + Chr( 255 ) + "B", 3 ) } ), 1102 )
   Check( 'Incomplete sequence', s_ErrorCode( {|| UPeek( Chr( 196 ), 1 ) } ), 1102 )
   Check( 'Wrong text type', s_ErrorCode( {|| UPeek( 1, 1 ) } ), 1102 )
   Check( 'Wrong position type', s_ErrorCode( {|| UPeek( "ABC", "1" ) } ), 1102 )
   Check( 'Missing position', s_ErrorCode( {|| UPeek( "ABC" ) } ), 1102 )

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

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( PadR( cTitle, 34 ) + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
