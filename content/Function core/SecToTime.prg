/*
 * $DOC$
 * $NAME$
 * SecToTime()
 *
 * $ONELINER$
 * Convert numeric seconds into a time formatted character string
 *
 * $SYNTAX$
 * SecToTime( [nSeconds], [lHundredth] ) --> cTime
 *
 * $ARGUMENTS$
 * nSeconds
 * lHundredth
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

   LOCAL nBegin := 170
   LOCAL nEnd   := 3656

   Check( 'SecToTime( nEnd - nBegin )   ', SecToTime( nEnd - nBegin ), "00:58:06" )
   Check( 'SecToTime( 45873.22, .T. )   ', SecToTime( 45873.22, .T. ), "12:44:33:22" )
   Check( 'SecToTime( 45366.98 )        ', SecToTime( 45366.98 ), "12:36:06" )
   Check( 'SecToTime( 90000 )           ', SecToTime( 90000 ), "01:00:00" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
