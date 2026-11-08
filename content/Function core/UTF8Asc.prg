/*
 * $DOC$
 * $NAME$
 * UTF8Asc()
 *
 * $ONELINER$
 * Return the Unicode scalar value of the first UTF-8 character
 *
 * $SYNTAX$
 * UTF8Asc( cString ) --> nCodepoint
 *
 * $ARGUMENTS$
 * cString
 * The required character string beginning with a well-formed UTF-8 character.
 * An empty string is also accepted.
 *
 * $RETURNS$
 * The numeric Unicode scalar value of the first character, from 0 through
 * 0x10FFFF. Returns 0 for an empty string or a first character of U+0000.
 *
 * $DESCRIPTION$
 * Decodes the first UTF-8 sequence, including four-byte characters such as
 * emoji. Subsequent characters are not decoded or validated. For example,
 * a valid first ASCII character followed by an invalid byte still returns
 * the ASCII character's value. Use StrIsUTF8() to validate the complete string.
 *
 * Embedded zero bytes are supported. A leading zero byte returns 0 even when
 * other bytes follow it. Use Len() to distinguish this case from an empty
 * string. The original string is not modified.
 *
 * $NOTES$
 * Missing or non-character arguments and a malformed first UTF-8 sequence
 * raise error 1102. A valid encoded U+FFFD returns 0xFFFD; malformed input
 * is not silently converted into that replacement character.
 *
 * Asc() remains byte-based and returns the value of the first byte.
 * UTF8Asc() returns a Unicode value and does not interpret legacy code pages.
 * Convert legacy bytes with StrToUTF8() before reading their Unicode values.
 * No GT driver, terminal setting or Unicode font is required.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ASCII character              OK
 * Polish letter                OK
 * Euro sign                    OK
 * Emoji scalar                 OK
 * Empty string                 OK
 * Leading zero byte            OK
 * First character only         OK
 * Invalid tail is not decoded  OK
 * Encoded replacement value    OK
 * Highest scalar round trip    OK
 * Asc remains byte-based       OK
 * Incomplete sequence error    OK
 * Continuation byte error      OK
 * Overlong encoding error      OK
 * Surrogate encoding error     OK
 * Above Unicode range error    OK
 * Numeric argument error       OK
 * Missing argument error       OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UTF8Chr(), UPeek(), UPoke(), StrIsUTF8(), Asc(), StrToUTF8(), UChars()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'ASCII character             ', UTF8Asc( "A" ), 65 )
   Check( 'Polish letter               ', UTF8Asc( "ą" ), 0x0105 )
   Check( 'Euro sign                   ', UTF8Asc( "€" ), 0x20AC )
   Check( 'Emoji scalar                ', UTF8Asc( "😃" ), 0x1F603 )
   Check( 'Empty string                ', UTF8Asc( "" ), 0 )
   Check( 'Leading zero byte           ', UTF8Asc( Chr( 0 ) + "A" ), 0 )
   Check( 'First character only        ', UTF8Asc( "ął" ), 0x0105 )
   Check( 'Invalid tail is not decoded ', UTF8Asc( "A" + Chr( 255 ) ), 65 )
   Check( 'Encoded replacement value   ', UTF8Asc( Chr( 239 ) + Chr( 191 ) + Chr( 189 ) ), 0xFFFD )
   Check( 'Highest scalar round trip   ', UTF8Asc( UTF8Chr( 0x10FFFF ) ), 0x10FFFF )
   Check( 'Asc remains byte-based      ', Asc( "ą" ), 196 )
   Check( 'Incomplete sequence error   ', s_Fails( {|| UTF8Asc( Chr( 196 ) ) } ), .T. )
   Check( 'Continuation byte error     ', s_Fails( {|| UTF8Asc( Chr( 128 ) ) } ), .T. )
   Check( 'Overlong encoding error     ', s_Fails( {|| UTF8Asc( Chr( 192 ) + Chr( 175 ) ) } ), .T. )
   Check( 'Surrogate encoding error    ', s_Fails( {|| UTF8Asc( Chr( 237 ) + Chr( 160 ) + Chr( 128 ) ) } ), .T. )
   Check( 'Above Unicode range error   ', s_Fails( {|| UTF8Asc( Chr( 244 ) + Chr( 144 ) + Chr( 128 ) + Chr( 128 ) ) } ), .T. )
   Check( 'Numeric argument error      ', s_Fails( {|| UTF8Asc( 65 ) } ), .T. )
   Check( 'Missing argument error      ', s_Fails( {|| UTF8Asc() } ), .T. )

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
