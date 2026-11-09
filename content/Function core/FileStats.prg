/*
 * $DOC$
 *
 * $NAME$
 * FileStats()
 *
 * $ONELINER$
 * Read a single file metadata snapshot without loading its contents
 *
 * $SYNTAX$
 * FileStats( cFileName, [@cFileAttr], [@nFileSize], [@dCreateDate], [@nCreateTime], [@dChangeDate],
 * [@nChangeTime] ) --> lSuccess
 *
 * $ARGUMENTS$
 * cFileName is a literal path. Optional outputs are references or NIL: attribute letters RHSDA, byte size,
 * local creation date/time and local last-write date/time. Times are seconds since midnight.
 *
 * $RETURNS$
 * .T. on success; .F. on I/O failure, with outputs unchanged and FError() set.
 *
 * $DESCRIPTION$
 * Read a single file metadata snapshot without loading its contents. Wildcards and SET PATH searching are not
 * used. Windows supplies true creation and write times; POSIX creation outputs use metadata-change time (ctime)
 * because portable stat() has no birth-time field.
 *
 * $NOTES$
 * Runtime validation was performed on Windows. A supplied non-NIL output without a reference or wrong input
 * type raises error 1102. Checks labelled Expected deliberately exercise failure paths. A missing or different
 * error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Metadata success: OK
 * Byte size: OK
 * Attributes are text: OK
 * Creation date type: OK
 * Creation date present: OK
 * Creation seconds range: OK
 * Change date type: OK
 * Change seconds range: OK
 * No outputs required: OK
 * Missing file: OK
 * Expected I/O error: OK
 * Failure preserves output: OK
 * Expected reference error: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FileDate(), FileTimeGet(), FileAttr(), Directory()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "A" + Chr( 0 ) + "B" )
   LOCAL cAttr := "", nSize := -1, dCreated, nCreated, dChanged, nChanged

   s_Check( 'Metadata success', FileStats( cName, @cAttr, @nSize, @dCreated, @nCreated, @dChanged, @nChanged ), .T. )
   s_Check( 'Byte size', nSize, 3 )
   s_Check( 'Attributes are text', ValType( cAttr ), "C" )
   s_Check( 'Creation date type', ValType( dCreated ), "D" )
   s_Check( 'Creation date present', Empty( dCreated ), .F. )
   s_Check( 'Creation seconds range', nCreated >= 0 .AND. nCreated < 86400, .T. )
   s_Check( 'Change date type', ValType( dChanged ), "D" )
   s_Check( 'Change seconds range', nChanged >= 0 .AND. nChanged < 86400, .T. )
   s_Check( 'No outputs required', FileStats( cName ), .T. )
   nSize := 99
   s_Check( 'Missing file', FileStats( cName + ".missing", NIL, @nSize ), .F. )
   s_Check( 'Expected I/O error', FError() != 0, .T. )
   s_Check( 'Failure preserves output', nSize, 99 )
   s_Check( 'Expected reference error', s_ErrorCode( {|| FileStats( cName, "attrs" ) } ), 1102 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FileStats( NIL ) } ), 1102 )
   FErase( cName )

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
