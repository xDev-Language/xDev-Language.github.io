/*
 * $DOC$
 * $NAME$
 * PosDel()
 *
 * $ONELINER$
 * Delete character(s) at a specified position in a string
 *
 * $SYNTAX$
 * PosDel( cString, [nPos], [nCount] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nPos
 * nCount
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

   Check( 'PosDel( "Parameter", 3, 2 ) ', PosDel( "Parameter", 3, 2 ), "Pameter" )
   Check( 'PosDel( "Parameter", , 2 )  ', PosDel( "Parameter", , 2 ), "Paramet" )
   Check( 'PosDel( "report.txt", , 4 ) ', PosDel( "report.txt", , 4 ), "report" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
