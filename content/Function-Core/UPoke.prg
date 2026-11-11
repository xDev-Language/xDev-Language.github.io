/*
 * $DOC$
 * $NAME$
 * UPoke()
 *
 * $ONELINER$
 * Replace one UTF-8 character with a specified Unicode scalar value
 *
 * $SYNTAX$
 * UPoke( cString, nPosition, nCodepoint ) --> cResult
 * UPoke( @cString, nPosition, nCodepoint ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * The required UTF-8 character string. Pass @cString to update the caller's
 * variable as well as return the modified string.
 *
 * nPosition
 * The required numeric character position, counted from 1. Its fractional part
 * is discarded toward zero. Negative positions do not count from the end.
 *
 * nCodepoint
 * The required whole numeric Unicode scalar value, from 0 through 0x10FFFF,
 * excluding the surrogate range 0xD800 through 0xDFFF.
 *
 * $RETURNS$
 * The string with the selected character replaced. An empty string or a
 * position outside the character range returns the original contents.
 *
 * $DESCRIPTION$
 * Replaces exactly one Unicode scalar. The replacement can occupy a different
 * number of UTF-8 bytes, so byte length can grow or shrink. Other characters
 * retain their original bytes. Zero is a valid replacement and produces an
 * embedded zero byte; characters outside the BMP can produce four bytes.
 *
 * Passing cString by value preserves the original variable. Passing @cString
 * also stores the result in that variable. Other variables containing the old
 * string remain unchanged. The scalar argument is validated even when the
 * requested position is outside the string.
 *
 * The text is decoded only through the selected character. Malformed UTF-8
 * encountered in that prefix or character raises error 1102. A later suffix
 * is copied without validation or repair. Use StrIsUTF8() to check all bytes.
 *
 * $NOTES$
 * Missing arguments, wrong types and invalid scalar values raise error 1102.
 * Fractional scalar values, non-finite scalars, surrogates and values above
 * 0x10FFFF are invalid. On validation failure, a by-reference variable keeps
 * its previous contents.
 *
 * Positions count Unicode scalars, including combining marks, rather than
 * bytes or complete visible symbols. Non-finite or excessively large numeric
 * positions leave the string unchanged. A position just past the end does
 * not append a character; use UStuff() when insertion is required.
 *
 * StrPoke() remains byte-based. UPoke() does not change console settings,
 * Chr(), Asc() or code page selection. No GT driver is required.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ASCII replacement                 OK
 * One byte becomes two              OK
 * Two bytes become one              OK
 * Two bytes become four             OK
 * Four bytes become two             OK
 * Four-byte replacement             OK
 * Write an embedded zero            OK
 * Replace an embedded zero          OK
 * Empty string                      OK
 * Zero position                     OK
 * Negative position                 OK
 * No character is appended          OK
 * Huge position                     OK
 * Fractional position               OK
 * Suffix bytes are preserved        OK
 * By-value result                   OK
 * By-value source is preserved      OK
 * By-reference result               OK
 * Reference is updated              OK
 * Old copy is preserved             OK
 * Character count is preserved      OK
 * Byte length can change            OK
 * Negative scalar error             OK
 * Surrogate error                   OK
 * Above Unicode range error         OK
 * Fractional scalar error           OK
 * Huge scalar error                 OK
 * Scalar checked before position    OK
 * Invalid target error              OK
 * Invalid prefix error              OK
 * Wrong text type                   OK
 * Wrong position type               OK
 * Missing scalar                    OK
 * Invalid scalar preserves ref      OK
 * Reference survives error          OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UPeek(), UTF8Chr(), UTF8Asc(), StrIsUTF8(), StrPoke()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cOriginal := "a😃b"
   LOCAL cCopy := cOriginal
   LOCAL cResult

   Check( 'ASCII replacement', UPoke( "ABC", 2, 90 ), "AZC" )
   Check( 'One byte becomes two', UPoke( "ABC", 2, 0x0105 ), "AąC" )
   Check( 'Two bytes become one', UPoke( "Łąb", 2, 88 ), "ŁXb" )
   Check( 'Two bytes become four', UPoke( "aąb", 2, 0x1F603 ), "a😃b" )
   Check( 'Four bytes become two', UPoke( "a😃b", 2, 0x0142 ), "ałb" )
   Check( 'Four-byte replacement', UPoke( "a😃b", 2, 0x1F600 ), "a😀b" )
   Check( 'Write an embedded zero', UPoke( "AB", 2, 0 ), "A" + Chr( 0 ) )
   Check( 'Replace an embedded zero', UPoke( "A" + Chr( 0 ) + "B", 2, 0x0142 ), "AłB" )
   Check( 'Empty string', UPoke( "", 1, 65 ), "" )
   Check( 'Zero position', UPoke( "ABC", 0, 88 ), "ABC" )
   Check( 'Negative position', UPoke( "ABC", -1, 88 ), "ABC" )
   Check( 'No character is appended', UPoke( "ął", 3, 88 ), "ął" )
   Check( 'Huge position', UPoke( "ABC", 1e100, 88 ), "ABC" )
   Check( 'Fractional position', UPoke( "ABC", 2.9, 88 ), "AXC" )
   Check( 'Suffix bytes are preserved', UPoke( "A" + Chr( 255 ), 1, 66 ), "B" + Chr( 255 ) )
   cResult := UPoke( cOriginal, 2, 0x0142 )
   Check( 'By-value result', cResult, "ałb" )
   Check( 'By-value source is preserved', cOriginal, "a😃b" )
   cResult := UPoke( @cOriginal, 2, 0x0105 )
   Check( 'By-reference result', cResult, "aąb" )
   Check( 'Reference is updated', cOriginal, cResult )
   Check( 'Old copy is preserved', cCopy, "a😃b" )
   Check( 'Character count is preserved', ULen( cOriginal ), 3 )
   Check( 'Byte length can change', Len( cOriginal ), 4 )
   Check( 'Negative scalar error', s_ErrorCode( {|| UPoke( "ABC", 2, -1 ) } ), 1102 )
   Check( 'Surrogate error', s_ErrorCode( {|| UPoke( "ABC", 2, 0xD800 ) } ), 1102 )
   Check( 'Above Unicode range error', s_ErrorCode( {|| UPoke( "ABC", 2, 0x110000 ) } ), 1102 )
   Check( 'Fractional scalar error', s_ErrorCode( {|| UPoke( "ABC", 2, 65.5 ) } ), 1102 )
   Check( 'Huge scalar error', s_ErrorCode( {|| UPoke( "ABC", 2, 1e100 ) } ), 1102 )
   Check( 'Scalar checked before position', s_ErrorCode( {|| UPoke( "ABC", 99, -1 ) } ), 1102 )
   Check( 'Invalid target error', s_ErrorCode( {|| UPoke( "A" + Chr( 255 ), 2, 65 ) } ), 1102 )
   Check( 'Invalid prefix error', s_ErrorCode( {|| UPoke( Chr( 255 ) + "B", 2, 65 ) } ), 1102 )
   Check( 'Wrong text type', s_ErrorCode( {|| UPoke( 1, 1, 65 ) } ), 1102 )
   Check( 'Wrong position type', s_ErrorCode( {|| UPoke( "ABC", "1", 65 ) } ), 1102 )
   Check( 'Missing scalar', s_ErrorCode( {|| UPoke( "ABC", 1 ) } ), 1102 )
   Check( 'Invalid scalar preserves ref', s_ErrorCode( {|| UPoke( @cOriginal, 2, 0xD800 ) } ), 1102 )
   Check( 'Reference survives error', cOriginal, "aąb" )

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
