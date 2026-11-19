/*
 * $DOC$
 * $NAME$
 * EXIT
 *
 * $ONELINER$
 * Leave the innermost loop or SWITCH
 *
 * $SYNTAX$
 * EXIT
 *
 * $ARGUMENTS$
 *
 * $DESCRIPTION$
 * Execution resumes after the closing keyword of the innermost DO WHILE,
 * FOR, FOR EACH or SWITCH that contains EXIT. Use EXIT in a CASE to stop
 * before the next branch.
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
 * LOOP, FOR, FOR EACH, DO WHILE, SWITCH, EXIT PROCEDURE
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aBins := { 2, 7, 4 }
   LOCAL nOrder
   LOCAL nBin
   LOCAL lPacked

   FOR EACH nOrder IN { 5, 6, 3 }
      lPacked := .F.
      FOR nBin := 1 TO Len( aBins )
         IF aBins[ nBin ] >= nOrder
            aBins[ nBin ] -= nOrder
            QOut( "Packed", nOrder, "in bin", nBin )
            lPacked := .T.
            EXIT
         ENDIF
      NEXT
      IF !lPacked
         QOut( "Back order", nOrder )
      ENDIF
   NEXT

   RETURN
