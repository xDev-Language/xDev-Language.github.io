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
 * xMessage
 * aOptions
 * cColorNorm
 * nDelay
 * nNormal
 * nHigh
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
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
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
