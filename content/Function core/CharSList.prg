/*
 * $DOC$
 * $NAME$
 * CharSList()
 *
 * $ONELINER$
 * Remove duplicate characters from a string and sort the result
 *
 * $SYNTAX$
 * CharSList( cString ) --> cSortedList
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

   Check( 'CharSList( "mississippi" ) ', CharSList( "mississippi" ), "imps" )
   Check( 'CharSList( "2026-11-02" )  ', CharSList( "2026-11-02" ), "-0126" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
