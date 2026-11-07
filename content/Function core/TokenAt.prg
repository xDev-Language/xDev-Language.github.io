/*
 * $DOC$
 * $NAME$
 * TokenAt()
 *
 * $ONELINER$
 * Return the start and end position of a token
 *
 * $SYNTAX$
 * TokenAt( [lNextDelimiter], [nCount], [@cTokenEnv] ) --> nPosition
 *
 * $ARGUMENTS$
 * lNextDelimiter
 * nCount
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

   Check( 'lReady         ', lReady, .T. )
   Check( 'TokenAt()      ', TokenAt(), 0 )
   Check( 'TokenNext()    ', TokenNext(), "This" )
   Check( 'TokenAt()      ', TokenAt(), 1 )
   Check( 'TokenNext()    ', TokenNext(), "is" )
   Check( 'TokenAt()      ', TokenAt(), 6 )
   Check( 'TokenAt( .T. ) ', TokenAt( .T. ), 8 )
   Check( 'TokenAt( , 4 ) ', TokenAt( , 4 ), 11 )
   Check( 'TokenAt( , 5 ) ', TokenAt( , 5 ), 19 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
