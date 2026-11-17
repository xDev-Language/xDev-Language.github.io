/*
 * $DOC$
 * $NAME$
 * Eof()
 *
 * $ONELINER$
 * Determine whether the record pointer is at end of file
 *
 * $SYNTAX$
 * Eof() --> lBoundary
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * `.T.` at the end-of-file boundary or with no open work area.
 *
 * $DESCRIPTION$
 * Eof() reports whether the current work area is positioned after its last
 * visible record.
 *
 * $NOTES$
 * Eof() does not move the record pointer.
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
 * Bof(), DbGoBottom(), DbSkip()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoBottom()
   DbSkip()
   QOut( "EOF: " + IIF( Eof(), "YES", "NO" ) )
   DbCloseArea()

RETURN
