/*
 * $DOC$
 * $NAME$
 * TokenLower()
 *
 * $ONELINER$
 * Change the first character of tokens to lower case
 *
 * $SYNTAX$
 * TokenLower( cString, [cDelimiter], [nTokenPos], [nSkipWidth] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * cDelimiter
 * nTokenPos
 * nSkipWidth
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'TokenLower( "good Morning" )      ', TokenLower( "good Morning" ), "good morning" )
   Check( 'TokenLower( "good Morning", , 5 ) ', TokenLower( "good Morning", , 5 ), "good morning" )
   Check( 'TokenLower( "/AB/AB/AB", "/", 2 ) ', TokenLower( "/AB/AB/AB", "/", 2 ), "/aB/aB/AB" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
