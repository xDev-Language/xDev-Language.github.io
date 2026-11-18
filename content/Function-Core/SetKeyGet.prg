/*
 * $DOC$
 * $NAME$
 * SetKeyGet()
 *
 * $ONELINER$
 * Return the action and the condition of a key
 *
 * $SYNTAX$
 * SetKeyGet( nKey, [@bCondition] ) --> bAction
 *
 * $ARGUMENTS$
 * `nKey` A key code.
 *
 * `@bCondition` A variable passed by reference. It gets the condition of the key, or NIL.
 *
 * $RETURNS$
 * The action of the key, or NIL when the key has none.
 *
 * $DESCRIPTION$
 * SetKey( nKey ) returns only the action. SetKeyGet() also gives the condition, so both can be
 * saved and set again with SetKey( nKey, bAction, bCondition ).
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetKeyGet() gives the action     OK
 * the condition by reference       OK
 * a key without action gives NIL   OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetKey(), SetKeyCheck(), SetKeySave()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL bCondition, bAction

   SetKey( K_F6, {|| "print" }, {|| .T. } )
   bAction := SetKeyGet( K_F6, @bCondition )

   Check( 'SetKeyGet() gives the action     ', Eval( bAction ), "print" )
   Check( 'the condition by reference       ', Eval( bCondition ), .T. )
   Check( 'a key without action gives NIL   ', SetKeyGet( K_F10 ), NIL )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
