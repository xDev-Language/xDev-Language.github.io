/*
 * $DOC$
 * $NAME$
 * IsCntrl()
 *
 * $ONELINER$
 * Check if the first character of a string is a control character
 *
 * $SYNTAX$
 * IsCntrl( cString ) --> lIsCtrlChar
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
 * IsCntrl( Chr( 9 ) )   OK
 * IsCntrl( Chr( 13 ) )  OK
 * IsCntrl( Chr( 127 ) ) OK
 * IsCntrl( "ABC" )      OK
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

   Check( 'IsCntrl( Chr( 9 ) )   ', IsCntrl( Chr( 9 ) ), .T. )
   Check( 'IsCntrl( Chr( 13 ) )  ', IsCntrl( Chr( 13 ) ), .T. )
   Check( 'IsCntrl( Chr( 127 ) ) ', IsCntrl( Chr( 127 ) ), .T. )
   Check( 'IsCntrl( "ABC" )      ', IsCntrl( "ABC" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
