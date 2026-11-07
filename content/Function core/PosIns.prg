/*
 * $DOC$
 * $NAME$
 * PosIns()
 *
 * $ONELINER$
 * Insert character(s) at a specified position in a string
 *
 * $SYNTAX$
 * PosIns( cString, cInsert, [nPos] ) --> cResult
 *
 * $ARGUMENTS$
 * cString
 * cInsert
 * nPos
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

   LOCAL cDate := "20261102"

   Check( 'PosIns( "abcdefgh", "123", 2 )               ', PosIns( "abcdefgh", "123", 2 ), "a123bcdefgh" )
   Check( 'PosIns( "abcdefgh", "123", 8 )               ', PosIns( "abcdefgh", "123", 8 ), "abcdefg123h" )
   Check( 'PosIns( "abcdefgh", "123", 10 )              ', PosIns( "abcdefgh", "123", 10 ), "abcdefgh" )
   Check( 'PosIns( PosIns( cDate, "-", 7 ), "-", 5 )    ', PosIns( PosIns( cDate, "-", 7 ), "-", 5 ), "2026-11-02" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
