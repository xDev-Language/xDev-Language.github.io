/*
 * $DOC$
 * $NAME$
 * TString()
 *
 * $ONELINER$
 * Convert numeric seconds into a time formatted character string
 *
 * $SYNTAX$
 * TString( nSeconds ) --> cTimeString
 *
 * $ARGUMENTS$
 * nSeconds
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
 * TString( 3661 )  OK
 * TString( 90061 ) OK
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

   Check( 'TString( 3661 )  ', TString( 3661 ), "01:01:01" )
   Check( 'TString( 90061 ) ', TString( 90061 ), "01:01:01" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
