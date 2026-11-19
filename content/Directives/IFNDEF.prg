/*
 * $DOC$
 * $NAME$
 * #ifndef
 *
 * $ONELINER$
 * Select source lines when a name has no definition
 *
 * $SYNTAX$
 * #ifndef name
 *    source lines
 * #endif
 *
 * $DESCRIPTION$
 * Use this directive for a configurable default or a header guard. A header guard defines its name on the first inclusion so later inclusions skip its contents.
 *
 * The default parcel limit is 20 kg. Supplying -DPARCEL_LIMIT=25 changes which parcels need special handling.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#ifndef PARCEL_LIMIT
   #define PARCEL_LIMIT 20
#endif

PROCEDURE Main()

   LOCAL nWeight

   FOR EACH nWeight IN { 18, 20, 24 }
      IF nWeight > PARCEL_LIMIT
         QOut( "Special handling", nWeight )
      ELSE
         QOut( "Standard parcel", nWeight )
      ENDIF
   NEXT

   RETURN
