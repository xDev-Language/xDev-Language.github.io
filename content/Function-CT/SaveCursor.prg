/*
 * $DOC$
 * $NAME$
 * SaveCursor()
 *
 * $ONELINER$
 * Save the position and the shape of the cursor
 *
 * $SYNTAX$
 * SaveCursor( ) --> nSaved
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * One number with the row, the column and the shape of the cursor.
 *
 * $DESCRIPTION$
 * Keep the number and pass it to RestCursor() to put the cursor back after an output, for example
 * of a message in another part of the screen.
 *
 * $NOTES$
 * SaveCursor() needs a GT. The number is meant only for RestCursor().
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * RestCursor() gives ""            OK
 * the row is back                  OK
 * the column is back               OK
 * the shape is back                OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * RestCursor(), SetPos(), SetCursor()
 *
 * $DOCEND$
 */

#include "setcurs.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nSaved, cResult, nRow, nCol, nShape

   Scroll()
   SetPos( 5, 10 )
   SetCursor( SC_INSERT )
   nSaved := SaveCursor()

   SetPos( 0, 0 )
   SetCursor( SC_NONE )
   DispOut( "A message at the top" )

   /* read the cursor at once: the output of Check() moves it */
   cResult := RestCursor( nSaved )
   nRow := Row()
   nCol := Col()
   nShape := SetCursor()

   SetPos( 1, 0 )
   Check( 'RestCursor() gives ""            ', cResult, "" )
   Check( 'the row is back                  ', nRow, 5 )
   Check( 'the column is back               ', nCol, 10 )
   Check( 'the shape is back                ', nShape, SC_INSERT )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
