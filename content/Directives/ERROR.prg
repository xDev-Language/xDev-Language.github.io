/*
 * $DOC$
 * $NAME$
 * #error
 *
 * $ONELINER$
 * Stop preprocessing with a diagnostic
 *
 * $SYNTAX$
 * #error message
 *
 * $DESCRIPTION$
 * An active #error rejects the source and reports the supplied text. An #error in an inactive branch is skipped.
 *
 * The default configuration is valid. Setting -DRESERVE_SLOTS=9 rejects a reserve larger than the eight available slots.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#define TOTAL_SLOTS 8
#ifndef RESERVE_SLOTS
   #define RESERVE_SLOTS 2
#endif

#if RESERVE_SLOTS > TOTAL_SLOTS
   #error Reserved slots exceed total capacity
#elif RESERVE_SLOTS < 0
   #error Reserved slots must be nonnegative
#endif

PROCEDURE Main()
   QOut( "Bookable slots", TOTAL_SLOTS - RESERVE_SLOTS )
   RETURN
