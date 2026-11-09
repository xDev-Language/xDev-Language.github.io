/*
 * $DOC$
 * $NAME$
 * ASize()
 *
 * $ONELINER$
 * Grow or shrink an array
 *
 * $SYNTAX$
 * ASize( aTarget, nLength ) --> aTarget
 *
 * $ARGUMENTS$
 * aTarget
 * nLength
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Len( aList ) after ASize( aList, 5 ) OK
 * aList[ 5 ]                           OK
 * Len( aList ) after ASize( aList, 2 ) OK
 * aList[ 2 ]                           OK
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aList := { "a", "b", "c" }

   ASize( aList, 5 )
   Check( 'Len( aList ) after ASize( aList, 5 ) ', Len( aList ), 5 )
   Check( 'aList[ 5 ]                           ', aList[ 5 ], NIL )

   ASize( aList, 2 )
   Check( 'Len( aList ) after ASize( aList, 2 ) ', Len( aList ), 2 )
   Check( 'aList[ 2 ]                           ', aList[ 2 ], "b" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
