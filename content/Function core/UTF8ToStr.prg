/*
 * $DOC$
 * $NAME$
 * UTF8ToStr()
 *
 * $ONELINER$
 * Convert a UTF-8 character string to a specified code page
 *
 * $SYNTAX$
 * UTF8ToStr( cUTF8, cCodepage ) --> cString
 *
 * $ARGUMENTS$
 * cUTF8
 * The character string containing valid UTF-8 text.
 *
 * cCodepage
 * The required destination encoding name, such as "ISO-8859-2", "CP437",
 * "CP852", "CP1250", "CP932" or "MAZOVIA". Names are case-insensitive.
 * Use "UTF-8" when UTF-8 output is required.
 *
 * $RETURNS$
 * A new character string containing bytes in the destination encoding.
 * An empty input string produces an empty result.
 *
 * $DESCRIPTION$
 * Decodes cUTF8 and encodes its characters using cCodepage. Both arguments are
 * required character strings. The input is not modified.
 *
 * Single-byte code pages and the double-byte encodings CP932, CP936, CP949 and
 * CP950 are supported. See Translate() for the supported code page names.
 * With "UTF-8", the function validates the string and returns its
 * bytes unchanged. Embedded zero bytes are preserved.
 * Legacy encodings must be linked explicitly, for example REQUEST CP852 or
 * REQUEST CP1250. UTF-8 is built in and requires no REQUEST.
 *
 * $NOTES$
 * Missing or non-character arguments raise error 1102.
 * An unknown code page, invalid UTF-8 or a character without an exact mapping
 * in the destination encoding raises error 1102. The function does not replace
 * unsupported characters with question marks or transliterate them.
 *
 * The result can contain bytes that are not valid UTF-8. Use it when writing
 * data for software or files that require the selected encoding. Conversion
 * does not change the terminal encoding or guarantee correct screen display.
 * Chr() remains a function that returns one byte.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * UTF-8 to CP852 bytes       OK
 * UTF-8 to CP1250 bytes       OK
 * One byte per Polish letter OK
 * Convert back to UTF-8      OK
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
 * StrToUTF8(), Translate(), StrIsUTF8(), UTF8Chr(), CdpList(), CdpExists(), CdpTerm(), Chr()
 *
 * $DOCEND$
 */

REQUEST CP852
REQUEST CP1250

PROCEDURE Main()

   LOCAL cPolish := "ĄĆĘŁŃÓŚŹŻąćęłńóśźż"
   LOCAL cDOS := UTF8ToStr( cPolish, "CP852" )

   Check( 'UTF-8 to CP852 bytes       ', UTF8ToStr( "ął", "CP852" ), Chr( 165 ) + Chr( 136 ) )
   Check( 'UTF-8 to CP1250 bytes       ', UTF8ToStr( "ął", "CP1250" ), Chr( 185 ) + Chr( 179 ) )
   Check( 'One byte per Polish letter ', Len( cDOS ), 18 )
   Check( 'Convert back to UTF-8      ', StrToUTF8( cDOS, "CP852" ), cPolish )
   Check( 'Validate existing UTF-8    ', UTF8ToStr( "Zażółć", "UTF-8" ), "Zażółć" )
   Check( 'Preserve an embedded zero  ', UTF8ToStr( "A" + Chr( 0 ) + "B", "CP852" ), "A" + Chr( 0 ) + "B" )
   Check( 'Empty string               ', UTF8ToStr( "", "CP852" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
