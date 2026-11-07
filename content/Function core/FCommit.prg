/*
 * $DOC$
 *
 * $NAME$
 * FCommit()
 *
 * $ONELINER$
 * Flush pending writes on a numeric file handle
 *
 * $SYNTAX$
 * FCommit( nFileHandle ) --> NIL
 *
 * $ARGUMENTS$
 * nFileHandle is a numeric handle returned by FOpen(), FCreate() or FTempCreate().
 *
 * $RETURNS$
 * NIL. Inspect FError() immediately: 0 means success.
 *
 * $DESCRIPTION$
 * Flush pending writes on a numeric file handle. Uses FlushFileBuffers on Windows and fsync on POSIX. The
 * handle remains open and its position is unchanged.
 *
 * $NOTES$
 * Bad numeric handles cause I/O failure; wrong or missing types raise error 1102. Device faults or hardware
 * ignoring flush requests can still cause data loss. Checks labelled Expected deliberately exercise failure
 * paths. A missing or different error fails the check.
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
 * FWrite(), FClose(), FError(), FileCommit()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := ""
   LOCAL nHandle := FTempCreate( NIL, "xdev-commit-", NIL, @cName )

   s_Check( 'Temporary file created', nHandle >= 0, .T. )
   s_Check( 'Write bytes', FWrite( nHandle, "abc" ), 3 )
   s_Check( 'Return value', FCommit( nHandle ), NIL )
   s_Check( 'Flush succeeded', FError(), 0 )
   s_Check( 'Position preserved', FSeek( nHandle, 0, 1 ), 3 )
   FClose( nHandle )
   s_Check( 'Written contents', FileLoad( cName ), "abc" )
   FErase( cName )
   s_Check( 'Invalid handle return', FCommit( -1 ), NIL )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FCommit( "bad" ) } ), 1102 )

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
