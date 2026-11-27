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
 * FTempCreate( [cTempDir], [cPrefix], [nFileAttr], [@cFileName] ) --> nFileHandle | -1
 *
 * $ARGUMENTS$
 * `cTempDir` Directory in which to create the file. Omit it or pass an empty string to use the system temporary directory.
 * `cPrefix` Prefix for the generated file name. Defaults to `xdt`. An empty string requests no prefix.
 * `nFileAttr` Creation flags from `fileio.ch`. Defaults to `FC_NORMAL`.
 * `cFileName` Optional variable passed by reference to receive the generated path.
 *
 * $RETURNS$
 * A numeric read/write handle on success, or `-1` on I/O failure. Read `FError()` for the error code.
 * If supplied, `cFileName` receives the generated path on success or an empty string on I/O failure.
 *
 * $DESCRIPTION$
 * Create a unique temporary file opened for reading and writing. Exclusive creation never overwrites an
 * existing file. The caller owns the numeric handle and must close it with FClose(). The file remains until
 * explicitly erased.
 *
 * $NOTES$
 * Optional inputs passed as `NIL` use their defaults. Prefixes are used in full.
 * Wrong argument types or a supplied non-NIL output without a reference raise error 1102. Checks labelled
 * Expected deliberately exercise failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * First handle: OK
 * Second handle: OK
 * Unique names: OK
 * File exists: OK
 * Numeric handle write: OK
 * Data persists: OK
 * Expected missing-directory failure: OK
 * Expected I/O error: OK
 * Failure clears output name: OK
 * Expected argument error: OK
 * Expected reference error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 * fileio.ch
 *
 * $SEEALSO$
 * FCreate(), FWrite(), FClose(), FErase(), FError(), FileTemp()
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
   ENDSEQUENCE
   ErrorBlock( bPrevious )

RETURN nCode
