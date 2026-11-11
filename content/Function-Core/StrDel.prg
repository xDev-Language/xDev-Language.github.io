/*
 * $DOC$
 *
 * $NAME$
 * StrDel()
 *
 * $ONELINER$
 * Delete bytes selected by a position mask
 *
 * $SYNTAX$
 * StrDel( cString, cMask ) --> cResult
 *
 * $ARGUMENTS$
 * cString is the source byte string. cMask selects positions: a space keeps a byte; any other mask byte deletes
 * it.
 *
 * $RETURNS$
 * The remaining bytes in their original order.
 *
 * $DESCRIPTION$
 * The mask is applied once, starting at byte 1. Bytes beyond the end of a shorter mask are preserved; excess
 * mask bytes are ignored. An empty mask preserves the whole string. Neither argument is modified.
 *
 * $NOTES$
 * Positions count bytes, so deleting part of a UTF-8 character can produce invalid UTF-8. Wrong or missing
 * arguments raise error 1102. Deliberately invalid calls in the example must produce the stated error code;
 * s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Mask positions: OK
 * Keep spaces: OK
 * Delete all: OK
 * Long mask: OK
 * Empty mask: OK
 * Empty text: OK
 * Zero mask byte deletes: OK
 * Binary source: OK
 * Original unchanged: OK
 * Expected argument error: OK
 * Expected missing mask error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Stuff(), StrPoke()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cText := "abcdef"

   s_Check( 'Mask positions', StrDel( cText, "x x" ), "bdef" )
   s_Check( 'Keep spaces', StrDel( cText, "      " ), cText )
   s_Check( 'Delete all', StrDel( cText, "xxxxxx" ), "" )
   s_Check( 'Long mask', StrDel( "ab", " xxx" ), "a" )
   s_Check( 'Empty mask', StrDel( cText, "" ), cText )
   s_Check( 'Empty text', StrDel( "", "x" ), "" )
   s_Check( 'Zero mask byte deletes', StrDel( "AB", Chr( 0 ) ), "B" )
   s_Check( 'Binary source', StrDel( "A" + Chr( 0 ) + "B", "x x" ), Chr( 0 ) )
   s_Check( 'Original unchanged', cText, "abcdef" )
   s_Check( 'Expected argument error', s_ErrorCode( {|| StrDel( 1, "x" ) } ), 1102 )
   s_Check( 'Expected missing mask error', s_ErrorCode( {|| StrDel( "abc" ) } ), 1102 )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN

STATIC FUNCTION s_ErrorCode( bAction )

   LOCAL nCode := 0
   LOCAL oError
   LOCAL bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER USING oError
      nCode := oError:SubCode
   END SEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
