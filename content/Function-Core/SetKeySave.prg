/*
 * $DOC$
 * $NAME$
 * SetKeySave()
 *
 * $ONELINER$
 * Return all SetKey() assignments and optionally replace them
 *
 * $SYNTAX$
 * SetKeySave( [aNewKeys] ) --> aOldKeys
 *
 * $ARGUMENTS$
 * `aNewKeys` An array from SetKeySave() or SaveSetKey(). It takes the place of all assignments.
 * NIL releases all keys. Without the argument nothing changes.
 *
 * $RETURNS$
 * The assignments before the call: { nKey, bAction, bCondition | NIL } for each key.
 *
 * $DESCRIPTION$
 * SetKeySave() saves and replaces the keys in one call:
 *
 * aOld := SetKeySave( NIL )   // all keys free for a dialog
 * ...
 * SetKeySave( aOld )          // the keys of before
 *
 * $NOTES$
 * An array of another form changes nothing.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetKeySave() returns one key     OK
 * NIL released all keys            OK
 * the array restored the key       OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetKey(), SaveSetKey(), RestSetKey()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL aOld

   SetKey( K_F2, {|| "save" } )
   aOld := SetKeySave( NIL )

   Check( 'SetKeySave() returns one key     ', Len( aOld ), 1 )
   Check( 'NIL released all keys            ', SetKey( K_F2 ), NIL )

   SetKeySave( aOld )
   Check( 'the array restored the key       ', Eval( SetKey( K_F2 ) ), "save" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
