/*
 * $DOC$
 * $NAME$
 * CharPack()
 *
 * $ONELINER$
 * Compress a string
 *
 * $SYNTAX$
 * CharPack( cString ) --> cCompressed
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
 * CharUnpack( CharPack( "AAAAAAAAAAAA" ) ) OK
 * Len( CharPack( cLine ) ) < Len( cLine )  OK
 * CharUnpack( CharPack( cLine ) )          OK
 * CharUnpack( CharPack( cData ) )          OK
 * CharUnpack( CharPack( "" ) )             OK
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

   LOCAL cLine := Replicate( "-", 100 )
   LOCAL cData := "AAAAAAAAAAAA" + Chr( 0 ) + "xDev" + Replicate( Chr( 255 ), 300 )

   Check( 'CharUnpack( CharPack( "AAAAAAAAAAAA" ) ) ', CharUnpack( CharPack( "AAAAAAAAAAAA" ) ), "AAAAAAAAAAAA" )
   Check( 'Len( CharPack( cLine ) ) < Len( cLine )  ', Len( CharPack( cLine ) ) < Len( cLine ), .T. )
   Check( 'CharUnpack( CharPack( cLine ) )          ', CharUnpack( CharPack( cLine ) ), cLine )
   Check( 'CharUnpack( CharPack( cData ) )          ', CharUnpack( CharPack( cData ) ), cData )
   Check( 'CharUnpack( CharPack( "" ) )             ', CharUnpack( CharPack( "" ) ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
