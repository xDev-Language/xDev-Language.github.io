/*
 * $DOC$
 * $NAME$
 * RestToken()
 *
 * $ONELINER$
 * Restore the global environment of the incremental tokenizer
 *
 * $SYNTAX$
 * RestToken( cSavedTokenEnv ) --> cNullString
 *
 * $ARGUMENTS$
 * cSavedTokenEnv
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
   Check( 'RestToken( cSaved )              ', RestToken( cSaved ), "" )
   Check( 'TokenNext()                      ', TokenNext(), "two" )
   Check( 'RestToken( "bad" )               ', RestToken( "bad" ), "" )
   Check( 'TokenNum()                       ', TokenNum(), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
