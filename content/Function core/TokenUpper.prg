/*
 * $DOC$
 * $NAME$
 * TokenUpper()
 *
 * $ONELINER$
 * Change the first character of tokens to upper case
 *
 * $SYNTAX$
 * TokenUpper( cString, [cDelimiter], [nTokenPos], [nSkipWidth] ) --> cResult
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

   Check( 'TokenUpper( "Good morning" )        ', TokenUpper( "Good morning" ), "Good Morning" )
   Check( 'TokenUpper( "Good morning", , 5 )   ', TokenUpper( "Good morning", , 5 ), "Good Morning" )
   Check( 'TokenUpper( "/ab/ab/ab", "/", 2 )   ', TokenUpper( "/ab/ab/ab", "/", 2 ), "/Ab/Ab/ab" )
   Check( 'TokenUpper( "anna maria kowalska" ) ', TokenUpper( "anna maria kowalska" ), "Anna Maria Kowalska" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
