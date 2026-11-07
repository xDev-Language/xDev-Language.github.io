/*
 * $DOC$
 * $NAME$
 * Alias()
 *
 * $ONELINER$
 * Return a specified work area alias
 *
 * $SYNTAX$
 * Alias( [nWorkArea] ) --> cAlias
 *
 * $ARGUMENTS$
 * nWorkArea
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

   DbCreate( "people.dbf", { { "NAME", "C", 20, 0 }, { "BORN", "D", 8, 0 } } )

   USE people ALIAS staff NEW

   Check( 'Alias()                    ', Alias(), "STAFF" )
   Check( 'Alias( Select() )          ', Alias( Select() ), "STAFF" )

   CLOSE staff

   Check( 'Alias() after CLOSE staff  ', Alias(), "" )

   FErase( "people.dbf" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
