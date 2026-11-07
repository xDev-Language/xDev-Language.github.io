/*
 * $DOC$
 * $NAME$
 * WildMatch()
 *
 * $ONELINER$
 * Match a string against a pattern with question marks and asterisks
 *
 * $SYNTAX$
 * WildMatch( cPattern, cString, [lFullMatch] ) --> lFound
 *
 * $ARGUMENTS$
 * `cPattern`: a case-sensitive pattern. ? matches exactly one byte and
 * * matches zero or more bytes. Every other byte is literal.
 * `cString`: the string to match.
 * `lFullMatch`: .F., NIL or omission matches a prefix of cString; .T.
 * requires the pattern to match the entire string.
 *
 * $RETURNS$
 * .T. when the pattern matches, otherwise .F.
 *
 * $DESCRIPTION$
 * Matching starts at the beginning of the string. A leading * allows a
 * later part of the string to match. Without lFullMatch, bytes following
 * the matched prefix are allowed. A trailing * accepts any remaining bytes.
 * An empty pattern matches any prefix; in full mode it matches only an
 * empty string. Consecutive asterisks behave like a single asterisk.
 * There is no escape syntax, bracket character class or implicit file-name
 * rule. A dot and a path separator are ordinary literal bytes.
 *
 * $NOTES$
 * The function works on bytes, including Chr(0). For UTF-8, ? matches one
 * byte, not a complete Unicode character. Neither argument is modified.
 * Missing or non-string required arguments, or a non-logical non-NIL third
 * argument, raise error 1102. The invalid calls below deliberately verify
 * that error and catch it so the example can continue.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * At(), AtSkipStrings(), StrTran()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Prefix by default', WildMatch( "ab", "abcd" ), .T. )
   s_Check( 'Entire string required', WildMatch( "ab", "abcd", .T. ), .F. )
   s_Check( 'Exact match', WildMatch( "abcd", "abcd", .T. ), .T. )
   s_Check( 'Not a substring search', WildMatch( "bc", "abcd" ), .F. )
   s_Check( 'Leading star', WildMatch( "*bc", "abcd" ), .T. )
   s_Check( 'Leading star in full mode', WildMatch( "*bc", "abcd", .T. ), .F. )
   s_Check( 'Trailing star', WildMatch( "ab*", "abcd", .T. ), .T. )
   s_Check( 'Star can be empty', WildMatch( "a*b", "ab", .T. ), .T. )
   s_Check( 'Question mark', WildMatch( "a?c", "abc", .T. ), .T. )
   s_Check( 'Question needs a byte', WildMatch( "a?c", "ac", .T. ), .F. )
   s_Check( 'Consecutive stars', WildMatch( "a***b", "axxb", .T. ), .T. )
   s_Check( 'Several stars', WildMatch( "*a*b*c", "xxaaybbzc", .T. ), .T. )
   s_Check( 'Retry after partial match', WildMatch( "*ab", "aab", .T. ), .T. )
   s_Check( 'Retry in full mode', WildMatch( "*ab", "abab", .T. ), .T. )
   s_Check( 'Failed suffix', WildMatch( "*ab", "abac", .T. ), .F. )
   s_Check( 'Empty prefix', WildMatch( "", "abc" ), .T. )
   s_Check( 'Empty pattern full mode', WildMatch( "", "abc", .T. ), .F. )
   s_Check( 'Both empty', WildMatch( "", "", .T. ), .T. )
   s_Check( 'Star and empty text', WildMatch( "*", "", .T. ), .T. )
   s_Check( 'Question and empty text', WildMatch( "?", "", .T. ), .F. )
   s_Check( 'Case sensitive', WildMatch( "ABC", "abc", .T. ), .F. )
   s_Check( 'Dot is literal', WildMatch( "a.c", "abc", .T. ), .F. )
   s_Check( 'NIL means prefix', WildMatch( "ab", "abc", NIL ), .T. )
   s_Check( 'Binary data', WildMatch( "A?B", "A" + Chr( 0 ) + "B", .T. ), .T. )
   s_Check( 'UTF-8 needs two bytes', WildMatch( "??", "ą", .T. ), .T. )
   s_Check( 'One byte is insufficient', WildMatch( "?", "ą", .T. ), .F. )
   s_Check( 'Expected error: pattern type', s_ErrorCode( {|| WildMatch( 1, "abc" ) } ), 1102 )
   s_Check( 'Expected error: text type', s_ErrorCode( {|| WildMatch( "*", NIL ) } ), 1102 )
   s_Check( 'Expected error: mode type', s_ErrorCode( {|| WildMatch( "*", "abc", 1 ) } ), 1102 )
   s_Check( 'Expected error: missing text', s_ErrorCode( {|| WildMatch( "*" ) } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

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
