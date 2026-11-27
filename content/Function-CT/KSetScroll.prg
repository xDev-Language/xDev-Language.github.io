/*
 * $DOC$
 * $NAME$
 * KSetScroll()
 *
 * $ONELINER$
 * Query or change the state of Scroll Lock
 *
 * $SYNTAX$
 * KSetScroll( [lNewSwitch] ) --> lOldSwitch
 *
 * $ARGUMENTS$
 * `lNewSwitch` .T. turns Scroll Lock on, .F. turns it off. Without the argument the state does not
 * change.
 *
 * $RETURNS$
 * The state of Scroll Lock before the call: .T. on, .F. off.
 *
 * $DESCRIPTION$
 * KSetScroll() reads the state of Scroll Lock of the system. With `lNewSwitch` it also sets the
 * state.
 *
 * Keep the returned value and pass it back later to restore the state of the user.
 *
 * $NOTES$
 * KSetScroll() needs a GT. A GT that does not report the lock keys gives .F. Only the GT of Windows
 * changes the state.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * KSetScroll() is a logical value  OK
 * KSetScroll( lOld ) gives lOld    OK
 * KSetScroll() is bit 5 of KbdStat() OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * KSetCaps(), KSetIns(), KSetNum(), KbdStat()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lOld := KSetScroll()

   Check( 'KSetScroll() is a logical value  ', ValType( lOld ), "L" )
   Check( 'KSetScroll( lOld ) gives lOld    ', KSetScroll( lOld ), lOld )
   Check( 'KSetScroll() is bit 5 of KbdStat() ', KSetScroll(), IsBit( KbdStat(), 5 ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
