/*
 * $DOC$
 * $NAME$
 * SaveSetKey()
 *
 * $ONELINER$
 * Save all SetKey() assignments
 *
 * $SYNTAX$
 * SaveSetKey( ) --> aSavedKeys
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * An array of all keys with an action: { nKey, bAction, bCondition | NIL } for each key.
 *
 * $DESCRIPTION$
 * Save the keys before code that assigns other actions, for example a help screen with its own
 * F1, and give the array to RestSetKey() afterwards.
 *
 * $NOTES$
 * The array holds code blocks, so it is valid only while the program runs.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SaveSetKey() saves two keys      OK
 * F1 has another action            OK
 * RestSetKey() restores            OK
 * F1 has its first action again    OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * RestSetKey(), SetKey(), SetKeySave()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL aSaved

   SetKey( K_F1, {|| "main help" } )
   SetKey( K_F2, {|| "save" } )
   aSaved := SaveSetKey()

   /* a help screen with its own F1 */
   SetKey( K_F1, {|| "help of help" } )
   SetKey( K_F2, NIL )

   Check( 'SaveSetKey() saves two keys      ', Len( aSaved ), 2 )
   Check( 'F1 has another action            ', Eval( SetKey( K_F1 ) ), "help of help" )
   Check( 'RestSetKey() restores            ', RestSetKey( aSaved ), .T. )
   Check( 'F1 has its first action again    ', Eval( SetKey( K_F1 ) ), "main help" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
