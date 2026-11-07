/*
 * $DOC$
 * $NAME$
 * Unselected()
 *
 * $ONELINER$
 * Select the unselected color of SetColor()
 *
 * $SYNTAX$
 * Unselected( ) --> cNull
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

   SetColor( "W+/B,N/W,N/N,N/N,GR/B" )
   Unselected()
   DevPos( 2, 40 )
   DevOut( "Unselected" )
   Standard()

   Check( 'ScreenAttr( 2, 40 ) ', ScreenAttr( 2, 40 ), ColorToN( "GR/B" ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
