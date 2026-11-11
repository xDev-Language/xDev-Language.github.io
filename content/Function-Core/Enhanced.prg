/*
 * $DOC$
 * $NAME$
 * Enhanced()
 *
 * $ONELINER$
 * Select the enhanced color of SetColor()
 *
 * $SYNTAX$
 * Enhanced( ) --> cNull
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
   DevPos( 2, 40 )
   DevOut( "Enhanced" )
   Standard()

   Check( 'ScreenAttr( 2, 40 ) ', ScreenAttr( 2, 40 ), ColorToN( "N/W" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
