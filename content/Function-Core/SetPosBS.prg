/*
 * $DOC$
 * $NAME$
 * SetPosBS()
 *
 * $ONELINER$
 * Move the cursor one column to the right
 *
 * $SYNTAX$
 * SetPosBS( ) --> NIL
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * SetPosBS() moves the cursor one column to the right in the same row. It does not check the
 * border of the screen.
 *
 * $NOTES$
 * SetPosBS() needs a GT.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * the row stays                    OK
 * the column moved by one          OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetPos(), Row(), Col()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nRow, nCol

   Scroll()
   SetPos( 5, 10 )
   SetPosBS()

   /* read the cursor at once: the output of Check() moves it */
   nRow := Row()
   nCol := Col()

   SetPos( 0, 0 )
   Check( 'the row stays                    ', nRow, 5 )
   Check( 'the column moved by one          ', nCol, 11 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
