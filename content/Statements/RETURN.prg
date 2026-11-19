/*
 * $DOC$
 * $NAME$
 * RETURN
 *
 * $ONELINER$
 * End execution of the current routine
 *
 * $SYNTAX$
 * RETURN [exp]
 *
 * $ARGUMENTS$
 * A FUNCTION requires an expression. A PROCEDURE uses a bare RETURN and
 * returns NIL. A METHOD may use either form.
 *
 * $DESCRIPTION$
 * RETURN ends the current routine immediately. If an expression is present,
 * the caller receives its value.
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
 * FUNCTION, PROCEDURE, METHOD
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nWeight

   FOR EACH nWeight IN { 0, 1, 5, 6, 25 }
      QOut( "Weight", nWeight, "quote", DeliveryQuote( nWeight ) )
   NEXT

   RETURN

STATIC FUNCTION DeliveryQuote( nWeight )

   IF nWeight <= 0
      RETURN "Invalid weight"
   ENDIF
   IF nWeight > 20
      RETURN "Manual quote"
   ENDIF
   IF nWeight <= 5
      RETURN "Standard rate"
   ENDIF

   RETURN "Heavy parcel rate"
