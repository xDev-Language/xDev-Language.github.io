/*
 * $DOC$
 * $NAME$
 * CharRem()
 *
 * $ONELINER$
 * Delete specified characters from a string
 *
 * $SYNTAX$
 * CharRem( cDelete, cString ) --> cResult
 *
 * $ARGUMENTS$
 * cDelete
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

   LOCAL cPhone := "+48 600-100-200"

   Check( 'CharRem( " -", cPhone )       ', CharRem( " -", cPhone ), "+48600100200" )
   Check( 'CharRem( "aeiou", "banana" )  ', CharRem( "aeiou", "banana" ), "bnn" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
