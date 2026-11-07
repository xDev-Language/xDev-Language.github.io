/*
 * $DOC$
 * $NAME$
 * TokenNum()
 *
 * $ONELINER$
 * Return the number of tokens in a tokenizer environment
 *
 * $SYNTAX$
 * TokenNum( [@cTokenEnv] ) --> nTokenCount
 *
 * $ARGUMENTS$
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

   Check( 'TokenInit( "one two three" )         ', TokenInit( "one two three" ), .T. )
   Check( 'TokenNum()                           ', TokenNum(), 3 )
   Check( 'TokenInit( "one,two,,four", ",", 1 ) ', TokenInit( "one,two,,four", ",", 1 ), .T. )
   Check( 'TokenNum()                           ', TokenNum(), 4 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
