/*
 * $DOC$
 * $NAME$
 * Addition (+)
 *
 * $ONELINER$
 * Add two numbers, concatenate two strings, or add a number of days to a date.
 *
 * $SYNTAX$
 * left + right
 *
 * $DESCRIPTION$
 * Add two numbers, concatenate two strings, or add a number of days to a date. The date may occur on either side.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL dOrdered := SToD( "20260227" )
   LOCAL nTransit := 4
   LOCAL cOrder := "PL-" + "1042"

   QOut( cOrder + " due " + DToS( dOrdered + nTransit ) )
   QOut( "Units after delivery", 18 + 12 )

   RETURN
