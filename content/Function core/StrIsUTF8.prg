/*
 * $DOC$
 * $NAME$
 * StrIsUTF8()
 *
 * $ONELINER$
 * Check whether an entire character string contains well-formed UTF-8
 *
 * $SYNTAX$
 * StrIsUTF8( cString ) --> lValid
 *
 * $ARGUMENTS$
 * cString
 * The required character string containing the bytes to validate.
 *
 * $RETURNS$
 * .T. if every byte belongs to a well-formed UTF-8 sequence; otherwise .F.
 * ASCII strings, empty strings and embedded zero bytes are valid.
 *
 * $DESCRIPTION$
 * Validates the complete string, including characters encoded with two, three
 * or four bytes. Rejects isolated continuation bytes, incomplete sequences,
 * invalid continuation bytes, overlong encodings, surrogate values and values
 * above U+10FFFF. A correctly encoded U+FFFD replacement character is valid.
 *
 * Validation does not modify the string or replace invalid bytes. It does not
 * require a code page setting, GT driver or terminal with Unicode font support.
 *
 * $NOTES$
 * A missing argument or an argument that is not a character string raises
 * error 1102. A malformed string returns .F. without raising an error.
 *
 * This is a strict validity check. It does not identify the original encoding
 * of a file: bytes from a legacy encoding can happen to form valid UTF-8.
 * When the source encoding is known, use StrToUTF8() or Translate() explicitly.
 * Valid UTF-8 does not guarantee that a terminal can draw all its characters.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ASCII is valid               OK
 * Empty string is valid        OK
 * Polish letters               OK
 * Three-byte character         OK
 * Four-byte emoji              OK
 * Embedded zero                OK
 * Replacement character        OK
 * Highest scalar value         OK
 * Legacy bytes can look valid  OK
 * Incomplete sequence          OK
 * Isolated continuation byte   OK
 * Invalid continuation byte    OK
 * Two-byte overlong encoding   OK
 * Three-byte overlong encoding OK
 * Surrogate encoding           OK
 * Above Unicode range          OK
 * Five-byte encoding           OK
 * Invalid byte after ASCII     OK
 * Missing argument error       OK
 * Numeric argument error       OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UTF8Chr(), UTF8Asc(), UPeek(), UPoke(), URAt(), StrToUTF8(), UTF8ToStr(), Translate(), UChars()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'ASCII is valid              ', StrIsUTF8( "ABC" ), .T. )
   Check( 'Empty string is valid       ', StrIsUTF8( "" ), .T. )
   Check( 'Polish letters              ', StrIsUTF8( "Zażółć" ), .T. )
   Check( 'Three-byte character        ', StrIsUTF8( "€" ), .T. )
   Check( 'Four-byte emoji             ', StrIsUTF8( "😃" ), .T. )
   Check( 'Embedded zero               ', StrIsUTF8( "A" + Chr( 0 ) + "B" ), .T. )
   Check( 'Replacement character       ', StrIsUTF8( Chr( 239 ) + Chr( 191 ) + Chr( 189 ) ), .T. )
   Check( 'Highest scalar value        ', StrIsUTF8( Chr( 244 ) + Chr( 143 ) + Chr( 191 ) + Chr( 191 ) ), .T. )
   Check( 'Legacy bytes can look valid ', StrIsUTF8( Chr( 196 ) + Chr( 165 ) ), .T. )
   Check( 'Incomplete sequence         ', StrIsUTF8( Chr( 196 ) ), .F. )
   Check( 'Isolated continuation byte  ', StrIsUTF8( Chr( 128 ) ), .F. )
   Check( 'Invalid continuation byte   ', StrIsUTF8( Chr( 226 ) + "(" + Chr( 161 ) ), .F. )
   Check( 'Two-byte overlong encoding  ', StrIsUTF8( Chr( 192 ) + Chr( 175 ) ), .F. )
   Check( 'Three-byte overlong encoding', StrIsUTF8( Chr( 224 ) + Chr( 128 ) + Chr( 128 ) ), .F. )
   Check( 'Surrogate encoding          ', StrIsUTF8( Chr( 237 ) + Chr( 160 ) + Chr( 128 ) ), .F. )
   Check( 'Above Unicode range         ', StrIsUTF8( Chr( 244 ) + Chr( 144 ) + Chr( 128 ) + Chr( 128 ) ), .F. )
   Check( 'Five-byte encoding          ', StrIsUTF8( Chr( 248 ) + Replicate( Chr( 128 ), 4 ) ), .F. )
   Check( 'Invalid byte after ASCII    ', StrIsUTF8( "A" + Chr( 255 ) ), .F. )
   Check( 'Missing argument error      ', s_Fails( {|| StrIsUTF8() } ), .T. )
   Check( 'Numeric argument error      ', s_Fails( {|| StrIsUTF8( 123 ) } ), .T. )

RETURN

STATIC FUNCTION s_Fails( bAction )

   LOCAL lFailed := .F.
   LOCAL bPrevious := ErrorBlock( {| oError | Break( oError ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER
      lFailed := .T.
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN lFailed

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( PadR( cTitle, 29 ) + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
