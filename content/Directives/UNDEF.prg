/*
 * $DOC$
 * $NAME$
 * #undef
 *
 * $ONELINER$
 * Remove a definition from subsequent source lines
 *
 * $SYNTAX$
 * #undef name
 *
 * $DESCRIPTION$
 * The change takes effect at this point in the source. Earlier replacements retain their values. Removing an undefined name has no effect.
 *
 * Two packing routines use different carton sizes. Removing the first definition permits a new one without a redefinition warning.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#define UNITS_PER_CARTON 12

STATIC FUNCTION SmallShipment( nCartons )
   RETURN nCartons * UNITS_PER_CARTON

#undef UNITS_PER_CARTON
#define UNITS_PER_CARTON 24

STATIC FUNCTION LargeShipment( nCartons )
   RETURN nCartons * UNITS_PER_CARTON

PROCEDURE Main()
   QOut( "Small shipment", SmallShipment( 3 ) )
   QOut( "Large shipment", LargeShipment( 3 ) )
   RETURN
