/*
 * $DOC$
 * $NAME$
 * DbGoBottom()
 *
 * $ONELINER$
 * Move to the last logical record
 *
 * $SYNTAX$
 * DbGoBottom() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbGoBottom() positions the record pointer on the last visible record in the
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
 * DbGoTop(), DbSkip(), Eof(), Bof()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoBottom()
   QOut( "At bottom: " + LTrim( Str( RecNo() ) ) )
   DbCloseArea()

   RETURN
