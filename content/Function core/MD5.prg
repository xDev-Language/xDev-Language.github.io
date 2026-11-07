/*
 * $DOC$
 * $NAME$
 * MD5()
 *
 * $ONELINER$
 * Calculate a message digest for a stream of data using the MD5 algorithm
 *
 * $SYNTAX$
 * MD5( cString ) --> cMD5
 *
 * $ARGUMENTS$
 * cString
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

   Check( 'MD5( "" )                                                               ', MD5( "" ), "d41d8cd98f00b204e9800998ecf8427e" )
   Check( 'MD5( "a" )                                                              ', MD5( "a" ), "0cc175b9c0f1b6a831c399e269772661" )
   Check( 'MD5( "abc" )                                                            ', MD5( "abc" ), "900150983cd24fb0d6963f7d28e17f72" )
   Check( 'MD5( "message digest" )                                                 ', MD5( "message digest" ), "f96b697d7cb7938d525a2f31aaf161d0" )
   Check( 'MD5( "abcdefghijklmnopqrstuvwxyz" )                                     ', MD5( "abcdefghijklmnopqrstuvwxyz" ), "c3fcd3d76192e4007dfb496cca67e13b" )
   Check( 'MD5( "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" ) ', MD5( "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" ), "d174ab98d277d9f5a5611c2c9f419d9f" )
   Check( 'MD5( Replicate( "1234567890", 8 ) )                                     ', MD5( Replicate( "1234567890", 8 ) ), "57edf4a22be3c955ac49da2e2107b67a" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
