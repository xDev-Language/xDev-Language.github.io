/*
 * $DOC$
 *
 * $NAME$
 * UUEncode()
 *
 * $ONELINER$
 * Encode bytes as a complete UUencode data body
 *
 * $SYNTAX$
 * UUEncode( cString, [nBytes] ) --> cEncoded
 *
 * $ARGUMENTS$
 * cString contains the source bytes. nBytes optionally selects an initial byte count from 0 to Len(cString);
 * omitted or NIL means the whole string.
 *
 * $RETURNS$
 * UUencode data lines followed by a zero-length line.
 *
 * $DESCRIPTION$
 * Encodes at most 45 source bytes per line, using the traditional six-bit alphabet. Zero groups use the
 * backtick form. Lines end in LF regardless of platform. This in-memory form contains no begin/end envelope;
 * UUEncodeFile() adds it.
 *
 * $NOTES$
 * Encoding is byte-based and preserves binary zeroes. A wrong type or byte count outside the source length
 * raises error 1102. Fractional byte counts are truncated after range checking. Deliberately invalid calls in
 * the example must produce the stated error code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Known Cat vector: OK
 * Empty body: OK
 * Zero count: OK
 * Partial source: OK
 * Binary round trip: OK
 * Multiple lines: OK
 * 45-byte line: OK
 * Fractional count: OK
 * Expected count error: OK
 * Expected negative count error: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * UUDecode(), UUEncodeFile()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cBinary := Chr( 0 ) + Chr( 255 ) + "AB"

   s_Check( 'Known Cat vector', UUEncode( "Cat" ), "#0V%T" + Chr( 10 ) + "`" + Chr( 10 ) )
   s_Check( 'Empty body', UUEncode( "" ), "`" + Chr( 10 ) )
   s_Check( 'Zero count', UUEncode( "abc", 0 ), UUEncode( "" ) )
   s_Check( 'Partial source', UUDecode( UUEncode( "abcdef", 3 ) ), "abc" )
   s_Check( 'Binary round trip', UUDecode( UUEncode( cBinary ) ), cBinary )
   s_Check( 'Multiple lines', UUDecode( UUEncode( Replicate( "abc", 100 ) ) ), Replicate( "abc", 100 ) )
   s_Check( '45-byte line', Left( UUEncode( Replicate( "A", 45 ) ), 1 ), "M" )
   s_Check( 'Fractional count', UUDecode( UUEncode( "abc", 1.9 ) ), "a" )
   s_Check( 'Expected count error', s_ErrorCode( {|| UUEncode( "a", 2 ) } ), 1102 )
   s_Check( 'Expected negative count error', s_ErrorCode( {|| UUEncode( "a", -1 ) } ), 1102 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| UUEncode( 1 ) } ), 1102 )

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
