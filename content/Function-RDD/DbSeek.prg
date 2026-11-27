/*
 * $DOC$
 * $NAME$
 * DbSeek()
 *
 * $ONELINER$
 * Move to the record having a specified key
 *
 * $SYNTAX$
 * DbSeek( expKey, [lSoftSeek], [lLast] ) --> lFound
 *
 * $ARGUMENTS$
 * `expKey` Key value. `lSoftSeek` Allows the next greater key. `lLast` Searches the last equal key.
 *
 * $RETURNS$
 * `.T.` when a matching key is found; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * DbSeek() searches the controlling order of the current work area and moves
 * the record pointer to the selected key.
 *
 * $NOTES$
 * An order must be active. Soft seek behavior follows the current settings.
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
 * DbSetOrder(), Found(), OrdSetFocus()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Found: " + IIF( DbSeek( "Anna" ), "YES", "NO" ) )
   DbCloseArea()

RETURN
