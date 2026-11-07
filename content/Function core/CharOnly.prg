/*
 * $DOC$
 * $NAME$
 * CharOnly()
 *
 * $ONELINER$
 * Remove all characters but the specified ones from a string
 *
 * $SYNTAX$
 * CharOnly( cRemaining, cString ) --> cResult
 *
 * $ARGUMENTS$
 * cRemaining
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

   LOCAL cNip := "NIP: 526-000-12-46"

   Check( 'CharOnly( "0123456789", cNip ) ', CharOnly( "0123456789", cNip ), "5260001246" )
   Check( 'CharOnly( "an", "banana" )     ', CharOnly( "an", "banana" ), "anana" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
