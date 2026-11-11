/*
 * $DOC$
 * $NAME$
 * RToD()
 *
 * $ONELINER$
 * Convert radians to degrees
 *
 * $SYNTAX$
 * RToD( nRadians ) --> nDegrees
 *
 * $ARGUMENTS$
 * nRadians
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
 * RToD( 0 )        OK
 * RToD( Pi() )     OK
 * RToD( 2 * Pi() ) OK
 * RToD( -Pi() )    OK
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

   Check( 'RToD( 0 )        ', RToD( 0 ), 0 )
   Check( 'RToD( Pi() )     ', RToD( Pi() ), 180 )
   Check( 'RToD( 2 * Pi() ) ', RToD( 2 * Pi() ), 360 )
   Check( 'RToD( -Pi() )    ', RToD( -Pi() ), -180 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
