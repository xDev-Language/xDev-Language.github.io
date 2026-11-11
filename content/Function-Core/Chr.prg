/*
 * $DOC$
 * $NAME$
 * Chr()
 *
 * $ONELINER$
 * Return a single byte from its numeric code
 *
 * $SYNTAX$
 * Chr( nCode ) --> cByte
 *
 * $ARGUMENTS$
 * nCode
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
 * Chr( 65 )                   OK
 * Chr( 32 )                   OK
 * Asc( Chr( 0 ) )             OK
 * Len( Chr( 0 ) )             OK
 * Asc( Chr( 196 ) )           OK
 * Len( Chr( 196 ) )           OK
 * Chr( 256 )                 OK
 * Chr( 257 )                 OK
 * Chr( -1 )                  OK
 * All bytes 0..255            OK
 * Chr( "A" ): expected error  OK
 * Chr(): expected error       OK
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

   s_Check( 'Chr( 65 )                   ', Chr( 65 ), "A" )
   s_Check( 'Chr( 32 )                   ', Chr( 32 ), " " )
   s_Check( 'Asc( Chr( 0 ) )             ', Asc( Chr( 0 ) ), 0 )
   s_Check( 'Len( Chr( 0 ) )             ', Len( Chr( 0 ) ), 1 )
   s_Check( 'Asc( Chr( 196 ) )           ', Asc( Chr( 196 ) ), 196 )
   s_Check( 'Len( Chr( 196 ) )           ', Len( Chr( 196 ) ), 1 )
   s_Check( 'Chr( 256 )                 ', Chr( 256 ), Chr( 0 ) )
   s_Check( 'Chr( 257 )                 ', Chr( 257 ), Chr( 1 ) )
   s_Check( 'Chr( -1 )                  ', Chr( -1 ), Chr( 255 ) )
   s_Check( 'All bytes 0..255            ', s_AllBytes(), .T. )
   s_Check( 'Chr( "A" ): expected error  ', s_Fails( {|| Chr( "A" ) } ), .T. )
   s_Check( 'Chr(): expected error       ', s_Fails( {|| Chr() } ), .T. )

RETURN

STATIC FUNCTION s_AllBytes()

   LOCAL n

   FOR n := 0 TO 255
      IF Len( Chr( n ) ) != 1 .OR. Asc( Chr( n ) ) != n
         RETURN .F.
      ENDIF
   NEXT

RETURN .T.

STATIC FUNCTION s_Fails( bAction )

   LOCAL lFailed := .F.
   LOCAL bError := ErrorBlock( {| oError | Break( oError ) } )

   BEGIN SEQUENCE
      Eval( bAction )
   RECOVER
      lFailed := .T.
   END SEQUENCE
   ErrorBlock( bError )

RETURN lFailed

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( ValType( xResult ) == ValType( xExpected ) .AND. xResult == xExpected, "OK", "ERROR" ) )

RETURN
