/*
 * $DOC$
 * $NAME$
 * FOR EACH
 *
 * $ONELINER$
 * Iterate over arrays, hashes or strings
 *
 * $SYNTAX$
 * FOR EACH idVar1 [, idVar2 ...] IN exp1 [, exp2 ...] [DESCEND]
 *    statements...
 * NEXT [idVar1]
 *
 * $ARGUMENTS$
 * Declare each loop variable before the loop. Supply one source expression
 * per variable. DESCEND starts each source at its last position.
 * Use @idVar as a source to write string changes back to that variable.
 *
 * $DESCRIPTION$
 * Arrays yield elements, hashes yield values and strings yield bytes. Multiple
 * sources are processed in parallel up to the length of the shortest source.
 * The loop restores the previous values of the loop variables when it ends
 * through NEXT or EXIT.
 *
 * Inside the loop, idVar:enumIndex is the current one-based position,
 * idVar:enumValue is the current value and idVar:enumBase is the source.
 * idVar:enumKey gives the hash key or NIL for other sources.
 * idVar:enumIsFirst and idVar:enumIsLast refer to the ends of that source,
 * including during DESCEND.
 *
 * Assigning to the loop variable updates the current element of an array or
 * hash. For strings use IN @idVar to retain the changed string.
 * The forms enumIndex( n ), enumValue( x ) and enumBase( x ) change the
 * position, current value and source respectively, and return the old value
 * of the corresponding property.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FOR, DO WHILE, LOOP, EXIT
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aCodes := { "B-17", "A-02", "C-11" }
   LOCAL aBook := { 20, 10, 8 }
   LOCAL aCount := { 20, 7, 9 }
   LOCAL cCode
   LOCAL nBook
   LOCAL nCount

   FOR EACH cCode, nBook, nCount IN aCodes, aBook, aCount
      IF nBook != nCount
         QOut( "Count sheet row", cCode:enumIndex, cCode, "variance", nCount - nBook )
      ENDIF
   NEXT

   RETURN
