/*
 * $DOC$
 * $NAME$
 * GTI_KBD_KEYPAD
 *
 * $ONELINER$
 * Numeric keypad key state
 *
 * $SYNTAX$
 * nShifts := GtInfo( GTI_KBDSHIFTS )
 * IF ValType( nShifts ) == "N"
 *    lSet := BitAnd( nShifts, GTI_KBD_KEYPAD ) != 0
 * ENDIF
 *
 * $DESCRIPTION$
 * The mask 0x000008 identifies this bit in the numeric result of GTI_KBDSHIFTS.
 * The active driver determines which bits it reports.
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GTI_KBDSHIFTS, BitAnd()
 *
 * $DOCEND$
 */
