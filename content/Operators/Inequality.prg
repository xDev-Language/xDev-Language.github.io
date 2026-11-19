/*
 * $DOC$
 * $NAME$
 * Inequality (!= <> #)
 *
 * $ONELINER$
 * Return the logical inverse of ordinary equality.
 *
 * $SYNTAX$
 * left != right
 * left <> right
 * left # right
 *
 * $DESCRIPTION$
 * Return the logical inverse of ordinary equality. All three spellings have the same meaning. With EXACT off, a string that begins with the entire right operand compares equal to it. With EXACT on, excess trailing spaces are ignored.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aBooked := { 10, 12, 8 }
   LOCAL aCounted := { 10, 11, 9 }
   LOCAL nBin

   FOR nBin := 1 TO Len( aBooked )
      IF aCounted[ nBin ] <> aBooked[ nBin ]
         QOut( "Bin", nBin, "stock variance", aCounted[ nBin ] - aBooked[ nBin ] )
      ENDIF
   NEXT

   RETURN
