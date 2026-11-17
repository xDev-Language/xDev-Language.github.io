/*
 * $DOC$
 * $NAME$
 * DbSkipper()
 *
 * $ONELINER$
 * Move relative to the current record and return the distance moved
 *
 * $SYNTAX$
 * DbSkipper( [nRecords] ) --> nSkipped
 *
 * $ARGUMENTS$
 * `nRecords` Requested movement. Positive values move forward, negative values backward.
 *
 * $RETURNS$
 * The number of records actually skipped.
 *
 * $DESCRIPTION$
 * DbSkipper() moves through visible records like DbSkip() and reports the
 * number of records actually crossed before reaching a boundary.
 *
 * $NOTES$
 * At EOF or BOF the returned value can be smaller than requested.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DbSkip(), DbGoTop(), DbGoBottom()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   DbGoTop()
   QOut( "Skipped: " + LTrim( Str( DbSkipper( 1 ) ) ) )
   DbCloseArea()

RETURN
