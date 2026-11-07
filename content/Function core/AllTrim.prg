/*
 * $DOC$
 * $NAME$
 * AllTrim()
 *
 * $ONELINER$
 * Remove leading and trailing spaces from a character string
 *
 * $SYNTAX$
 * AllTrim( cString ) --> cTrimString
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

   LOCAL cName := "   Anna Kowalska   "

   Check( 'AllTrim( cName )                    ', AllTrim( cName ), "Anna Kowalska" )
   Check( '"Hello, " + AllTrim( cName ) + "!"  ', "Hello, " + AllTrim( cName ) + "!", "Hello, Anna Kowalska!" )
   Check( 'AllTrim( "  " )                     ', AllTrim( "  " ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
