/*
 * $DOC$
 * $NAME$
 * TrueName()
 *
 * $ONELINER$
 * Complete a relative path to include the root directory
 *
 * $SYNTAX$
 * TrueName( cPath ) --> cRoot
 *
 * $ARGUMENTS$
 * cPath
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
 * TrueName( "." ) == DirName()                            OK
 * Right( TrueName( "xdev.txt" ), 8 )                      OK
 * TrueName( "sub/../xdev.txt" ) == TrueName( "xdev.txt" ) OK
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

   Check( 'TrueName( "." ) == DirName()                            ', TrueName( "." ) == DirName(), .T. )
   Check( 'Right( TrueName( "xdev.txt" ), 8 )                      ', Right( TrueName( "xdev.txt" ), 8 ), "xdev.txt" )
   Check( 'TrueName( "sub/../xdev.txt" ) == TrueName( "xdev.txt" ) ', TrueName( "sub/../xdev.txt" ) == TrueName( "xdev.txt" ), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
