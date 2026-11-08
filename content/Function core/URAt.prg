/*
 * $DOC$
 * $NAME$
 * URAt()
 *
 * $ONELINER$
 * Find the last occurrence of a substring using UTF-8 character positions
 *
 * $SYNTAX$
 * URAt( cSearch, cText, [nStart], [nEnd] ) --> nPosition
 *
 * $ARGUMENTS$
 * cSearch
 * The required substring, encoded as well-formed UTF-8.
 *
 * cText
 * The required UTF-8 string in which to search.
 *
 * nStart
 * Optional numeric first character position of the search range. Defaults to
 * 1. Values below 1 are treated as 1. The fractional part is discarded.
 *
 * nEnd
 * Optional numeric last character position of the search range, inclusive.
 * Defaults to ULen( cText ). Values beyond the last character are clamped to
 * that last position. The fractional part is discarded.
 *
 * $RETURNS$
 * The character position of the last matching substring, counted from 1 in
 * the complete cText. Returns 0 for no match, an empty search string, an empty
 * target or a range whose start exceeds its end.
 *
 * $DESCRIPTION$
 * Searches for the last exact occurrence contained entirely within the
 * inclusive range nStart through nEnd. Both range bounds are measured from
 * the beginning of cText. A result remains an absolute character position,
 * not a position relative to nStart. Overlapping occurrences are considered.
 *
 * Positions count Unicode scalars, including emoji and combining marks.
 * Matching is case-sensitive and does not normalize Unicode text. Embedded
 * zero bytes are supported in both strings. Neither input is modified.
 *
 * $NOTES$
 * Missing required arguments, wrong argument types and malformed UTF-8 in
 * either string raise error 1102. Both strings are validated completely,
 * including bytes outside a restricted search range.
 *
 * RAt() returns byte positions. UAt() finds the first occurrence using
 * character positions; URAt() finds the last. No code page setting, GT driver
 * or Unicode font is required. Convert known legacy encodings before searching.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Last Polish letter                OK
 * Last four-byte character          OK
 * Last two-character match          OK
 * First search comparison           OK
 * Byte search comparison            OK
 * Restricted end                    OK
 * Whole match must fit range        OK
 * Absolute result in a range        OK
 * Range start                       OK
 * Start below one                   OK
 * End beyond text                   OK
 * Start beyond text                 OK
 * End below one                     OK
 * Reversed range                    OK
 * Fractional range                  OK
 * Overlapping matches               OK
 * Empty search                      OK
 * Empty target                      OK
 * Missing substring                 OK
 * Case-sensitive matching           OK
 * No Unicode normalization          OK
 * Embedded zero search              OK
 * Multi-character zero match        OK
 * Invalid search error              OK
 * Invalid target error              OK
 * Invalid tail outside range        OK
 * Wrong search type                 OK
 * Wrong target type                 OK
 * Wrong range type                  OK
 * Missing target                    OK
 *
 * $CATEGORY$
 * Strings
 *
 * $HEADER$
 * No header file is required.
 *
 * $SEEALSO$
 * UAt(), USubStr(), ULen(), RAt(), StrIsUTF8(), StrToUTF8()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cText := "ą😃bą😃"

   Check( 'Last Polish letter', URAt( "ą", cText ), 4 )
   Check( 'Last four-byte character', URAt( "😃", cText ), 5 )
   Check( 'Last two-character match', URAt( "ą😃", cText ), 4 )
   Check( 'First search comparison', UAt( "😃", cText ), 2 )
   Check( 'Byte search comparison', RAt( "😃", cText ), 10 )
   Check( 'Restricted end', URAt( "😃", cText, 1, 4 ), 2 )
   Check( 'Whole match must fit range', URAt( "ą😃", cText, 1, 4 ), 1 )
   Check( 'Absolute result in a range', URAt( "😃", cText, 4, 5 ), 5 )
   Check( 'Range start', URAt( "ą😃", cText, 4, 5 ), 4 )
   Check( 'Start below one', URAt( "😃", cText, -1 ), 5 )
   Check( 'End beyond text', URAt( "😃", cText, 1, 99 ), 5 )
   Check( 'Start beyond text', URAt( "😃", cText, 99 ), 0 )
   Check( 'End below one', URAt( "😃", cText, 1, 0 ), 0 )
   Check( 'Reversed range', URAt( "😃", cText, 4, 2 ), 0 )
   Check( 'Fractional range', URAt( "😃", cText, 1.9, 4.9 ), 2 )
   Check( 'Overlapping matches', URAt( "aa", "aaaa" ), 3 )
   Check( 'Empty search', URAt( "", cText ), 0 )
   Check( 'Empty target', URAt( "ą", "" ), 0 )
   Check( 'Missing substring', URAt( "x", cText ), 0 )
   Check( 'Case-sensitive matching', URAt( "ą", "Ą" ), 0 )
   Check( 'No Unicode normalization', URAt( "ą", "a" + UTF8Chr( 0x0328 ) ), 0 )
   Check( 'Embedded zero search', URAt( Chr( 0 ), "ą" + Chr( 0 ) + "b" + Chr( 0 ) ), 4 )
   Check( 'Multi-character zero match', URAt( "b" + Chr( 0 ), "ą" + Chr( 0 ) + "b" + Chr( 0 ) ), 3 )
   Check( 'Invalid search error', s_ErrorCode( {|| URAt( Chr( 196 ), cText ) } ), 1102 )
   Check( 'Invalid target error', s_ErrorCode( {|| URAt( "A", "A" + Chr( 255 ) ) } ), 1102 )
   Check( 'Invalid tail outside range', s_ErrorCode( {|| URAt( "A", "A" + Chr( 255 ), 1, 1 ) } ), 1102 )
   Check( 'Wrong search type', s_ErrorCode( {|| URAt( 1, cText ) } ), 1102 )
   Check( 'Wrong target type', s_ErrorCode( {|| URAt( "A", 1 ) } ), 1102 )
   Check( 'Wrong range type', s_ErrorCode( {|| URAt( "A", "ABC", "1" ) } ), 1102 )
   Check( 'Missing target', s_ErrorCode( {|| URAt( "A" ) } ), 1102 )

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
