/*
 * $DOC$
 *
 * $NAME$
 * UUDecodeFile()
 *
 * $ONELINER$
 * Decode a UUencoded file to an explicit destination
 *
 * $SYNTAX$
 * UUDecodeFile( cSourceFile, cDestinationFile ) --> NIL
 *
 * $ARGUMENTS$
 * Both arguments are literal file paths. The destination is explicitly supplied.
 *
 * $RETURNS$
 * NIL; inspect FError() immediately for success (0) or failure.
 *
 * $DESCRIPTION$
 * Decode a UUencoded file to an explicit destination. Validates the entire input before opening the
 * destination. The envelope name and mode are never used as a path or permissions. A complete data body without
 * an envelope is also accepted.
 *
 * $NOTES$
 * These whole-file conversions allocate memory proportional to input size. The destination is replaced on
 * success. Malformed encoded data sets error 13 and leaves the destination unchanged; other I/O failures retain
 * the system error. Wrong or missing arguments raise error 1102. Checks labelled Expected deliberately exercise
 * failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Encoding return: OK
 * Encoding success: OK
 * Envelope header: OK
 * Decoding return: OK
 * Decoding success: OK
 * Binary round trip: OK
 * In-memory decoding: OK
 * Corrupt input return: OK
 * Expected malformed-data error: OK
 * Failure preserves destination: OK
 * Missing source return: OK
 * Expected I/O error: OK
 * Expected argument error: OK
 * Expected missing destination error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * UUEncode(), UUDecode(), UUEncodeFile(), FError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cData := "A" + Chr( 0 ) + Chr( 255 ) + Replicate( "abc", 30 )
   LOCAL cInput := s_TestFile( cData )
   LOCAL cEncoded := s_TestFile( "" )
   LOCAL cDecoded := s_TestFile( "old" )
   LOCAL cCorrupt := s_TestFile( "#truncated" )

   s_Check( 'Encoding return', UUEncodeFile( cInput, cEncoded ), NIL )
   s_Check( 'Encoding success', FError(), 0 )
   s_Check( 'Envelope header', Left( FileLoad( cEncoded ), 10 ), "begin 644 " )
   s_Check( 'Decoding return', UUDecodeFile( cEncoded, cDecoded ), NIL )
   s_Check( 'Decoding success', FError(), 0 )
   s_Check( 'Binary round trip', FileLoad( cDecoded ), cData )
   s_Check( 'In-memory decoding', UUDecode( FileLoad( cEncoded ) ), cData )
   s_Check( 'Corrupt input return', UUDecodeFile( cCorrupt, cDecoded ), NIL )
   s_Check( 'Expected malformed-data error', FError(), 13 )
   s_Check( 'Failure preserves destination', FileLoad( cDecoded ), cData )
   s_Check( 'Missing source return', UUDecodeFile( cInput + ".missing", cDecoded ), NIL )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| UUDecodeFile( 1, cDecoded ) } ), 1102 )
   s_Check( 'Expected missing destination error', s_ErrorCode( {|| UUDecodeFile( cInput ) } ), 1102 )
   FErase( cInput )
   FErase( cEncoded )
   FErase( cDecoded )
   FErase( cCorrupt )

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

STATIC FUNCTION s_TestFile( cData )

   LOCAL cName := ""
   LOCAL nHandle := FTempCreate( NIL, "xdev-doc-", NIL, @cName )

   IF nHandle < 0
      QOut( "Create fixture: ERROR" )
      RETURN ""
   ENDIF
   IF FWrite( nHandle, cData ) != Len( cData )
      QOut( "Write fixture: ERROR" )
   ENDIF
   FClose( nHandle )

RETURN cName
