/*
 * $DOC$
 * $NAME$
 * CToMonth()
 *
 * $ONELINER$
 * Return the number of a month from its name
 *
 * $SYNTAX$
 * CToMonth( cMonthName ) --> nMonth
 *
 * $ARGUMENTS$
 * cMonthName
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
 * CToMonth( "November" ) OK
 * CToMonth( "JUL" )      OK
 * CToMonth( "xyz" )      OK
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

   Check( 'CToMonth( "November" ) ', CToMonth( "November" ), 11 )
   Check( 'CToMonth( "JUL" )      ', CToMonth( "JUL" ), 7 )
   Check( 'CToMonth( "xyz" )      ', CToMonth( "xyz" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
