/*
 * $DOC$
 * $NAME$
 * CdpExists()
 *
 * $ONELINER$
 * Check whether an encoding is available in the current program
 *
 * $SYNTAX$
 * CdpExists( cEncoding ) --> lExists
 *
 * $ARGUMENTS$
 * cEncoding
 * The required encoding name as a character string, for example "ISO-8859-2",
 * "CP852", "CP1250", "CP932", "MAZOVIA" or "UTF-8".
 *
 * $RETURNS$
 * .T. if cEncoding identifies an entry in the runtime registry; otherwise .F.
 * Empty strings and unknown names return .F.
 *
 * $DESCRIPTION$
 * Looks up cEncoding in the same registry used by CdpList(), StrToUTF8(),
 * UTF8ToStr() and Translate(). Matching is case-insensitive, so "CP1250" and
 * "cp1250" identify the same encoding.
 *
 * Supply a complete canonical name from CdpList(). Leading or trailing spaces
 * are not removed. Numeric code page identifiers are not accepted as arguments;
 * use the string "CP852", for example. Names containing additional bytes,
 * including embedded zero bytes, do not match a shorter registered name.
 *
 * The function can be used before a conversion to reject an unsupported name
 * without attempting the conversion. It does not change any encoding setting.
 * UTF-8 is built in. A legacy encoding is available only when its module is
 * linked with REQUEST or brought in by a library dependency. For example,
 * REQUEST CP852 enables "CP852"; REQUEST ISO_8859_2 enables "ISO-8859-2".
 * A supported but unlinked encoding returns .F.
 *
 * $NOTES$
 * A missing argument or an argument that is not a character string raises
 * error 1102. An unknown string name returns .F. instead of raising an error.
 *
 * A .T. result confirms that the program includes the encoding. It does not validate
 * input bytes or guarantee that every character has a mapping in that encoding.
 * Conversion functions can still raise an error for invalid or unrepresentable
 * data. The function does not detect the encoding of a string or file and does
 * not test whether a terminal font can display its characters.
 *
 * This is a core function. No GT driver or header file is required.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * ISO-8859-2 exists           OK
 * CP852 exists                OK
 * CP1250 exists               OK
 * CP932 exists                OK
 * MAZOVIA exists              OK
 * UTF-8 exists                OK
 * Unlinked CP936 is unavailable OK
 * Case-insensitive name       OK
 * ISO-8859-12 is unavailable  OK
 * Unknown name is unavailable OK
 * Empty name is unavailable   OK
 * Spaces are not removed      OK
 * Additional zero is rejected OK
 * Missing argument error     OK
 * Numeric argument error     OK
 * Use the name for conversion OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * CdpList(), CdpTerm(), StrToUTF8(), UTF8ToStr(), Translate()
 *
 * $DOCEND$
 */

REQUEST ISO_8859_2
REQUEST CP852
REQUEST CP1250
REQUEST CP932
REQUEST MAZOVIA

PROCEDURE Main()

   LOCAL cEncoding := "CP852"

   Check( 'ISO-8859-2 exists           ', CdpExists( "ISO-8859-2" ), .T. )
   Check( 'CP852 exists                ', CdpExists( cEncoding ), .T. )
   Check( 'CP1250 exists               ', CdpExists( "CP1250" ), .T. )
   Check( 'CP932 exists                ', CdpExists( "CP932" ), .T. )
   Check( 'MAZOVIA exists              ', CdpExists( "MAZOVIA" ), .T. )
   Check( 'UTF-8 exists                ', CdpExists( "UTF-8" ), .T. )
   Check( 'Unlinked CP936 is unavailable ', CdpExists( "CP936" ), .F. )
   Check( 'Case-insensitive name       ', CdpExists( "cp1250" ), .T. )
   Check( 'ISO-8859-12 is unavailable  ', CdpExists( "ISO-8859-12" ), .F. )
   Check( 'Unknown name is unavailable ', CdpExists( "UNKNOWN" ), .F. )
   Check( 'Empty name is unavailable   ', CdpExists( "" ), .F. )
   Check( 'Spaces are not removed      ', CdpExists( " CP852" ), .F. )
   Check( 'Additional zero is rejected ', CdpExists( "CP852" + Chr( 0 ) ), .F. )
   Check( 'Missing argument error     ', s_Fails( {|| CdpExists() } ), .T. )
   Check( 'Numeric argument error     ', s_Fails( {|| CdpExists( 852 ) } ), .T. )

   IF CdpExists( cEncoding )
      Check( 'Use the name for conversion ', UTF8ToStr( "ął", cEncoding ), Chr( 165 ) + Chr( 136 ) )
   ENDIF

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

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
