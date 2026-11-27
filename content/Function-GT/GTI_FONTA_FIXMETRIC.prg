/*
 * $DOC$
 * $NAME$
 * GTI_FONTA_FIXMETRIC
 *
 * $ONELINER$
 * Fixed-width character metrics
 *
 * $SYNTAX$
 * nAttributes := GtInfo( GTI_FONTATTRIBUTE )
 * IF ValType( nAttributes ) == "N"
 *    lSet := BitAnd( nAttributes, GTI_FONTA_FIXMETRIC ) != 0
 * ENDIF
 *
 * $DESCRIPTION$
 * The mask 0x0001 identifies this bit in the numeric result of GTI_FONTATTRIBUTE.
 * The active driver determines which bits it reports.
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GTI_FONTATTRIBUTE, BitAnd()
 *
 * $DOCEND$
 */
