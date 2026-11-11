/*
 * $DOC$
 * $NAME$
 * CToDoW()
 *
 * $ONELINER$
 * Return the number of a week day from its name
 *
 * $SYNTAX$
 * CToDoW( cDayName ) --> nDayOfWeek
 *
 * $ARGUMENTS$
 * cDayName
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
 * CToDoW( "Monday" ) OK
 * CToDoW( "mon" )    OK
 * CToDoW( "xyz" )    OK
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

   Check( 'CToDoW( "Monday" ) ', CToDoW( "Monday" ), 2 )
   Check( 'CToDoW( "mon" )    ', CToDoW( "mon" ), 2 )
   Check( 'CToDoW( "xyz" )    ', CToDoW( "xyz" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
