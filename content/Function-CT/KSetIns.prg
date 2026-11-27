/*
 * $DOC$
 * $NAME$
 * KSetIns()
 *
 * $ONELINER$
 * Query or change the state of Insert
 *
 * $SYNTAX$
 * KSetIns( [lNewSwitch] ) --> lOldSwitch
 *
 * $ARGUMENTS$
 * `lNewSwitch` .T. turns Insert on, .F. turns it off. Without the argument the state does not
 * change.
 *
 * $RETURNS$
 * The state of Insert before the call: .T. on, .F. off.
 *
 * $DESCRIPTION$
 * KSetIns() reads the state of the Insert key of the system. With `lNewSwitch` it also sets the
 * state.
 *
 * Keep the returned value and pass it back later to restore the state of the user.
 *
 * $NOTES$
 * KSetIns() needs a GT. Only the GT of Windows reports and changes the state of Insert; other GTs
 * give .F.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * KSetIns() is a logical value     OK
 * KSetIns( lOld ) gives lOld       OK
 * KSetIns() is bit 8 of KbdStat()  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * KSetCaps(), KSetNum(), KSetScroll(), KbdStat()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lOld := KSetIns()

   Check( 'KSetIns() is a logical value     ', ValType( lOld ), "L" )
   Check( 'KSetIns( lOld ) gives lOld       ', KSetIns( lOld ), lOld )
   Check( 'KSetIns() is bit 8 of KbdStat()  ', KSetIns(), IsBit( KbdStat(), 8 ) )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
