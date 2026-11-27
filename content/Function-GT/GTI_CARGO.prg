/*
 * $DOC$
 * $NAME$
 * GTI_CARGO
 *
 * $ONELINER$
 * Store a value of the program in the terminal
 *
 * $SYNTAX$
 * GtInfo( GTI_CARGO, [xValue] ) --> xPrevious
 *
 * $ARGUMENTS$
 * `GTI_CARGO` The selector, from gtinfo.ch.
 * `xValue` Any value.
 *
 * $RETURNS$
 * The value stored before the call, NIL at the start.
 *
 * $DESCRIPTION$
 * The terminal only keeps the value. The program can use it for its own data about the terminal.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
 *
 * Share an import job counter between routines through terminal cargo and restore the previous value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Import total: 10
 * Import total: 30
 * Import total: 60
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GtInfo()
 *
 * $DOCEND$
 */

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL xSaved := GtInfo( GTI_CARGO, { "Import", 0 } )
   LOCAL nBatch

   FOR nBatch := 1 TO 3
      s_FinishBatch( nBatch * 10 )
   NEXT

   GtInfo( GTI_CARGO, xSaved )

RETURN

STATIC PROCEDURE s_FinishBatch( nRecords )

   LOCAL aJob := GtInfo( GTI_CARGO )

   aJob[ 2 ] += nRecords
   OutStd( aJob[ 1 ] + " total: " + LTrim( Str( aJob[ 2 ] ) ), Eol() )

RETURN
