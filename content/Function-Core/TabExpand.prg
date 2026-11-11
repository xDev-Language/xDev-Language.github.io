/*
 * $DOC$
 * $NAME$
 * TabExpand()
 *
 * $ONELINER$
 * Replace a tab with a specified number of another character
 *
 * $SYNTAX$
 * TabExpand( cString, [nTabWidth], [xFillChar] ) --> cResultString
 *
 * $ARGUMENTS$
 * cString
 * nTabWidth
 * xFillChar
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
 * TabExpand( "-" + Chr( 9 ) + "!" )            OK
 * TabExpand( "----" + Chr( 9 ) + "!" )         OK
 * TabExpand( "-" + Chr( 9 ) + "!", "+" )       OK
 * TabExpand( "-" + Chr( 9 ) + "!", 4 )         OK
 * TabExpand( "----" + Chr( 9 ) + "!", 8, "+" ) OK
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

   Check( 'TabExpand( "-" + Chr( 9 ) + "!" )            ', TabExpand( "-" + Chr( 9 ) + "!" ), "-       !" )
   Check( 'TabExpand( "----" + Chr( 9 ) + "!" )         ', TabExpand( "----" + Chr( 9 ) + "!" ), "----    !" )
   Check( 'TabExpand( "-" + Chr( 9 ) + "!", "+" )       ', TabExpand( "-" + Chr( 9 ) + "!", "+" ), "-+++++++!" )
   Check( 'TabExpand( "-" + Chr( 9 ) + "!", 4 )         ', TabExpand( "-" + Chr( 9 ) + "!", 4 ), "-   !" )
   Check( 'TabExpand( "----" + Chr( 9 ) + "!", 8, "+" ) ', TabExpand( "----" + Chr( 9 ) + "!", 8, "+" ), "----++++!" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
