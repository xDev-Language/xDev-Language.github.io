/*
 * $DOC$
 * $NAME$
 * ATail()
 *
 * $ONELINER$
 * Return the highest numbered element of an array
 *
 * $SYNTAX$
 * ATail( aArray ) --> Element
 *
 * $ARGUMENTS$
 * aArray
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

   LOCAL aHistory := { "open", "edit", "save" }

   Check( 'ATail( aHistory )   ', ATail( aHistory ), "save" )
   Check( 'ATail( {} )         ', ATail( {} ), NIL )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
