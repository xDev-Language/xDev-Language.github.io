/*
 * $DOC$
 * $NAME$
 * DbContinue()
 *
 * $ONELINER$
 * Resume a pending LOCATE operation
 *
 * $SYNTAX$
 * DbContinue() --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * DbContinue() resumes the last LOCATE operation in the current work area and
 * searches for the next matching record. FOUND() reports whether a match was found.
 *
 * $NOTES$
 * Call DbContinue() only after a LOCATE has established a pending search.
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
 * DbLocate(), Found(), DbGoTop()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbCreate( "continue_demo.dbf", { { "NAME", "C", 12, 0 } } )
   DbUseArea( .T., , "continue_demo.dbf", "People" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbAppend()
   FieldPut( 1, "Anna" )
   DbCommit()
   DbGoTop()
   DbLocate( {|| FIELD->NAME == "Anna" } )
   QOut( "First found: " + RTrim( FieldGet( 1 ) ) )
   DbContinue()
   QOut( "Second found: " + RTrim( FieldGet( 1 ) ) )
   DbCloseArea()
   FErase( "continue_demo.dbf" )


   RETURN
