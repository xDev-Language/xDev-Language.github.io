/*
 * $DOC$
 * $NAME$
 * PosRange()
 *
 * $ONELINER$
 * Retrieve the position of the first character out of a range found in a string
 *
 * $SYNTAX$
 * PosRange( cRangeStart, cRangeEnd, cString, [lNotInRange], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cRangeStart
 * cRangeEnd
 * cString
 * lNotInRange
 * nSkipChars
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

   LOCAL cInput := "abc" + Chr( 9 ) + "def"

   Check( 'PosRange( Chr( 0 ), Chr( 31 ), cInput )       ', PosRange( Chr( 0 ), Chr( 31 ), cInput ), 4 )
   Check( 'PosRange( Chr( 0 ), Chr( 31 ), cInput, .T. )  ', PosRange( Chr( 0 ), Chr( 31 ), cInput, .T. ), 1 )
   Check( 'PosRange( "0", "9", "Room 101" )              ', PosRange( "0", "9", "Room 101" ), 6 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
