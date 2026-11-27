/*
 * $DOC$
 * $NAME$
 * Subtraction (-)
 *
 * $ONELINER$
 * Subtract numbers, subtract days from a date, or subtract two dates to obtain a day count.
 *
 * $SYNTAX$
 * left - right
 *
 * $DESCRIPTION$
 * Subtract numbers, subtract days from a date, or subtract two dates to obtain a day count. With strings, move the trailing spaces of the left operand to the end of the joined string.
 *
 * With typed numbers an integer and a fraction give the type of the fraction: FLOAT32 with any integer gives FLOAT32, FLOAT64 gives FLOAT64. An overflow of a typed result is a runtime error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL dDue := SToD( "20260302" )
   LOCAL dPaid := SToD( "20260305" )
   LOCAL cCode := "LOT   "

   QOut( "Days overdue", dPaid - dDue )
   QOut( "Reminder date", DToS( dDue - 2 ) )
   // Brackets make the padding visible.
   QOut( "[" + ( cCode - "42" ) + "]" )
   QOut( "[" + ( cCode + "42" ) + "]" )

   RETURN
