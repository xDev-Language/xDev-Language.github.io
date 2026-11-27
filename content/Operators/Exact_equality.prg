/*
 * $DOC$
 * $NAME$
 * Exact equality (==)
 *
 * $ONELINER$
 * Compare for exact equality.
 *
 * $SYNTAX$
 * left == right
 *
 * $DESCRIPTION$
 * Compare for exact equality. Two strings must contain the same bytes in the same order, including trailing spaces.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cExpected := "A-17"
   LOCAL cScan

   FOR EACH cScan IN { "A-17", "a-17", "A-17 ", "A-170" }
      IF cScan == cExpected
         QOut( "Match", cScan )
      ELSE
         QOut( "Review scan [" + cScan + "]" )
      ENDIF
   NEXT

   RETURN
