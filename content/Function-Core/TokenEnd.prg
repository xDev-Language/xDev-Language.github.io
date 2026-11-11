/*
 * $DOC$
 * $NAME$
 * TokenEnd()
 *
 * $ONELINER$
 * Test if tokens can still be found with TokenNext()
 *
 * $SYNTAX$
 * TokenEnd( [@cTokenEnv] ) --> lTokenEnd
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
 * lReady      OK
 * TokenEnd()  OK
 * TokenNext() OK
 * TokenEnd()  OK
 * TokenNext() OK
 * TokenEnd()  OK
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

   LOCAL lReady := TokenInit( "a b" )

   Check( 'lReady      ', lReady, .T. )
   Check( 'TokenEnd()  ', TokenEnd(), .F. )
   Check( 'TokenNext() ', TokenNext(), "a" )
   Check( 'TokenEnd()  ', TokenEnd(), .F. )
   Check( 'TokenNext() ', TokenNext(), "b" )
   Check( 'TokenEnd()  ', TokenEnd(), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
