/*
 * $DOC$
 * $NAME$
 * RestSetKey()
 *
 * $ONELINER$
 * Restore the SetKey() assignments saved by SaveSetKey()
 *
 * $SYNTAX$
 * RestSetKey( aSavedKeys ) --> lRestored
 *
 * $ARGUMENTS$
 * `aSavedKeys` An array returned by SaveSetKey().
 *
 * $RETURNS$
 * .T. when the keys were restored. .F. when the array has another form; then nothing changes.
 *
 * $DESCRIPTION$
 * RestSetKey() releases all keys and gives back the actions and conditions of the array. A key
 * that got an action after SaveSetKey() has none afterwards.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * RestSetKey() gives .T.           OK
 * F3 has its saved action          OK
 * F4 has no action again           OK
 * a wrong array gives .F.          OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SaveSetKey(), SetKey(), SetKeySave()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL aSaved, lRestored

   SetKey( K_F3, {|| "find" } )
   aSaved := SaveSetKey()

   SetKey( K_F3, {|| "replace" } )
   SetKey( K_F4, {|| "new" } )
   lRestored := RestSetKey( aSaved )

   Check( 'RestSetKey() gives .T.           ', lRestored, .T. )
   Check( 'F3 has its saved action          ', Eval( SetKey( K_F3 ) ), "find" )
   Check( 'F4 has no action again           ', SetKey( K_F4 ), NIL )
   Check( 'a wrong array gives .F.          ', RestSetKey( { "F3" } ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
