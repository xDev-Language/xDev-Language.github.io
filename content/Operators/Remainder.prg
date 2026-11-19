/*
 * $DOC$
 * $NAME$
 * Remainder (%)
 *
 * $ONELINER$
 * Return the remainder after division.
 *
 * $SYNTAX$
 * left % right
 *
 * $DESCRIPTION$
 * Return the remainder after division. A nonzero remainder has the sign of the dividend. A zero divisor raises an error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nMinutes

   FOR EACH nMinutes IN { 60, 95, 125 }
      QOut( "Hours", Int( nMinutes / 60 ), "minutes", nMinutes % 60 )
   NEXT

   // Wrap a negative offset into the range 0 through 23.
   QOut( "Two hours before midnight", ( -2 % 24 + 24 ) % 24 )

   RETURN
