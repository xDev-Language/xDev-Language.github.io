/*
 * $DOC$
 * $NAME$
 * BREAK
 *
 * $ONELINER$
 * Transfer control to an enclosing BEGIN SEQUENCE
 *
 * $SYNTAX$
 * BREAK [exp]
 *
 * $ARGUMENTS$
 * The optional expression supplies the value for RECOVER USING.
 *
 * $DESCRIPTION$
 * BREAK leaves the active sequence. If the sequence has RECOVER, execution
 * enters that block. Otherwise it resumes after END SEQUENCE. A BREAK can
 * also reach a sequence in a calling routine.
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
 * BEGIN SEQUENCE, Break(), ErrorBlock()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cLabel
   LOCAL aProblem

   FOR EACH cLabel IN { "AB-17", "AB17", "AB-" }
      BEGIN SEQUENCE
         QOut( "Serial", SerialPart( cLabel ) )
      RECOVER USING aProblem
         QOut( "Rejected", aProblem[ 1 ], aProblem[ 2 ] )
      END SEQUENCE
   NEXT

   RETURN

STATIC FUNCTION SerialPart( cLabel )

   LOCAL nDash := At( "-", cLabel )

   IF nDash == 0
      BREAK { cLabel, "Missing separator" }
   ENDIF
   IF nDash == Len( cLabel )
      BREAK { cLabel, "Missing serial number" }
   ENDIF

   RETURN SubStr( cLabel, nDash + 1 )
