/*
 * $DOC$
 * $NAME$
 * TimeToSec()
 *
 * $ONELINER$
 * Calculate the number of seconds since midnight
 *
 * $SYNTAX$
 * TimeToSec( [cTime] ) --> nSeconds
 *
 * $ARGUMENTS$
 * cTime
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

   LOCAL cBegin := "12:55:44:33"
   LOCAL cEnd   := "14:56:12:22"

   Check( 'TimeToSec( "12:44:33:22" )            ', TimeToSec( "12:44:33:22" ), 45873.22 )
   Check( 'TimeToSec( "12:00" )                  ', TimeToSec( "12:00" ), 43200 )
   Check( 'TimeToSec( cEnd ) - TimeToSec( cBegin ) ', Round( TimeToSec( cEnd ) - TimeToSec( cBegin ), 2 ), 7227.89 )
   Check( 'TimeToSec( "25:00:00" )               ', TimeToSec( "25:00:00" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
