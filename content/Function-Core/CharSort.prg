/*
 * $DOC$
 * $NAME$
 * CharSort()
 *
 * $ONELINER$
 * Sort characters or character sequences within a string
 *
 * $SYNTAX$
 * CharSort( cString, [nSeqLen], [nCompareLen], [nSkipChars], [nSkipSeq], [nSortLen], [lDescending] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * nSeqLen
 * nCompareLen
 * nSkipChars
 * nSkipSeq
 * nSortLen
 * lDescending
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
 * CharSort( "qwert" )                    OK
 * CharSort( "qwert", 2 )                 OK
 * CharSort( "b1a4a3a2a1", 2, 1 )         OK
 * CharSort( "XXXqwert", 1, 1, 3 )        OK
 * CharSort( "b1a4a3a2a1", 2, 1, 0, 1 )   OK
 * CharSort( "384172852", 1, 1, 0, 0, 4 ) OK
 * CharSort( "qwert", , , , , , .T. )     OK
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

   Check( 'CharSort( "qwert" )                    ', CharSort( "qwert" ), "eqrtw" )
   Check( 'CharSort( "qwert", 2 )                 ', CharSort( "qwert", 2 ), "erqwt" )
   Check( 'CharSort( "b1a4a3a2a1", 2, 1 )         ', CharSort( "b1a4a3a2a1", 2, 1 ), "a4a3a2a1b1" )
   Check( 'CharSort( "XXXqwert", 1, 1, 3 )        ', CharSort( "XXXqwert", 1, 1, 3 ), "XXXeqrtw" )
   Check( 'CharSort( "b1a4a3a2a1", 2, 1, 0, 1 )   ', CharSort( "b1a4a3a2a1", 2, 1, 0, 1 ), "b1a1a2a3a4" )
   Check( 'CharSort( "384172852", 1, 1, 0, 0, 4 ) ', CharSort( "384172852", 1, 1, 0, 0, 4 ), "134872852" )
   Check( 'CharSort( "qwert", , , , , , .T. )     ', CharSort( "qwert", , , , , , .T. ), "wtrqe" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
