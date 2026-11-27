/*
 * $DOC$
 * $NAME$
 * KSetCaps()
 *
 * $ONELINER$
 * Query or change the state of Caps Lock
 *
 * $SYNTAX$
 * KSetCaps( [lNewSwitch] ) --> lOldSwitch
 *
 * $ARGUMENTS$
 * `lNewSwitch` .T. turns Caps Lock on, .F. turns it off. Without the argument the state does not
 * change.
 *
 * $RETURNS$
 * The state of Caps Lock before the call: .T. on, .F. off.
 *
 * $DESCRIPTION$
 * KSetCaps() reads the state of Caps Lock of the system. With `lNewSwitch` it also sets the state.
 *
 * Keep the returned value and pass it back later to restore the state of the user.
 *
 * $NOTES$
 * KSetCaps() needs a GT. A GT that does not report the lock keys gives .F. Only the GT of Windows
 * changes the state.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * KSetCaps() is a logical value    OK
 * KSetCaps( lOld ) gives lOld      OK
 * KSetCaps() is bit 7 of KbdStat() OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * KSetIns(), KSetNum(), KSetScroll(), KbdStat()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lOld := KSetCaps()

   Check( 'KSetCaps() is a logical value    ', ValType( lOld ), "L" )
   Check( 'KSetCaps( lOld ) gives lOld      ', KSetCaps( lOld ), lOld )
   Check( 'KSetCaps() is bit 7 of KbdStat() ', KSetCaps(), IsBit( KbdStat(), 7 ) )

   /* Caps Lock on for typing a code, then the state of the user again */
   lOld := KSetCaps( .T. )
   QOut( "" )
   QOut( "Caps Lock is on for 3 seconds" )
   Inkey( 3 )
   KSetCaps( lOld )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
