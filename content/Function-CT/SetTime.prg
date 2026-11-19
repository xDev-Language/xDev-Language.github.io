/*
 * $DOC$
 * $NAME$
 * SetTime()
 *
 * $ONELINER$
 * Change the time of the system clock
 *
 * $SYNTAX$
 * SetTime( cTime ) --> lSuccess
 *
 * $ARGUMENTS$
 * `cTime` The new time as "hh", "hh:mm", "hh:mm:ss" or "hh:mm:ss:cc", where cc are hundredths
 * of a second. The parts not given are 0.
 *
 * $RETURNS$
 * .T. when the time was set. .F. for a text of another form or with a value out of range, or
 * when the program has no right to change the clock.
 *
 * $DESCRIPTION$
 * SetTime() sets the local time of the computer. The date stays.
 *
 * $NOTES$
 * Changing the clock needs the rights of an administrator on Windows and of root on Linux. Without
 * them SetTime() gives .F. and the clock does not change.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetTime() gives a logical value  OK
 * hour 25 gives .F.                OK
 * a wrong form gives .F.           OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetDate(), Time()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   /* the current time again, so the clock does not really change */
   Check( 'SetTime() gives a logical value  ', ValType( SetTime( Time() ) ), "L" )
   Check( 'hour 25 gives .F.                ', SetTime( "25:00" ), .F. )
   Check( 'a wrong form gives .F.           ', SetTime( "12.30" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
