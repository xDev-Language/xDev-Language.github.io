/*
 * $DOC$
 * $NAME$
 * SetKeyCheck()
 *
 * $ONELINER$
 * Run the action of a key
 *
 * $SYNTAX$
 * SetKeyCheck( nKey, [xParam1], [xParam2], [xParam3] ) --> lDone
 *
 * $ARGUMENTS$
 * `nKey` A key code, for example from Inkey().
 *
 * `xParam1`, `xParam2`, `xParam3` Values passed to the action.
 *
 * $RETURNS$
 * .T. when the key has an active action and it ran, otherwise .F.
 *
 * $DESCRIPTION$
 * SetKeyCheck() evaluates the action of SetKey() with the parameters and the key code as the last
 * argument. A key with a condition runs only when the condition, evaluated with the key code,
 * gives .T.
 *
 * Use it in a loop of the program: a key with an action runs it, other keys go on as usual.
 *
 * $NOTES$
 * A key that has no action of its own also finds the action of its standard code.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetKeyCheck() runs the action    OK
 * the action got the arguments     OK
 * a false condition gives .F.      OK
 * a key without action gives .F.   OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetKey(), SetKeyArray(), SetKeyGet()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL cLast := ""
   LOCAL lActive := .T.

   SetKey( K_F5, {| cWhere, nKey | cLast := cWhere + Str( nKey, 3 ) }, {|| lActive } )

   Check( 'SetKeyCheck() runs the action    ', SetKeyCheck( K_F5, "list" ), .T. )
   Check( 'the action got the arguments     ', cLast, "list" + Str( K_F5, 3 ) )

   lActive := .F.
   Check( 'a false condition gives .F.      ', SetKeyCheck( K_F5, "edit" ), .F. )
   Check( 'a key without action gives .F.   ', SetKeyCheck( K_F9 ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
