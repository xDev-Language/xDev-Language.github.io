/*
 * $DOC$
 *
 * $NAME$
 * StringToLiteral()
 *
 * $ONELINER$
 * Represent a byte string as an xDev source expression
 *
 * $SYNTAX$
 * StringToLiteral( cString ) --> cExpression
 *
 * $ARGUMENTS$
 * cString is any string, including quotes, backslashes and embedded zero bytes.
 *
 * $RETURNS$
 * Source text representing the original string.
 *
 * $DESCRIPTION$
 * Printable runs are placed in quotes. Control bytes are expressed as Chr( n ); pieces are joined with +. The
 * result uses the same string representation as ValToPrgExp(). Copy it into xDev source and compile it to
 * recover the original value.
 *
 * $NOTES$
 * xDev has no macro compiler: this function does not execute generated text. The expression can contain Chr()
 * calls rather than a single quoted literal. Wrong or missing arguments raise error 1102. Deliberately invalid
 * calls in the example must produce the stated error code; s_ErrorCode() catches it so execution continues.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ValToPrgExp(), CStr(), Chr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'Plain string', StringToLiteral( "abc" ), '"abc"' )
   s_Check( 'Empty string', StringToLiteral( "" ), '""' )
   s_Check( 'Zero byte', StringToLiteral( Chr( 0 ) ), "Chr( 0 )" )
   s_Check( 'Line feed', StringToLiteral( Chr( 10 ) ), "Chr( 10 )" )
   s_Check( 'Mixed binary data', StringToLiteral( "A" + Chr( 0 ) + "B" ), '"A" + Chr( 0 ) + "B"' )
   s_Check( 'Backslash is literal', StringToLiteral( "C:\data" ), '"C:\data"' )
   s_Check( 'Matches serializer', StringToLiteral( 'a"b' ), ValToPrgExp( 'a"b' ) )
   s_Check( 'Expected argument error', s_ErrorCode( {|| StringToLiteral( NIL ) } ), 1102 )
   s_Check( 'Expected missing argument error', s_ErrorCode( {|| StringToLiteral() } ), 1102 )

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
