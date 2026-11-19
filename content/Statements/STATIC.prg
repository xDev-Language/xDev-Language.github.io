/*
 * $DOC$
 * $NAME$
 * STATIC
 *
 * $ONELINER$
 * Declare storage that persists between routine calls
 *
 * $SYNTAX$
 * STATIC idVar [AS type] [:= constant] [, ...]
 * STATIC idArray[ nSize [, nSize2 ...] ] [, ...]
 *
 * $ARGUMENTS$
 * An initializer and any array dimensions must be compile-time constant
 * expressions. An untyped variable has type ANY.
 *
 * $DESCRIPTION$
 * At module level, a static variable is visible to routines in that file.
 * Inside a routine, it is visible only there and must be declared before
 * executable statements. Its value persists across calls.
 *
 * STATIC before FUNCTION or PROCEDURE gives the routine file-local
 * visibility.
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
 * LOCAL, FUNCTION, PROCEDURE, FIELD
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nReading

   FOR EACH nReading IN { 10, 14, 11, 11 }
      QOut( "Reading", nReading, "change", ReadingChange( nReading ) )
   NEXT

   RETURN

STATIC FUNCTION ReadingChange( nCurrent )

   STATIC nPrevious := NIL
   LOCAL nDelta := NIL

   IF nPrevious != NIL
      nDelta := nCurrent - nPrevious
   ENDIF
   nPrevious := nCurrent

   RETURN nDelta
