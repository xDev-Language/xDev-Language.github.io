/*
 * $DOC$
 * $NAME$
 * ClearEol()
 *
 * $ONELINER$
 * Clear a row on the screen from a specified position
 *
 * $SYNTAX$
 * ClearEol( [nRow], [nCol], [xColor], [xChar] ) --> cNull
 *
 * $ARGUMENTS$
 * nRow
 * nCol
 * xColor
 * xChar
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

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   ClearEol( 3, 40, "GR+/R", "-" )

   Check( 'ScreenAttr( 3, MaxCol() ) ', ScreenAttr( 3, MaxCol() ), ColorToN( "GR+/R" ) )
   Check( 'ScreenAttr( 3, 39 )       ', ScreenAttr( 3, 39 ) == ColorToN( "GR+/R" ), .F. )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
