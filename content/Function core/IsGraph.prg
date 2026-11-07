/*
 * $DOC$
 * $NAME$
 * IsGraph()
 *
 * $ONELINER$
 * Check if the first character of a string is a 7-bit graphical ASCII character
 *
 * $SYNTAX$
 * IsGraph( cString ) --> lIs7BitGraphicalChar
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

   Check( 'IsGraph( "!" )      ', IsGraph( "!" ), .T. )
   Check( 'IsGraph( "~" )      ', IsGraph( "~" ), .T. )
   Check( 'IsGraph( " " )      ', IsGraph( " " ), .F. )
   Check( 'IsGraph( Chr( 9 ) ) ', IsGraph( Chr( 9 ) ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
