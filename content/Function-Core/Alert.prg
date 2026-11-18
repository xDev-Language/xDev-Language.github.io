/*
 * $DOC$
 * $NAME$
 * Alert()
 *
 * $ONELINER$
 * Display a simple modal dialog box
 *
 * $SYNTAX$
 * Alert( xMessage, [aOptions], [cColorNorm], [nDelay] ) --> nChoice
 * Alert( xMessage, aOptions, nNormal, nHigh, [nDelay] ) --> nChoice
 *
 * $ARGUMENTS$
 * `xMessage`: the message. A `;` starts a new line. A line wider than the
 * screen is wrapped at a space. A value that is not a string shows an empty
 * message.
 * `aOptions`: an array with the texts of the buttons. Omitted, NIL or an empty
 * array gives one button `Ok`. An element that is not a string gives an empty
 * button.
 * `cColorNorm`: the color string of the box, for example "W+/B". The chosen
 * button has the foreground and the background swapped, without `+`.
 * Omitted or not a valid color string gives "W+/R" for the box and "W+/B"
 * for the chosen button.
 * `nDelay`: the number of seconds to wait for a key. Omitted, NIL or 0 waits
 * until a button is chosen.
 * `nNormal`: the color attribute of the box as a number from 0 to 255, as
 * ColorToN() returns it.
 * `nHigh`: the color attribute of the chosen button. Omitted gives 0, black
 * on black.
 *
 * $RETURNS$
 * The number of the chosen button, counted from 1. 0 when Esc is pressed or
 * nDelay runs out.
 *
 * $DESCRIPTION$
 * Alert() shows a framed box in the centre of the screen with the message
 * and a row of buttons below it. It waits for a choice, then restores the
 * screen under the box, the cursor position and the cursor shape.
 *
 * Left and Shift+Tab move to the previous button, Right and Tab to the next
 * one; both wrap around. Enter or Space chooses the highlighted button. The
 * first letter of a button, in upper or lower case, chooses that button at
 * once. A mouse click on a button chooses it. When the window is resized,
 * the box is laid out again in the centre of the new size.
 *
 * The type of the third argument selects the syntax. A string or no third
 * argument gives the first syntax, where the fourth argument is nDelay. A
 * number gives the second syntax, where the fourth argument is nHigh and the
 * fifth is nDelay.
 *
 * $NOTES$
 * Alert() needs a screen driver, for example `REQUEST GTWVT`. Without one it
 * raises error 1901. A missing xMessage or an argument of a wrong type raises
 * argument error 1102.
 *
 * The message has at most as many lines as the screen has rows minus 4;
 * further lines are not shown.
 *
 * With GTWVT and `GtInfo( GTI_MSGBOX, .T. )`, Alert() without nDelay shows a
 * Windows message box instead of the text box; the colors are not used then.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * AChoice(), SetColor(), ColorToN()
 *
 * $DOCEND$
 */

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nChoice

   nChoice := Alert( "The file has been saved.;Close the window in 2 seconds.", { "OK" }, "W+/B", 2 )

   Check( 'nChoice after 2 seconds without a key ', nChoice, 0 )

   nChoice := Alert( "Save the changes?", { "Yes", "No" } )

   QOut( "You chose " + IIF( nChoice == 1, "Yes", IIF( nChoice == 2, "No", "nothing" ) ) )

   Inkey( 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
