/*
 * $DOC$
 * $NAME$
 * CdpList()
 *
 * $ONELINER$
 * Return the names of encodings linked into the current program
 *
 * $SYNTAX$
 * CdpList() --> aEncodings
 *
 * $ARGUMENTS$
 * No arguments are required.
 *
 * $RETURNS$
 * A new one-dimensional array containing the registered encoding names as
 * character strings. Array indexes begin at 1.
 *
 * $DESCRIPTION$
 * Reads the same registry used by CdpExists(), StrToUTF8(), UTF8ToStr() and
 * Translate(). Each registered encoding appears once, using its canonical name.
 * UTF-8 is always available. Legacy encodings appear only when their modules
 * have been linked into the program with REQUEST or as a library dependency.
 * Without additional modules, the result contains only "UTF-8". The built-in
 * GT drivers also link CP437 for their default character mapping.
 *
 * Names follow registry order: ISO8859, PC, Windows, KOI8, MAZOVIA and UTF-8.
 * Numeric names are ordered within each group. The array is not sorted
 * alphabetically. Use Len( aEncodings ) to obtain the current number of entries.
 *
 * Every call returns an independent array. Changing its elements does not
 * modify another returned array or the runtime registry. The list is built
 * directly from the registry, so newly registered encodings appear automatically.
 *
 * $NOTES$
 * This is a read-only core function. It does not select an encoding, change
 * console settings or detect the encoding of text or files. No GT is required.
 *
 * The names describe the encodings linked into this executable. They do not
 * enumerate Windows-installed code pages or the fonts available in a terminal.
 * Support for an encoding does not mean that it can represent every character.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Available encodings: 3
 * CP852           OK
 * CP1250          OK
 * UTF-8           OK
 * Result is an array           OK
 * Independent returned arrays  OK
 * Registry remains unchanged   OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * CdpExists(), CdpTerm(), StrToUTF8(), UTF8ToStr(), Translate()
 *
 * $DOCEND$
 */

REQUEST CP852
REQUEST CP1250

PROCEDURE Main()

   LOCAL aEncodings := CdpList()
   LOCAL aOther := CdpList()
   LOCAL cFirst := aEncodings[ 1 ]
   LOCAL i

   QOut( "Available encodings: " + LTrim( Str( Len( aEncodings ) ) ) )
   FOR i := 1 TO Len( aEncodings )
      Check( PadR( aEncodings[ i ], 16 ), CdpExists( aEncodings[ i ] ), .T. )
   NEXT

   Check( 'Result is an array           ', ValType( aEncodings ), "A" )
   aEncodings[ 1 ] := "changed"
   Check( 'Independent returned arrays  ', aOther[ 1 ], cFirst )
   aEncodings := CdpList()
   Check( 'Registry remains unchanged   ', aEncodings[ 1 ], cFirst )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
