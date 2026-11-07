/*
 * $DOC$
 * $NAME$
 * RangeRepl()
 *
 * $ONELINER$
 * Replace character(s) within a specified range of characters
 *
 * $SYNTAX$
 * RangeRepl( xRangeStart, xRangeEnd, cString, cReplace ) --> cResult
 *
 * $ARGUMENTS$
 * xRangeStart
 * xRangeEnd
 * cString
 * cReplace
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

   LOCAL cText := "a" + Chr( 5 ) + "b" + Chr( 9 )

   Check( 'RangeRepl( Chr( 0 ), Chr( 31 ), cText, "." )  ', RangeRepl( Chr( 0 ), Chr( 31 ), cText, "." ), "a.b." )
   Check( 'RangeRepl( "", Chr( 65 ), "123400", "0" )     ', RangeRepl( "", Chr( 65 ), "123400", "0" ), "000000" )
   Check( 'RangeRepl( "0", "8", "0212 - 78 67 43", "9" ) ', RangeRepl( "0", "8", "0212 - 78 67 43", "9" ), "9999 - 99 99 99" )
   Check( 'RangeRepl( 91, 64, "A()&BC/?D", "-" )         ', RangeRepl( 91, 64, "A()&BC/?D", "-" ), "A---BC--D" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
