/*
 * $DOC$
 * $NAME$
 * TokenInit()
 *
 * $ONELINER$
 * Initialize the environment for the incremental tokenizer
 *
 * $SYNTAX$
 * TokenInit( [@cString], [cDelimiter], [nSkipWidth], [@cTokenEnv] ) --> lSuccess
 *
 * $ARGUMENTS$
 * cString
 * cDelimiter
 * nSkipWidth
 * cTokenEnv
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

   LOCAL cString := "A.B-C,D!E??"
   LOCAL cEnv    := ""

   Check( 'TokenInit( cString, "!?.,-" ) ', TokenInit( cString, "!?.,-" ), .T. )
   Check( 'TokenNum()                    ', TokenNum(), 5 )
   Check( 'TokenNext()                   ', TokenNext(), "A" )
   Check( 'TokenNext()                   ', TokenNext(), "B" )
   Check( 'cString                       ', cString, "A.B-C,D!E??" )
   Check( 'TokenInit()                   ', TokenInit(), .T. )
   Check( 'TokenNext()                   ', TokenNext(), "A" )
   Check( 'TokenInit( "p q", , , @cEnv ) ', TokenInit( "p q", , , @cEnv ), .T. )
   Check( 'TokenNext( , , @cEnv )        ', TokenNext( , , @cEnv ), "p" )
   Check( 'TokenNext()                   ', TokenNext(), "B" )
   Check( 'TokenNext( , , @cEnv )        ', TokenNext( , , @cEnv ), "q" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
