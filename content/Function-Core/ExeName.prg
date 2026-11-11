/*
 * $DOC$
 * $NAME$
 * ExeName()
 *
 * $ONELINER$
 * Return the executable file name of the application
 *
 * $SYNTAX$
 * ExeName( ) --> cExeFileName
 *
 * $ARGUMENTS$
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
 * Len( ExeName() ) > 0 OK
 * File( ExeName() )    OK
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

   Check( 'Len( ExeName() ) > 0 ', Len( ExeName() ) > 0, .T. )
   Check( 'File( ExeName() )    ', File( ExeName() ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
