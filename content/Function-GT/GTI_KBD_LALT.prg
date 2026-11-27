/*
 * $DOC$
 * $NAME$
 * GTI_KBD_LALT
 *
 * $ONELINER$
 * Left Alt is pressed
 *
 * $SYNTAX$
 * nShifts := GtInfo( GTI_KBDSHIFTS )
 * IF ValType( nShifts ) == "N"
 *    lSet := BitAnd( nShifts, GTI_KBD_LALT ) != 0
 * ENDIF
 *
 * $DESCRIPTION$
 * The mask 0x001000 identifies this bit in the numeric result of GTI_KBDSHIFTS.
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
