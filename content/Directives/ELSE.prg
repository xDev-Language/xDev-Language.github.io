/*
 * $DOC$
 * $NAME$
 * #else
 *
 * $ONELINER$
 * Select a fallback branch
 *
 * $SYNTAX$
 * #if expression
 *    source lines
 * #else
 *    fallback lines
 * #endif
 *
 * $DESCRIPTION$
 * An open conditional block may contain one #else after its tested branches. It selects its lines when the parent is active and all previous branches were skipped.
 *
 * Both receipt formats show the amount due. Define ITEMIZED to include the components.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nGoods := 145
   LOCAL nDelivery := 12

#ifdef ITEMIZED
   QOut( "Goods", nGoods )
   QOut( "Delivery", nDelivery )
#else
   QOut( "Delivery included" )
#endif
   QOut( "Amount due", nGoods + nDelivery )

   RETURN
