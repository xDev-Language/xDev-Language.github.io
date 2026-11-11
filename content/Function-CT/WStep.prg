/*
 * $DOC$
 * $NAME$
 * WStep()
 *
 * $ONELINER$
 * Set the step of interactive window moving
 *
 * $SYNTAX$
 * WStep( nRows, nColumns ) --> nError
 *
 * $ARGUMENTS$
 * `nRows` Rows of one vertical step, at most 6.
 * `nColumns` Columns of one horizontal step, at most 20.
 * A larger value is set to the maximum.
 *
 * $RETURNS$
 * 0 when the step is set, -1 when a window is open or a value is smaller than 1.
 *
 * $DESCRIPTION$
 * The step is used when the user moves a window with the cursor keys, see WSetMove(). The
 * default step is 2 rows and 5 columns.
 *
 * $NOTES$
 * WStep() works only while no window is open. xDev keeps the setting, but the interactive
 * moving is not available yet.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * WSetMove(), WMove()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nWithWindow

   Scroll()
   SetPos( 0, 0 )

   WOpen( 12, 10, 16, 40, .T. )
   nWithWindow := WStep( 2, 5 )
   WClose()

   Check( 'WStep( 1, 3 )                  ', WStep( 1, 3 ), 0 )
   Check( 'WStep( 10, 30 ), set to 6, 20  ', WStep( 10, 30 ), 0 )
   Check( 'WStep( 0, 3 )                  ', WStep( 0, 3 ), -1 )
   Check( 'WStep() with an open window    ', nWithWindow, -1 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
