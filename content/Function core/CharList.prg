/*
 * $DOC$
 * $NAME$
 * CharList()
 *
 * $ONELINER$
 * Remove duplicate characters from a string
 *
 * $SYNTAX$
 * CharList( cString ) --> cResult
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

   Check( 'CharList( "mississippi" ) ', CharList( "mississippi" ), "misp" )
   Check( 'CharList( "" )            ', CharList( "" ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
