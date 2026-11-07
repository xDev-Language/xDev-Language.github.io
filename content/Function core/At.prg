/*
 * $DOC$
 * $NAME$
 * At()
 *
 * $ONELINER$
 * Return the position of a substring within a character string
 *
 * $SYNTAX$
 * At( cSearch, cTarget, [nStart], [nEnd] ) --> nPosition
 *
 * $ARGUMENTS$
 * cSearch
 * cTarget
 * nStart
 * nEnd
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

PROCEDURE Main()

   LOCAL cMail := "anna@example.com"

   Check( 'At( "@", cMail )                    ', At( "@", cMail ), 5 )
   Check( 'Left( cMail, At( "@", cMail ) - 1 ) ', Left( cMail, At( "@", cMail ) - 1 ), "anna" )
   Check( 'At( "a", cMail, 2 )                 ', At( "a", cMail, 2 ), 4 )
   Check( 'At( "e", cMail, 1, 5 )              ', At( "e", cMail, 1, 5 ), 0 )
   Check( 'At( "#", cMail )                    ', At( "#", cMail ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
