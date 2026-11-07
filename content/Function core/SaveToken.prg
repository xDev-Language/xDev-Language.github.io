/*
 * $DOC$
 * $NAME$
 * SaveToken()
 *
 * $ONELINER$
 * Save the global environment of the incremental tokenizer
 *
 * $SYNTAX$
 * SaveToken( ) --> cGlobalTokenEnv
 *
 * $ARGUMENTS$
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

   LOCAL lReady := TokenInit( "one two three" )
   LOCAL cSaved := ""

   Check( 'lReady                           ', lReady, .T. )
   Check( 'TokenNext()                      ', TokenNext(), "one" )
   Check( 'Len( cSaved := SaveToken() ) > 0 ', Len( cSaved := SaveToken() ) > 0, .T. )
   Check( 'TokenInit( "x y" )               ', TokenInit( "x y" ), .T. )
   Check( 'TokenNext()                      ', TokenNext(), "x" )
   Check( 'RestToken( cSaved )              ', RestToken( cSaved ), "" )
   Check( 'TokenNext()                      ', TokenNext(), "two" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
