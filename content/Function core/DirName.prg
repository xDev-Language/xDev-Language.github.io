/*
 * $DOC$
 * $NAME$
 * DirName()
 *
 * $ONELINER$
 * Return the current directory
 *
 * $SYNTAX$
 * DirName( [cDrive] ) --> cDirectory
 *
 * $ARGUMENTS$
 * cDrive
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
 * Len( DirName() ) > 0         OK
 * DirName() == TrueName( "." ) OK
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

   Check( 'Len( DirName() ) > 0         ', Len( DirName() ) > 0, .T. )
   Check( 'DirName() == TrueName( "." ) ', DirName() == TrueName( "." ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
