/*
 * $DOC$
 * $NAME$
 * SetKeyArray()
 *
 * $ONELINER$
 * Give one action to several keys
 *
 * $SYNTAX$
 * SetKeyArray( aInkey, bAction, [bCondition] ) --> NIL
 *
 * $ARGUMENTS$
 * `aInkey` The key codes.
 *
 * `bAction` The action of all the keys.
 *
 * `bCondition` A block that tells whether the action is active, see SetKey().
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * SetKeyArray() is the same as one SetKey( nKey, bAction, bCondition ) for each key of the array.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * F7 has the action                OK
 * F8 has the action                OK
 * the action runs for F8           OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetKey(), SetKeyCheck(), SetKeyGet()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL nCalls := 0

   SetKeyArray( { K_F7, K_F8 }, {|| nCalls++ } )

   Check( 'F7 has the action                ', ValType( SetKey( K_F7 ) ), "B" )
   Check( 'F8 has the action                ', ValType( SetKey( K_F8 ) ), "B" )

   SetKeyCheck( K_F8 )
   Check( 'the action runs for F8           ', nCalls, 1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
