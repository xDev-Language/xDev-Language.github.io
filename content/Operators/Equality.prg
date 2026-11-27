/*
 * $DOC$
 * $NAME$
 * Equality (=)
 *
 * $ONELINER$
 * Compare two values for equality.
 *
 * $SYNTAX$
 * left = right
 *
 * $DESCRIPTION$
 * Compare two values for equality. With EXACT off, a string that begins with the entire right operand compares equal to it. With EXACT on, excess trailing spaces are ignored.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#include "set.ch"

PROCEDURE Main()

   LOCAL lPrevious := Set( _SET_EXACT, .F. )
   LOCAL cCode := "INV-103"

   QOut( "Prefix on the right", cCode = "INV" )
   QOut( "Prefix on the left", "INV" = cCode )
   Set( _SET_EXACT, .T. )
   QOut( "Prefix under EXACT", cCode = "INV" )
   QOut( "Padded field under EXACT", cCode = "INV-103 " )
   Set( _SET_EXACT, lPrevious )

   RETURN
