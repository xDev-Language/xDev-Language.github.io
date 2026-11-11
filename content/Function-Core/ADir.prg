/*
 * $DOC$
 * $NAME$
 * ADir()
 *
 * $ONELINER$
 * Fill a series of arrays with directory information
 *
 * $SYNTAX$
 * ADir( [cFilespec], [aFilenames], [aSizes], [aDates], [aTimes], [aAttributes] ) --> nFiles
 *
 * $ARGUMENTS$
 * cFilespec
 * aFilenames
 * aSizes
 * aDates
 * aTimes
 * aAttributes
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
 * ADir( "adir_*.txt" )            OK
 * AScan( aNames, "adir_two.txt" ) OK
 * size of adir_two.txt            OK
 * ADir( "no_such_*.txt" )         OK
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

   LOCAL nCount, aNames, aSizes

   MemoWrit( "adir_one.txt", "abc", .F. )
   MemoWrit( "adir_two.txt", "abcdef", .F. )

   nCount := ADir( "adir_*.txt" )
   aNames := Array( nCount )
   aSizes := Array( nCount )
   ADir( "adir_*.txt", aNames, aSizes )

   Check( 'ADir( "adir_*.txt" )            ', nCount, 2 )
   Check( 'AScan( aNames, "adir_two.txt" ) ', AScan( aNames, "adir_two.txt" ) > 0, .T. )
   Check( 'size of adir_two.txt            ', aSizes[ AScan( aNames, "adir_two.txt" ) ], 6 )
   Check( 'ADir( "no_such_*.txt" )         ', ADir( "no_such_*.txt" ), 0 )

   FErase( "adir_one.txt" )
   FErase( "adir_two.txt" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
