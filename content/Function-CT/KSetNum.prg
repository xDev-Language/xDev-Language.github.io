/*
 * $DOC$
 * $NAME$
 * KSetNum()
 *
 * $ONELINER$
 * Query or change the state of Num Lock
 *
 * $SYNTAX$
 * KSetNum( [lNewSwitch] ) --> lOldSwitch
 *
 * $ARGUMENTS$
 * `lNewSwitch` .T. turns Num Lock on, .F. turns it off. Without the argument the state does not
 * change.
 *
 * $RETURNS$
 * The state of Num Lock before the call: .T. on, .F. off.
 *
 * $DESCRIPTION$
 * KSetNum() reads the state of Num Lock of the system. With `lNewSwitch` it also sets the state,
 * for example on, so that the numeric keypad types digits.
 *
 * Keep the returned value and pass it back later to restore the state of the user.
 *
 * $NOTES$
 * KSetNum() needs a GT. A GT that does not report the lock keys gives .F. Only the GT of Windows
 * changes the state.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * KSetNum() is a logical value     OK
 * KSetNum( lOld ) gives lOld       OK
 * KSetNum() is bit 6 of KbdStat()  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * KSetCaps(), KSetIns(), KSetScroll(), KbdStat()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lOld := KSetNum()

   Check( 'KSetNum() is a logical value     ', ValType( lOld ), "L" )
   Check( 'KSetNum( lOld ) gives lOld       ', KSetNum( lOld ), lOld )
   Check( 'KSetNum() is bit 6 of KbdStat()  ', KSetNum(), IsBit( KbdStat(), 6 ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
