/*
 * $DOC$
 * $NAME$
 * UTF8Chr()
 *
 * $ONELINER$
 * Encode a Unicode scalar value as one UTF-8 character
 *
 * $SYNTAX$
 * UTF8Chr( nCodepoint ) --> cCharacter
 *
 * $ARGUMENTS$
 * nCodepoint
 * The required numeric Unicode scalar value. It must be a whole number from
 * 0 through 0x10FFFF, excluding the surrogate range 0xD800 through 0xDFFF.
 *
 * $RETURNS$
 * A character string containing the one to four UTF-8 bytes of the scalar.
 * UTF8Chr( 0 ) returns one zero byte, not an empty string.
 *
 * $DESCRIPTION$
 * Encodes the specified scalar directly as UTF-8. It does not depend on a
 * selected code page, console encoding or GT driver. Values outside the BMP,
 * including emoji such as U+1F603, produce four-byte UTF-8 sequences.
 *
 * The result contains one Unicode scalar value. A user-visible symbol can
 * consist of several scalars, such as a letter with a combining mark or an
 * emoji sequence. Build those strings by concatenating the required characters.
 *
 * $NOTES$
 * Missing or non-numeric arguments, fractional values, negative values,
 * non-finite numbers, surrogates and values above 0x10FFFF raise error 1102.
 * Invalid values are not rounded, wrapped or silently replaced.
 *
 * Chr() remains byte-based: Chr( n ) returns one byte with value n & 0xFF.
 * UTF8Chr() creates a UTF-8 character from a Unicode number. Its result can
 * be valid even when the scalar has no assigned character or a terminal has
 * no glyph for it. Encoding an emoji does not guarantee its display.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Zero is one byte             OK
 * ASCII character              OK
 * Last ASCII value             OK
 * First two-byte value         OK
 * Last two-byte value          OK
 * First three-byte value       OK
 * Polish letter                OK
 * Euro sign                    OK
 * Before surrogate range       OK
 * After surrogate range        OK
 * Last BMP scalar              OK
 * First four-byte value        OK
 * Emoji scalar                 OK
 * Highest Unicode scalar       OK
 * Emoji uses four bytes        OK
 * Chr remains one byte         OK
 * UTF8Chr uses Unicode         OK
 * Negative value error         OK
 * First surrogate error        OK
 * Last surrogate error         OK
 * Above Unicode range error    OK
 * Fractional value error       OK
 * Huge number error            OK
 * String argument error        OK
 * Missing argument error       OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UTF8Asc(), UPeek(), UPoke(), StrIsUTF8(), Chr(), ULen(), UChars(), UTF8ToStr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'Zero is one byte            ', UTF8Chr( 0 ), Chr( 0 ) )
   Check( 'ASCII character             ', UTF8Chr( 65 ), "A" )
   Check( 'Last ASCII value            ', UTF8Chr( 0x7F ), Chr( 127 ) )
   Check( 'First two-byte value        ', UTF8Chr( 0x80 ), Chr( 194 ) + Chr( 128 ) )
   Check( 'Last two-byte value         ', UTF8Chr( 0x7FF ), Chr( 223 ) + Chr( 191 ) )
   Check( 'First three-byte value      ', UTF8Chr( 0x800 ), Chr( 224 ) + Chr( 160 ) + Chr( 128 ) )
   Check( 'Polish letter               ', UTF8Chr( 0x0105 ), "ą" )
   Check( 'Euro sign                   ', UTF8Chr( 0x20AC ), "€" )
   Check( 'Before surrogate range      ', UTF8Chr( 0xD7FF ), Chr( 237 ) + Chr( 159 ) + Chr( 191 ) )
   Check( 'After surrogate range       ', UTF8Chr( 0xE000 ), Chr( 238 ) + Chr( 128 ) + Chr( 128 ) )
   Check( 'Last BMP scalar             ', UTF8Chr( 0xFFFF ), Chr( 239 ) + Chr( 191 ) + Chr( 191 ) )
   Check( 'First four-byte value       ', UTF8Chr( 0x10000 ), Chr( 240 ) + Chr( 144 ) + Chr( 128 ) + Chr( 128 ) )
   Check( 'Emoji scalar                ', UTF8Chr( 0x1F603 ), "😃" )
   Check( 'Highest Unicode scalar      ', UTF8Chr( 0x10FFFF ), Chr( 244 ) + Chr( 143 ) + Chr( 191 ) + Chr( 191 ) )
   Check( 'Emoji uses four bytes       ', Len( UTF8Chr( 0x1F603 ) ), 4 )
   Check( 'Chr remains one byte        ', Len( Chr( 196 ) ), 1 )
   Check( 'UTF8Chr uses Unicode        ', Len( UTF8Chr( 196 ) ), 2 )
   Check( 'Negative value error        ', s_Fails( {|| UTF8Chr( -1 ) } ), .T. )
   Check( 'First surrogate error       ', s_Fails( {|| UTF8Chr( 0xD800 ) } ), .T. )
   Check( 'Last surrogate error        ', s_Fails( {|| UTF8Chr( 0xDFFF ) } ), .T. )
   Check( 'Above Unicode range error   ', s_Fails( {|| UTF8Chr( 0x110000 ) } ), .T. )
   Check( 'Fractional value error      ', s_Fails( {|| UTF8Chr( 65.5 ) } ), .T. )
   Check( 'Huge number error           ', s_Fails( {|| UTF8Chr( 1e100 ) } ), .T. )
   Check( 'String argument error       ', s_Fails( {|| UTF8Chr( "65" ) } ), .T. )
   Check( 'Missing argument error      ', s_Fails( {|| UTF8Chr() } ), .T. )

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
