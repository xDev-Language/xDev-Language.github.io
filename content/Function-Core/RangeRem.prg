/*
 * $DOC$
 * $NAME$
 * RangeRem()
 *
 * $ONELINER$
 * Delete character(s) within a specified range of characters
 *
 * $SYNTAX$
 * RangeRem( xRangeStart, xRangeEnd, cString ) --> cResult
 *
 * $ARGUMENTS$
 * xRangeStart
 * xRangeEnd
 * cString
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
 * RangeRem( 0, 31, cText )                 OK
 * RangeRem( 91, 64, "A()&BC/?D" )          OK
 * RangeRem( "0", "9", "Tel. 601 234 567" ) OK
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

   Check( 'RangeRem( 0, 31, cText )                 ', RangeRem( 0, 31, cText ), "ab" )
   Check( 'RangeRem( 91, 64, "A()&BC/?D" )          ', RangeRem( 91, 64, "A()&BC/?D" ), "ABCD" )
   Check( 'RangeRem( "0", "9", "Tel. 601 234 567" ) ', RangeRem( "0", "9", "Tel. 601 234 567" ), "Tel.   " )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
