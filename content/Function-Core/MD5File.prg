/*
 * $DOC$
 * $NAME$
 * MD5File()
 *
 * $ONELINER$
 * Calculate a message digest for a file using the MD5 algorithm
 *
 * $SYNTAX$
 * MD5File( cFileName ) --> cMD5
 *
 * $ARGUMENTS$
 * cFileName
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
 * lWritten                                 OK
 * MD5File( "md5file.txt" )                 OK
 * MD5File( "md5file.txt" ) == MD5( "abc" ) OK
 * MD5File( "no-such-file.txt" )            OK
 * FErase( "md5file.txt" )                  OK
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

   LOCAL lWritten := MemoWrit( "md5file.txt", "abc", .F. )

   Check( 'lWritten                                 ', lWritten, .T. )
   Check( 'MD5File( "md5file.txt" )                 ', MD5File( "md5file.txt" ), "900150983cd24fb0d6963f7d28e17f72" )
   Check( 'MD5File( "md5file.txt" ) == MD5( "abc" ) ', MD5File( "md5file.txt" ) == MD5( "abc" ), .T. )
   Check( 'MD5File( "no-such-file.txt" )            ', MD5File( "no-such-file.txt" ), "" )
   Check( 'FErase( "md5file.txt" )                  ', FErase( "md5file.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
