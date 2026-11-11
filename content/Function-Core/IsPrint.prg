/*
 * $DOC$
 * $NAME$
 * IsPrint()
 *
 * $ONELINER$
 * Check if the first character of a string is a printable 7-bit ASCII character
 *
 * $SYNTAX$
 * IsPrint( cString ) --> lIs7BitPrintableChar
 *
 * $ARGUMENTS$
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
 * IsPrint( " " )      OK
 * IsPrint( "A" )      OK
 * IsPrint( Chr( 7 ) ) OK
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

   Check( 'IsPrint( " " )      ', IsPrint( " " ), .T. )
   Check( 'IsPrint( "A" )      ', IsPrint( "A" ), .T. )
   Check( 'IsPrint( Chr( 7 ) ) ', IsPrint( Chr( 7 ) ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
