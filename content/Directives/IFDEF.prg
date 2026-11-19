/*
 * $DOC$
 * $NAME$
 * #ifdef
 *
 * $ONELINER$
 * Select source lines when a name is defined
 *
 * $SYNTAX$
 * #ifdef name
 *    source lines
 * #endif
 *
 * $DESCRIPTION$
 * The test checks the presence of a name. A definition with an empty replacement or the value zero still selects the branch.
 *
 * With -DTRACE_PACKING the program also reports remaining capacity after each reservation.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nFree := 20
   LOCAL nOrder

   FOR EACH nOrder IN { 4, 7, 6 }
      nFree -= nOrder
#ifdef TRACE_PACKING
      QOut( "Reserved", nOrder, "places left", nFree )
#endif
   NEXT
   QOut( "Total reserved", 20 - nFree )

   RETURN
