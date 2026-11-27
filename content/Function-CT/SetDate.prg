/*
 * $DOC$
 * $NAME$
 * SetDate()
 *
 * $ONELINER$
 * Change the date of the system clock
 *
 * $SYNTAX$
 * SetDate( dDate ) --> lSuccess
 *
 * $ARGUMENTS$
 * `dDate` The new date, from 1 January 1970 on.
 *
 * $RETURNS$
 * .T. when the date was set. .F. for an empty or earlier date, or when the program has no right
 * to change the clock.
 *
 * $DESCRIPTION$
 * SetDate() sets the local date of the computer. The time of the day stays.
 *
 * $NOTES$
 * Changing the clock needs the rights of an administrator on Windows and of root on Linux. Without
 * them SetDate() gives .F. and the clock does not change.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetDate() gives a logical value  OK
 * an empty date gives .F.          OK
 * a date before 1970 gives .F.     OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetTime(), Date()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* today again, so the clock does not really change */
   Check( 'SetDate() gives a logical value  ', ValType( SetDate( Date() ) ), "L" )
   Check( 'an empty date gives .F.          ', SetDate( CToD( "" ) ), .F. )
   Check( 'a date before 1970 gives .F.     ', SetDate( SToD( "19691231" ) ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
