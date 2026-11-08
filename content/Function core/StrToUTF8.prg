/*
 * $DOC$
 * $NAME$
 * StrToUTF8()
 *
 * $ONELINER$
 * Convert a character string from a specified code page to UTF-8
 *
 * $SYNTAX$
 * StrToUTF8( cString, cCodepage ) --> cUTF8
 *
 * $ARGUMENTS$
 * cString
 * The character string containing bytes in the source encoding.
 *
 * cCodepage
 * The required source encoding name, such as "ISO-8859-2", "CP437", "CP852",
 * "CP1250", "CP932" or "MAZOVIA". Names are case-insensitive.
 * Use "UTF-8" for a string already encoded as UTF-8.
 *
 * $RETURNS$
 * A new character string containing the converted UTF-8 bytes.
 * An empty input string produces an empty result.
 *
 * $DESCRIPTION$
 * Decodes cString using cCodepage and encodes the resulting characters as UTF-8.
 * Both arguments are required character strings. The input is not modified.
 *
 * All input bytes are interpreted using the specified source encoding, including
 * byte sequences that could also form valid UTF-8. The function does not detect
 * the encoding of the input. With "UTF-8", it validates the string
 * and returns its bytes unchanged.
 *
 * Single-byte code pages and the double-byte encodings CP932, CP936, CP949 and
 * CP950 are supported. See Translate() for the supported code page names.
 * Embedded zero bytes are preserved.
 * Legacy encodings must be linked explicitly, for example REQUEST CP852 or
 * REQUEST CP1250. UTF-8 is built in and requires no REQUEST.
 *
 * $NOTES$
 * Missing or non-character arguments raise error 1102.
 * An unknown code page, an undefined source byte or an invalid encoded sequence
 * raises error 1102. Invalid data is not silently replaced.
 *
 * This function does not change the terminal encoding or read files. To convert
 * a legacy text file, first read its bytes, then supply the known source encoding.
 * Chr() remains a function that returns one byte.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * CP852 bytes to UTF-8       OK
 * Case-insensitive name      OK
 * Source bytes remain intact OK
 * Explicit CP1250 decoding    OK
 * Validate existing UTF-8    OK
 * Preserve an embedded zero  OK
 * Empty string               OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UTF8ToStr(), Translate(), StrIsUTF8(), UTF8Asc(), CdpList(), CdpExists(), CdpTerm(), Chr()
 *
 * $DOCEND$
 */

REQUEST CP852
REQUEST CP1250

PROCEDURE Main()

   LOCAL cDOS := Chr( 165 ) + Chr( 136 )

   Check( 'CP852 bytes to UTF-8       ', StrToUTF8( cDOS, "CP852" ), "ął" )
   Check( 'Case-insensitive name      ', StrToUTF8( cDOS, "cp852" ), "ął" )
   Check( 'Source bytes remain intact ', cDOS, Chr( 165 ) + Chr( 136 ) )
   Check( 'Explicit CP1250 decoding    ', StrToUTF8( Chr( 196 ) + Chr( 165 ), "CP1250" ), "ÄĄ" )
   Check( 'Validate existing UTF-8    ', StrToUTF8( "Zażółć", "UTF-8" ), "Zażółć" )
   Check( 'Preserve an embedded zero  ', StrToUTF8( "A" + Chr( 0 ) + "B", "CP852" ), "A" + Chr( 0 ) + "B" )
   Check( 'Empty string               ', StrToUTF8( "", "CP852" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
