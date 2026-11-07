/*
 * $DOC$
 *
 * $NAME$
 * StrPeek()
 *
 * $ONELINER$
 * Read the unsigned byte value at a string position
 *
 * $SYNTAX$
 * StrPeek( cString, nPos ) --> nByte
 *
 * $ARGUMENTS$
 * `cString`: any byte string, including embedded Chr(0).
 * `nPos`: byte position counted from 1; its fractional part is discarded towards zero.
 *
 * $RETURNS$
 * The byte code in 0..255, or 0 when the position is outside the string.
 *
 * $DESCRIPTION$
 * Returns the byte at nPos as an integer from 0 to 255. Returns 0 for a position outside the string, including a non-positive position or an empty string. Thus 0 can mean either a stored zero byte or an invalid position.
 * The string is not modified. UTF-8 characters may occupy more than one byte.
 *
 * $NOTES$
 * Missing required arguments or wrong argument types raise error 1102. This is a portable byte operation, with no dependency on the machine character set or obsolete hardware.
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
 * StrPoke(), Asc(), SubStr()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   s_Check( 'First byte', StrPeek( "ABC", 1 ), 65 )
   s_Check( 'Last byte', StrPeek( "ABC", 3 ), 67 )
   s_Check( 'Fractional position', StrPeek( "ABC", 1.9 ), 65 )
   s_Check( 'Zero byte', StrPeek( "A" + Chr( 0 ) + "B", 2 ), 0 )
   s_Check( 'Unsigned byte', StrPeek( Chr( 255 ), 1 ), 255 )
   s_Check( 'UTF-8 first byte', StrPeek( "ą", 1 ), 196 )
   s_Check( 'UTF-8 second byte', StrPeek( "ą", 2 ), 133 )
   s_Check( 'Empty string', StrPeek( "", 1 ), 0 )
   s_Check( 'Zero position', StrPeek( "ABC", 0 ), 0 )
   s_Check( 'Negative position', StrPeek( "ABC", -1 ), 0 )
   s_Check( 'Beyond end', StrPeek( "ABC", 4 ), 0 )
   s_Check( 'Huge position', StrPeek( "ABC", 1e30 ), 0 )
   s_Check( 'Expected error: text type', s_ErrorCode( {|| StrPeek( 1, 1 ) } ), 1102 )
   s_Check( 'Expected error: position type', s_ErrorCode( {|| StrPeek( "ABC", "1" ) } ), 1102 )
   s_Check( 'Expected error: missing position', s_ErrorCode( {|| StrPeek( "ABC" ) } ), 1102 )

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
