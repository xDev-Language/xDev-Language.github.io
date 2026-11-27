/*
 * $DOC$
 * $NAME$
 * DbGoTop()
 *
 * $ONELINER$
 * Move to the first logical record
 *
 * $SYNTAX$
 * DbGoTop() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbGoTop() positions the record pointer on the first visible record in the
 * current work area, respecting active filters, scopes and deleted-record settings.
 *
 * $NOTES$
 * An empty area becomes EOF.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DbGoBottom(), DbSkip(), Bof(), Eof()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoTop()
   QOut( "At top: " + LTrim( Str( RecNo() ) ) )
   DbCloseArea()

   RETURN
