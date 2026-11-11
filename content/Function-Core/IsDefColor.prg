/*
 * $DOC$
 * $NAME$
 * IsDefColor()
 *
 * $ONELINER$
 * Check if the default color is set
 *
 * $SYNTAX$
 * IsDefColor( ) --> lIsDefaultColor
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

   LOCAL cDefault := SetColor()

   Check( 'IsDefColor()                     ', IsDefColor(), .T. )

   SetColor( "W+/B,N/W" )
   Check( 'IsDefColor() after SetColor()    ', IsDefColor(), .F. )

   SetColor( cDefault )
   Check( 'IsDefColor() after restoring     ', IsDefColor(), .T. )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
