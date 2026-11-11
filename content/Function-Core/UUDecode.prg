/*
 * $DOC$
 *
 * $NAME$
 * UUDecode()
 *
 * $ONELINER$
 * Decode and validate a complete UUencode body or file envelope
 *
 * $SYNTAX$
 * UUDecode( cEncoded ) --> cString
 *
 * $ARGUMENTS$
 * cEncoded is a UUencode body ending in a zero-length line, optionally enclosed in begin/end lines.
 *
 * $RETURNS$
 * The decoded binary bytes; empty input decodes to an empty string.
 *
 * $DESCRIPTION$
 * Accepts space or backtick for a zero six-bit group, and LF or CRLF line endings. An envelope begins with
 * begin, a three-digit octal mode and a name; its name and mode are never used to open a file. With an
 * envelope, an end line is required. Data lines decode at most 45 bytes each.
 *
 * $NOTES$
 * Malformed or truncated data, missing required terminators and wrong argument types raise error 1102. No
 * partially decoded result is returned. Blank lines are ignored. Deliberately invalid calls in the example must
 * produce the stated error code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Known vector: OK
 * Envelope: OK
 * Empty input: OK
 * Empty data body: OK
 * Space zero form: OK
 * CRLF input: OK
 * No final newline: OK
 * Expected truncated line error: OK
 * Expected missing terminator error: OK
 * Expected missing end error: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * UUEncode(), UUDecodeFile()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cBody := "#0V%T" + Chr( 10 ) + "`" + Chr( 10 )

   s_Check( 'Known vector', UUDecode( cBody ), "Cat" )
   s_Check( 'Envelope', UUDecode( "begin 644 cat.txt" + Chr( 10 ) + cBody + "end" + Chr( 10 ) ), "Cat" )
   s_Check( 'Empty input', UUDecode( "" ), "" )
   s_Check( 'Empty data body', UUDecode( "`" + Chr( 10 ) ), "" )
   s_Check( 'Space zero form', UUDecode( " " + Chr( 10 ) ), "" )
   s_Check( 'CRLF input', UUDecode( "#0V%T" + ( Chr( 13 ) + e"\n`" + Chr( 13 ) + e"\n" ) ), "Cat" )
   s_Check( 'No final newline', UUDecode( "#0V%T" + Chr( 10 ) + "`" ), "Cat" )
   s_Check( 'Expected truncated line error', s_ErrorCode( {|| UUDecode( "#0V" ) } ), 1102 )
   s_Check( 'Expected missing terminator error', s_ErrorCode( {|| UUDecode( "#0V%T" + Chr( 10 ) ) } ), 1102 )
   s_Check( 'Expected missing end error', s_ErrorCode( {|| UUDecode( "begin 644 cat.txt" + Chr( 10 ) + cBody ) } ), 1102 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| UUDecode( NIL ) } ), 1102 )

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
