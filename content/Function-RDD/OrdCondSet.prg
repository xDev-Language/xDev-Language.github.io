/*
 * $DOC$
 * $NAME$
 * OrdCondSet()
 *
 * $ONELINER$
 * Set a condition and scope for the next order build
 *
 * $SYNTAX$
 * OrdCondSet( [cForCondition], [bForCondition], [lAll], [bWhileCondition], [bEval], [nInterval], [nStart], [nNext], [nRecord], [lRest], [lDescend], [lCompound], [lAdditive], [lCurrent], [lCustom], [lNoOptimize], [cWhileCondition], [lTemporary], [lUseFilter], [lExclusive] ) --> lSuccess
 *
 * $ARGUMENTS$
 * Optional condition text, blocks, scope numbers and order-build flags.
 *
 * $RETURNS$
 * `.T.` when the condition is accepted; otherwise `.F.`.
 *
 * $DESCRIPTION$
 * OrdCondSet() clears the previous pending order condition and stores the new
 * FOR, WHILE, evaluation and record-scope settings in the current work area.
 * The optional blocks are evaluated while a later order is built. Numeric
 * arguments limit interval, start, next and record ranges; logical arguments
 * control descending, additive, temporary, filter and exclusive behavior.
 * The current record is used when the corresponding option requests it.
 *
 * $NOTES$
 * It does not create an order by itself. The current work area must be open;
 * invalid argument types, incompatible text and blocks, negative ranges or a
 * build already in progress raise an error. Use OrdCreate() or DbCreateIndex()
 * afterward; their direct arguments are simpler when no pending condition is needed.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * OrdCreate(), OrdListRebuild(), DbCreateIndex()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "Condition accepted: " + IIF( OrdCondSet( "AGE >= 18", {|| FIELD->AGE >= 18 } ), "YES", "NO" ) )
   DbCloseArea()

RETURN
