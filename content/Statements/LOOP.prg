/*
 * $DOC$
 * $NAME$
 * LOOP
 *
 * $ONELINER$
 * Skip the rest of the current loop iteration
 *
 * $SYNTAX$
 * LOOP
 *
 * $ARGUMENTS$
 *
 * $DESCRIPTION$
 * LOOP continues the innermost DO WHILE, FOR or FOR EACH. DO WHILE tests
 * its condition again. FOR applies the counter step before checking the
 * limit. FOR EACH advances to the next element. A nested SWITCH does not
 * change which loop LOOP continues.
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
 * EXIT, FOR, FOR EACH, DO WHILE
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aReading
   LOCAL nSum := 0
   LOCAL nCount := 0

   FOR EACH aReading IN { { "A", 12 }, { "B", NIL }, { "C", -4 }, { "D", 18 } }
      IF aReading[ 2 ] == NIL
         QOut( aReading[ 1 ], "missing" )
         LOOP
      ENDIF
      IF aReading[ 2 ] < 0
         QOut( aReading[ 1 ], "outside range" )
         LOOP
      ENDIF
      nSum += aReading[ 2 ]
      nCount++
   NEXT
   IF nCount > 0
      QOut( "Mean of valid readings", nSum / nCount )
   ENDIF

   RETURN
