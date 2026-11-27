/*
 * $DOC$
 * $NAME$
 * KbdStat()
 *
 * $ONELINER$
 * Return the state of the Shift, Ctrl and Alt keys and of the lock keys
 *
 * $SYNTAX$
 * KbdStat( ) --> nKeyStatus
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * A number from 0 to 255. Each bit tells the state of one key:
 *
 * | Bit | Value | Key |
 * |---|---|---|
 * | 1 | 1 | Right Shift pressed |
 * | 2 | 2 | Left Shift pressed |
 * | 3 | 4 | Ctrl pressed, left or right |
 * | 4 | 8 | Alt pressed |
 * | 5 | 16 | Scroll Lock on |
 * | 6 | 32 | Num Lock on |
 * | 7 | 64 | Caps Lock on |
 * | 8 | 128 | Insert on |
 *
 * $DESCRIPTION$
 * KbdStat() reads the keys at the moment of the call. Use it, for example, to show another menu
 * while Alt is held down.
 *
 * IsBit() tests one bit with the numbers of the table, for example IsBit( KbdStat(), 4 ) for Alt.
 *
 * $NOTES$
 * KbdStat() needs a GT. The GT reports the keys; a GT that does not report them gives 0. The state
 * of Insert is reported only on Windows.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * KbdStat() is a number            OK
 * KbdStat() is from 0 to 255       OK
 * bit 7 is the state of KSetCaps() OK
 * bit 6 is the state of KSetNum()  OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * KSetCaps(), KSetIns(), KSetNum(), KSetScroll(), IsBit()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nStatus := KbdStat()

   Check( 'KbdStat() is a number            ', ValType( nStatus ), "N" )
   Check( 'KbdStat() is from 0 to 255       ', nStatus >= 0 .AND. nStatus <= 255, .T. )
   Check( 'bit 7 is the state of KSetCaps() ', IsBit( nStatus, 7 ), KSetCaps() )
   Check( 'bit 6 is the state of KSetNum()  ', IsBit( nStatus, 6 ), KSetNum() )

   QOut( "" )
   QOut( "Hold Alt and press any key, or wait 10 seconds" )
   Inkey( 10 )
   QOut( IIF( IsBit( KbdStat(), 4 ), "Alt was held down", "Alt was not held down" ) )
   Inkey( 3 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
