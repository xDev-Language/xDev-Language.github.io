/*
 * $DOC$
 * $NAME$
 * TokenNext()
 *
 * $ONELINER$
 * Retrieve the next token from a string
 *
 * $SYNTAX$
 * TokenNext( [@]cString, [nTokenPos], [@cTokenEnv] ) --> cToken
 *
 * $ARGUMENTS$
 * cString
 * nTokenPos
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

   LOCAL lReady := TokenInit( "This is a search, 234" )

   Check( 'lReady           ', lReady, .T. )
   Check( 'TokenNext()      ', TokenNext(), "This" )
   Check( 'TokenNext()      ', TokenNext(), "is" )
   Check( 'TokenNext()      ', TokenNext(), "a" )
   Check( 'TokenNext()      ', TokenNext(), "search" )
   Check( 'TokenNext()      ', TokenNext(), "234" )
   Check( 'TokenNext()      ', TokenNext(), "" )
   Check( 'TokenNext( , 2 ) ', TokenNext( , 2 ), "is" )
   Check( 'TokenNext()      ', TokenNext(), "a" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
