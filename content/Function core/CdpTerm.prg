/*
 * $DOC$
 * $NAME$
 * CdpTerm()
 *
 * $ONELINER$
 * Return the console output encoding or the encoding recorded at program startup
 *
 * $SYNTAX$
 * CdpTerm( [lInitial] ) --> cEncoding
 *
 * $ARGUMENTS$
 * lInitial
 * An optional logical value. Omitted, NIL or .F. requests the current setting.
 * .T. requests the setting recorded when the xDev runtime started.
 *
 * $RETURNS$
 * The encoding name as a character string. On Windows, UTF-8 is returned as
 * "UTF-8" and other console code pages as "CP" followed by their number,
 * for example "CP852". On Linux, the name comes from the selected locale,
 * for example "UTF-8", "ISO-8859-2" or "ANSI_X3.4-1968".
 *
 * An empty string is returned when the encoding cannot be read. On Windows,
 * this can occur when the process has no attached console.
 *
 * $DESCRIPTION$
 * On Windows, reads the output code page of the console attached to the
 * process. The input code page can differ. CdpTerm( .T. ) returns the output
 * code page saved before runtime initialization changed any console settings.
 *
 * The Windows runtime attempts to switch console output to UTF-8 before
 * Main() starts. A program launched from a CP852 console can therefore receive
 * "UTF-8" from CdpTerm() and "CP852" from CdpTerm( .T. ). The initial input
 * and output code pages are restored when the runtime exits normally.
 *
 * On Linux, reads the codeset of the locale selected by LC_ALL, LC_CTYPE and
 * LANG, in that order. The lookup does not change the program's global locale.
 * CdpTerm( .T. ) returns the value saved at startup; the default call performs
 * a new lookup using the current environment. This is the locale's encoding,
 * not a query of the terminal emulator's actual rendering capabilities.
 *
 * $NOTES$
 * This is a read-only core function. No GT driver or header file is required.
 * It does not return the fallback code page selected by GtInfo( GTI_CODEPAGE ).
 *
 * An encoding name does not confirm that the terminal and font can display
 * every Unicode character. In particular, "UTF-8" does not guarantee emoji
 * display. The function does not detect the encoding of strings or text files.
 * Use an explicit source encoding such as "CP852", "CP1250" or "ISO-8859-2"
 * when converting file contents with StrToUTF8() or Translate().
 * Reporting an encoding does not link its conversion table. A legacy table
 * must be included separately with REQUEST before it is used for conversion.
 *
 * The optional lInitial argument is an xDev extension to the Harbour-style
 * function name. Unsupported argument types raise error 1102.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Current output encoding: UTF-8
 * Encoding at startup:     UTF-8
 * Current result is a string OK
 * Initial result is a string OK
 * Default means current      OK
 * NIL means current          OK
 *
 * $CATEGORY$
 * Environment
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * CdpList(), CdpExists(), Translate(), StrToUTF8(), UTF8ToStr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cCurrent := CdpTerm()
   LOCAL cInitial := CdpTerm( .T. )

   QOut( "Current output encoding: " + IIF( Empty( cCurrent ), "(unavailable)", cCurrent ) )
   QOut( "Encoding at startup:     " + IIF( Empty( cInitial ), "(unavailable)", cInitial ) )

   Check( 'Current result is a string ', ValType( cCurrent ), "C" )
   Check( 'Initial result is a string ', ValType( cInitial ), "C" )
   Check( 'Default means current      ', CdpTerm( .F. ), cCurrent )
   Check( 'NIL means current          ', CdpTerm( NIL ), cCurrent )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
