/*
 * $DOC$
 * $NAME$
 * TokenExit()
 *
 * $ONELINER$
 * Release memory resources of the global tokenizer environment
 *
 * $SYNTAX$
 * TokenExit( ) --> lSuccess
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

   LOCAL lReady := TokenInit( "a b" )

   Check( 'lReady      ', lReady, .T. )
   Check( 'TokenNum()  ', TokenNum(), 2 )
   Check( 'TokenExit() ', TokenExit(), .T. )
   Check( 'TokenNum()  ', TokenNum(), 0 )
   Check( 'TokenNext() ', TokenNext(), "" )
   Check( 'TokenEnd()  ', TokenEnd(), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
