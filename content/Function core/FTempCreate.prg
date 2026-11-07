/*
 * $DOC$
 *
 * $NAME$
 * FTempCreate()
 *
 * $ONELINER$
 * Create a unique temporary file opened for reading and writing
 *
 * $SYNTAX$
 * FTempCreate( [cTempDir], [cPrefix], [nFileAttr], [@cFileName] ) --> nFileHandle
 *
 * $ARGUMENTS$
 * cTempDir defaults to the system temporary directory; cPrefix to xdt; nFileAttr to FC_NORMAL (fileio.ch). The
 * optional output name is passed by reference.
 *
 * $RETURNS$
 * A numeric handle on success, -1 on I/O failure. FError() supplies the cause.
 *
 * $DESCRIPTION$
 * Create a unique temporary file opened for reading and writing. Exclusive creation never overwrites an
 * existing file. The caller owns the numeric handle and must close it with FClose(). The file remains until
 * explicitly erased.
 *
 * $NOTES$
 * NIL optional inputs use defaults. Prefixes are used as supplied rather than truncated to three characters.
 * Wrong argument types or a supplied non-NIL output without a reference raise error 1102. Checks labelled
 * Expected deliberately exercise failure paths. A missing or different error fails the check.
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
 * FCreate(), FClose(), FErase(), FileTemp()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cFirst := "", cSecond := "", cFailed := "sentinel"
   LOCAL nFirst := FTempCreate( NIL, "xdev-temp-", NIL, @cFirst )
   LOCAL nSecond := FTempCreate( NIL, "xdev-temp-", NIL, @cSecond )
   LOCAL nFailed

   s_Check( 'First handle', nFirst >= 0, .T. )
   s_Check( 'Second handle', nSecond >= 0, .T. )
   s_Check( 'Unique names', cFirst != cSecond, .T. )
   s_Check( 'File exists', FileExists( cFirst ), .T. )
   s_Check( 'Numeric handle write', FWrite( nFirst, "abc" ), 3 )
   FClose( nFirst )
   FClose( nSecond )
   s_Check( 'Data persists', FileLoad( cFirst ), "abc" )
   nFailed := FTempCreate( cFirst + ".missing-directory", NIL, NIL, @cFailed )
   s_Check( 'Expected missing-directory failure', nFailed, -1 )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
   s_Check( 'Failure clears output name', cFailed, "" )
   FErase( cFirst )
   FErase( cSecond )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FTempCreate( 1 ) } ), 1102 )
   s_Check( 'Expected reference error', s_ErrorCode( {|| FTempCreate( NIL, NIL, NIL, "name" ) } ), 1102 )

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
