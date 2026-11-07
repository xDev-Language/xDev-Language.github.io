/*
 * $DOC$
 * $NAME$
 * AtAdjust()
 *
 * $ONELINER$
 * Move a selected substring to a specified byte position
 *
 * $SYNTAX$
 * AtAdjust( cSearch, cString, nEndPos, [nCount], [nSkipChars], [xInsChar] ) --> cJustified
 *
 * $ARGUMENTS$
 * `cSearch`: the byte sequence to find, matched exactly and case-sensitively.
 * `cString`: the string to adjust.
 * `nEndPos`: the desired starting position of the selected match, counted
 * from 1 in the complete string. This is a target position, not a search limit.
 * `nCount`: the occurrence to select. Omitted, NIL or a value <= 0 selects
 * the last occurrence. Positive values select the first, second, etc.
 * `nSkipChars`: the number of initial bytes to exclude from searching;
 * omitted, NIL or a negative value means 0. These bytes remain in the result.
 * `xInsChar`: a fill byte, given as a numeric code from 0 to 255 or the first
 * byte of a string. Omitted, NIL or an empty string means a space.
 *
 * $RETURNS$
 * The adjusted string. Returns the original string if no match is found,
 * nEndPos is less than 1, or moving left would remove a non-fill byte.
 *
 * $DESCRIPTION$
 * Selects an occurrence as AtNum() does. Moving right inserts fill bytes
 * immediately before the match. Moving left removes the required number
 * of fill bytes immediately before it; all bytes to be removed must match
 * xInsChar. The selected match and the remainder of the string move together.
 * The original variable is not modified; assign the returned string to save it.
 *
 * $NOTES$
 * Positions and lengths count bytes, including embedded Chr(0), not Unicode
 * characters or screen columns. Numeric arguments use their integer part.
 * Searches do not overlap. CSetAtMuPa() and SetAtLike() settings are not
 * implemented in xDev and do not affect this function.
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
 * AtNum(), AtRepl(), At(), Replicate()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Insert spaces', AtAdjust( ":", "A:B", 4 ), "A  :B" )
   s_Check( 'Remove spaces', AtAdjust( ":", "A   :B", 2 ), "A:B" )
   s_Check( 'Keep other bytes', AtAdjust( ":", "ABC:B", 2 ), "ABC:B" )
   s_Check( 'Custom fill', AtAdjust( ":", "A:B", 4, NIL, NIL, "." ), "A..:B" )
   s_Check( 'Numeric fill', AtAdjust( ":", "A:B", 4, NIL, NIL, 46 ), "A..:B" )
   s_Check( 'Remove custom fill', AtAdjust( ":", "A...:B", 2, NIL, NIL, "." ), "A:B" )
   s_Check( 'First match', AtAdjust( ":", "A:B:C", 4, 1 ), "A  :B:C" )
   s_Check( 'Last match', AtAdjust( ":", "A:B:C", 6 ), "A:B  :C" )
   s_Check( 'Skip initial bytes', AtAdjust( ":", "A:B:C", 6, 1, 2 ), "A:B  :C" )
   s_Check( 'Already aligned', AtAdjust( ":", "A:B", 2 ), "A:B" )
   s_Check( 'Missing occurrence', AtAdjust( ":", "A:B", 4, 2 ), "A:B" )
   s_Check( 'Empty search', AtAdjust( "", "A:B", 4 ), "A:B" )
   s_Check( 'Invalid position', AtAdjust( ":", "A:B", 0 ), "A:B" )
   s_Check( 'Binary string', AtAdjust( Chr( 0 ), "A" + Chr( 0 ) + "B", 3 ), "A " + Chr( 0 ) + "B" )

   s_Check( 'Expected argument error: non-string search', s_ErrorCode( {|| AtAdjust( 1, "A:B", 4 ) } ), 1102 )
   s_Check( 'Expected argument error: non-numeric position', s_ErrorCode( {|| AtAdjust( ":", "A:B", "4" ) } ), 1102 )
   s_Check( 'Expected argument error: fill outside byte range', s_ErrorCode( {|| AtAdjust( ":", "A:B", 4, NIL, NIL, 256 ) } ), 1102 )

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
