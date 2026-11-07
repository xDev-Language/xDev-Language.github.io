/*
 * $DOC$
 * $NAME$
 * AtRepl()
 *
 * $ONELINER$
 * Replace occurrences of a byte sequence in a string
 *
 * $SYNTAX$
 * AtRepl( cSearch, cString, cReplace, [nCount], [lOneOnly] ) --> cResult
 *
 * $ARGUMENTS$
 * `cSearch`: a byte sequence to find, matched exactly and case-sensitively.
 * `cString`: the string to search. May be passed by reference.
 * `cReplace`: the replacement string. An empty string deletes selected matches.
 * `nCount`: a positive occurrence number, counted from 1. Omitted, NIL or
 * a value <= 0 means all occurrences when lOneOnly is .F., or the last
 * occurrence when lOneOnly is .T.
 * `lOneOnly`: .T. replaces only the selected occurrence; .F., NIL or omission
 * replaces all occurrences up to and including it.
 *
 * $RETURNS$
 * The string with the selected replacements. Returns the original string
 * when cSearch is empty or no selected occurrence is found.
 *
 * $DESCRIPTION$
 * Matches are counted from left to right without overlapping. Replacement
 * text is not searched again. Replacement strings may be shorter, longer
 * or empty. With lOneOnly == .F., a positive nCount greater than the total
 * number of matches replaces every available match. With lOneOnly == .T.,
 * a missing occurrence leaves the string unchanged.
 * When cString is passed by reference and cSearch and cReplace have equal
 * byte lengths, cString also receives the result. If the lengths differ,
 * the result is returned but the referenced variable is left unchanged.
 *
 * $NOTES$
 * Operates on bytes, including embedded Chr(0), rather than Unicode characters.
 * Numeric nCount uses its integer part. CSetAtMuPa() and SetAtLike() settings
 * are not implemented in xDev and do not affect this function.
 *
 * The example deliberately calls the function with invalid arguments.
 * These calls must raise argument error 1102. s_ErrorCode() catches the
 * error so that the example continues; a missing or different error fails
 * the check labelled 'Expected argument error'.
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
 * AtNum(), AtAdjust(), StrTran(), At()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cText := "red-red"
   LOCAL cResult

   s_Check( 'All matches', AtRepl( "red", "red-red-red", "blue" ), "blue-blue-blue" )
   s_Check( 'First two', AtRepl( "red", "red-red-red", "blue", 2 ), "blue-blue-red" )
   s_Check( 'Only second', AtRepl( "red", "red-red-red", "blue", 2, .T. ), "red-blue-red" )
   s_Check( 'Only last', AtRepl( "red", "red-red-red", "blue", NIL, .T. ), "red-red-blue" )
   s_Check( 'Delete', AtRepl( "-", "red-blue", "" ), "redblue" )
   s_Check( 'No overlap', AtRepl( "aa", "aaa", "x" ), "xa" )
   s_Check( 'No repeated search', AtRepl( "a", "a", "aa" ), "aa" )
   s_Check( 'Same replacement', AtRepl( "a", "a-a", "a" ), "a-a" )
   s_Check( 'Missing occurrence', AtRepl( "a", "a-a", "x", 3, .T. ), "a-a" )
   s_Check( 'Count exceeds matches', AtRepl( "a", "a-a", "x", 3 ), "x-x" )
   s_Check( 'Empty search', AtRepl( "", "abc", "x" ), "abc" )
   s_Check( 'Empty text', AtRepl( "a", "", "x" ), "" )
   s_Check( 'Binary string', AtRepl( Chr( 0 ), "A" + Chr( 0 ) + "B", ":" ), "A:B" )

   cResult := AtRepl( "red", @cText, "sky", 1 )
   s_Check( 'Reference result', cResult, "sky-red" )
   s_Check( 'Reference updated', cText, "sky-red" )

   cResult := AtRepl( "sky", @cText, "blue" )
   s_Check( 'Longer result', cResult, "blue-red" )
   s_Check( 'Reference keeps length', cText, "sky-red" )

   s_Check( 'Expected argument error: non-string replacement', s_ErrorCode( {|| AtRepl( "a", "abc", 1 ) } ), 1102 )
   s_Check( 'Expected argument error: non-logical mode', s_ErrorCode( {|| AtRepl( "a", "abc", "x", 1, 1 ) } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

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
