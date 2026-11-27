/*
 * $DOC$
 * $NAME$
 * BuildDate()
 *
 * $ONELINER$
 * Return the date and time when the xDev runtime was built
 *
 * $SYNTAX$
 * BuildDate( ) --> cDateTime
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * A text such as "Nov 19 2026 10:15:00": the month, the day, the year and the time.
 *
 * $DESCRIPTION$
 * Show BuildDate() in an About window or write it into a log to know which xDev built the
 * program.
 *
 * $NOTES$
 * Version( VERSION_BUILD_DATE_STR ) and Version( VERSION_BUILD_TIME ) give the two parts alone.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * BuildDate() has 20 characters    OK
 * date and time of Version()       OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Version(), Compiler()
 *
 * $DOCEND$
 */

#include "version.ch"

PROCEDURE Main()

   Check( 'BuildDate() has 20 characters    ', Len( BuildDate() ), 20 )
   Check( 'date and time of Version()       ', BuildDate(), Version( VERSION_BUILD_DATE_STR ) + " " + Version( VERSION_BUILD_TIME ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
