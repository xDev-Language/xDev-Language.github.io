/*
 * $DOC$
 * $NAME$
 * RestCursor()
 *
 * $ONELINER$
 * Restore the position and the shape of the cursor
 *
 * $SYNTAX$
 * RestCursor( nSaved ) --> cNull
 *
 * $ARGUMENTS$
 * `nSaved` A number returned by SaveCursor().
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * RestCursor() sets the row, the column and the shape of the cursor saved by SaveCursor().
 *
 * $NOTES$
 * RestCursor() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * the cursor is back at 12, 30     OK
 * the cursor is visible again      OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SaveCursor(), SetPos(), SetCursor()
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

   LOCAL nSaved

   Scroll()
   SetPos( 12, 30 )
   SetCursor( SC_NORMAL )
   nSaved := SaveCursor()

   /* an output somewhere else, with the cursor hidden */
   SetCursor( SC_NONE )
   DispOutAt( 20, 0, "Saving..." )

   RestCursor( nSaved )

   SetPos( 0, 0 )
   Check( 'the cursor is back at 12, 30     ', s_Saved( nSaved ), "12,30" )
   Check( 'the cursor is visible again      ', SetCursor(), SC_NORMAL )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

/* The position that RestCursor() sets, read back with Row() and Col() */
STATIC FUNCTION s_Saved( nSaved )

   LOCAL cPosition

   RestCursor( nSaved )
   cPosition := LTrim( Str( Row() ) ) + "," + LTrim( Str( Col() ) )
   SetPos( 0, 0 )

RETURN cPosition

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
