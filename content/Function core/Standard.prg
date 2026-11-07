/*
 * $DOC$
 * $NAME$
 * Standard()
 *
 * $ONELINER$
 * Select the standard color of SetColor()
 *
 * $SYNTAX$
 * Standard( ) --> cNull
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

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   SetColor( "W+/B,N/W" )
   Enhanced()
   Standard()
   DevPos( 2, 40 )
   DevOut( "Standard" )

   Check( 'ScreenAttr( 2, 40 ) ', ScreenAttr( 2, 40 ), ColorToN( "W+/B" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
