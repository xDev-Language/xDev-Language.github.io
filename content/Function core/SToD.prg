/*
 * $DOC$
 *
 * $NAME$
 * SToD()
 *
 * $ONELINER$
 * Convert a YYYYMMDD string to a date
 *
 * $SYNTAX$
 * SToD( [cDate] ) --> dDate
 *
 * $ARGUMENTS$
 * `cDate`: a string of exactly eight digits: four for the year, two for the
 * month and two for the day. Omitted or NIL means an empty date.
 *
 * $RETURNS$
 * A date value, or an empty date when the string does not describe a valid date.
 *
 * $DESCRIPTION$
 * Converts a date in the fixed YYYYMMDD format, independently of SET DATE,
 * SET EPOCH and SET CENTURY. The year must be between 0001 and 9999.
 * The month and day are checked, including leap years.
 * An empty string, a string of a different length, non-digit characters or
 * an invalid calendar date returns an empty date. Other argument types
 * raise an argument error.
 *
 * $NOTES$
 * Use DToS() to convert the resulting date back to YYYYMMDD.
 *
 * The example deliberately calls the function with invalid arguments.
 * These calls must raise argument error 1102. s_ErrorCode() catches the
 * error so that the example continues; a missing or different error fails
 * the check labelled 'Expected argument error'.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * CToD(), DToS(), DToC(), Empty()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Valid date', DToS( SToD( "20261105" ) ), "20261105" )
   s_Check( 'Leap day', DToS( SToD( "20240229" ) ), "20240229" )
   s_Check( 'Invalid leap day', Empty( SToD( "20260229" ) ), .T. )
   s_Check( 'Invalid day', Empty( SToD( "20260230" ) ), .T. )
   s_Check( 'Wrong length', Empty( SToD( "202611" ) ), .T. )
   s_Check( 'Non-digit character', Empty( SToD( "2026A105" ) ), .T. )
   s_Check( 'Empty string', Empty( SToD( "" ) ), .T. )
   s_Check( 'NIL', Empty( SToD( NIL ) ), .T. )
   s_Check( 'No argument', Empty( SToD() ), .T. )

   s_Check( 'Expected argument error: numeric date', s_ErrorCode( {|| SToD( 123 ) } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN

STATIC FUNCTION s_ErrorCode( bAction )

   LOCAL nCode := 0
   LOCAL oError
   LOCAL bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER USING oError
      nCode := oError:SubCode
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
