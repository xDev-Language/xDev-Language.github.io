/*
 * $DOC$
 * $NAME$
 * Translate()
 *
 * $ONELINER$
 * Convert a character string between two specified encodings
 *
 * $SYNTAX$
 * Translate( cString, cFrom, cTo ) --> cTranslated
 *
 * $ARGUMENTS$
 * cString
 * The character string containing bytes in the source encoding.
 *
 * cFrom
 * The required source encoding name.
 *
 * cTo
 * The required destination encoding name.
 *
 * $RETURNS$
 * A new character string encoded using cTo. An empty input string produces
 * an empty result. The original string is not modified.
 *
 * $DESCRIPTION$
 * Decodes cString using cFrom and encodes the characters using cTo. All three
 * arguments are required character strings. Encoding names are case-insensitive.
 * Use the encoding names listed below; language-specific aliases are not used.
 *
 * Supported names include:
 *
 * ISO code pages: ISO-8859-1 through ISO-8859-11, and ISO-8859-13 through
 * ISO-8859-16.
 *
 * PC code pages: CP437, CP737, CP775, CP850, CP852, CP855, CP857, CP860,
 * CP861, CP862, CP863, CP864, CP865, CP866 and CP869.
 *
 * Windows code pages: CP874, CP932, CP936, CP949, CP950 and CP1250 through
 * CP1258. CP932, CP936, CP949 and CP950 support double-byte characters.
 *
 * Other legacy encodings: KOI8-R, KOI8-U and MAZOVIA.
 *
 * Unicode encoding: UTF-8.
 *
 * UTF-8 is built in. Link each required legacy encoding with REQUEST before
 * using it. CP names use the same symbol, for example REQUEST CP852.
 * For ISO-8859 names, replace hyphens with underscores: REQUEST ISO_8859_2
 * enables "ISO-8859-2". Likewise, REQUEST KOI8_R enables "KOI8-R" and
 * REQUEST MAZOVIA enables "MAZOVIA". No encoding aliases are added.
 * CdpList() lists the encodings linked into this program; CdpExists() checks
 * whether a name is available. A supported but unlinked encoding raises
 * error 1102 when passed to a conversion function, even for empty input.
 *
 * CP437 and CP852 are distinct code pages. A language name alone does not
 * identify an encoding; select the name matching the actual input bytes.
 *
 * Input bytes are always interpreted in the specified source encoding. There
 * is no automatic encoding detection, even when legacy bytes also form valid
 * UTF-8. Conversion between two legacy encodings does not require an
 * intermediate UTF-8 string.
 *
 * When both names identify the same encoding, the function validates the input
 * and returns its original bytes unchanged. Embedded zero bytes are preserved.
 *
 * $NOTES$
 * Missing or non-character arguments raise error 1102.
 * Unknown encodings, invalid source data and characters without an exact
 * destination mapping raise error 1102. No replacement or transliteration is
 * performed. Not every character can be represented in every code page.
 *
 * The function converts a string only. It does not change file contents,
 * terminal settings, sorting rules or the behavior of Chr().
 * REQUEST links a module when the executable is built; passing an encoding
 * name to a function does not load a module at runtime. GtInfo( GTI_CODEPAGE )
 * also selects only linked encodings. An attempt to set an unavailable encoding
 * returns NIL and preserves the previous GT setting.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Mazovia uses 18 bytes      OK
 * Mazovia back to UTF-8      OK
 * Windows back to UTF-8      OK
 * CP852 to CP1250 bytes       OK
 * Same encoding unchanged    OK
 * Case-insensitive names     OK
 * Empty string               OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * StrToUTF8(), UTF8ToStr(), StrIsUTF8(), CdpList(), CdpExists(), CdpTerm(), Chr()
 *
 * $DOCEND$
 */

REQUEST CP852
REQUEST CP1250
REQUEST MAZOVIA

PROCEDURE Main()

   LOCAL cPolish := "ĄĆĘŁŃÓŚŹŻąćęłńóśźż"
   LOCAL cMazovia := Translate( cPolish, "UTF-8", "MAZOVIA" )
   LOCAL cWindows := Translate( cMazovia, "MAZOVIA", "CP1250" )

   Check( 'Mazovia uses 18 bytes      ', Len( cMazovia ), 18 )
   Check( 'Mazovia back to UTF-8      ', Translate( cMazovia, "MAZOVIA", "UTF-8" ), cPolish )
   Check( 'Windows back to UTF-8      ', Translate( cWindows, "CP1250", "UTF-8" ), cPolish )
   Check( 'CP852 to CP1250 bytes       ', Translate( Chr( 165 ), "CP852", "CP1250" ), Chr( 185 ) )
   Check( 'Same encoding unchanged    ', Translate( cMazovia, "MAZOVIA", "MAZOVIA" ), cMazovia )
   Check( 'Case-insensitive names     ', Translate( "ą", "utf-8", "cp852" ), Chr( 165 ) )
   Check( 'Empty string               ', Translate( "", "UTF-8", "CP1250" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
