/*
 * $DOC$
 *
 * $NAME$
 * FileWriteIni()
 *
 * $ONELINER$
 * Write UTF-8 INI configuration with LF line endings
 *
 * $SYNTAX$
 * FileWriteIni( cFileName, hData, [cCommentBegin], [cCommentEnd], [lAutoMain] ) --> lSuccess
 *
 * $ARGUMENTS$
 * cFileName is a destination path; hData is a hash with string keys and section hashes. Scalar root entries are
 * global keys. Optional comments are strings; lAutoMain defaults to .T..
 *
 * $RETURNS$
 * .T. after writing successfully, .F. on an I/O failure. Inspect FileError() immediately.
 *
 * $DESCRIPTION$
 * Write UTF-8 INI configuration with LF line endings. MAIN section entries are written globally when lAutoMain
 * is true; other hashes receive section headers. Values are double-quoted with doubled internal quotes,
 * preserving spaces and comment markers. Strings, numbers, logicals, dates and NIL are converted to text
 * (numbers without display padding); a read returns strings rather than original scalar types. All data is
 * validated before the destination is opened. The function owns and closes its internal file resource; no
 * handle is returned and no FClose()/FileClose() call is needed.
 *
 * $NOTES$
 * Multiline or zero-containing values, unsupported nested values and invalid names raise error 1102. Names must
 * be non-empty strings without line endings, quotes, brackets, comment markers or surrounding whitespace; field
 * names cannot contain :=|. Optional comments are split into individually prefixed lines. Comments require an
 * enabled line-comment marker. Checks labelled Expected verify deliberate argument or I/O failures; a missing
 * or different error fails the check.
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
 * FileReadIni(), FileSetIniComment(), CStr(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "old" )
   LOCAL hData := { "MAIN" => { "name" => " demo " }, "Section" => { "count" => 42, "flag" => .T., "quote" => 'a"b', "path" => "C:\tmp#folder" } }
   LOCAL hRead
   LOCAL cBefore

   s_Check( 'Write succeeds', FileWriteIni( cName, hData, "header", "footer" ), .T. )
   s_Check( 'I/O success', FileError(), 0 )
   hRead := FileReadIni( cName )
   s_Check( 'Whitespace round trip', hRead["MAIN"]["name"], " demo " )
   s_Check( 'Numeric value becomes text', hRead["Section"]["count"], "42" )
   s_Check( 'Logical value becomes text', hRead["Section"]["flag"], ".T." )
   s_Check( 'Quotes round trip', hRead["Section"]["quote"], 'a"b' )
   s_Check( 'Backslash and comment marker preserved', hRead["Section"]["path"], "C:\tmp#folder" )
   s_Check( 'Header is a comment', Left( FileLoad( cName ), 8 ), "; header" )
   s_Check( 'Explicit MAIN section write', FileWriteIni( cName, hData, NIL, NIL, .F. ), .T. )
   s_Check( 'MAIN header present', At( "[MAIN]", FileLoad( cName ) ) > 0, .T. )
   cBefore := FileLoad( cName )
   s_Check( 'Expected multiline-value error', s_ErrorCode( {|| FileWriteIni( cName, { "S" => { "bad" => "a" + Chr( 10 ) + "b" } } ) } ), 1102 )
   s_Check( 'Invalid data preserves destination', FileLoad( cName ), cBefore )
   s_Check( 'Expected root type error', s_ErrorCode( {|| FileWriteIni( cName, 1 ) } ), 1102 )
   s_Check( 'Missing-directory result', FileWriteIni( cName + ".missing" + PS() + "test.ini", hData ), .F. )
   s_Check( 'Expected I/O error', FileError() != 0, .T. )
   s_Check( 'Empty hash write', FileWriteIni( cName, { => } ), .T. )
   s_Check( 'Empty hash produces empty file', FileLoad( cName ), "" )
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
   LOCAL pFile := FileTemp( @cName )

   IF pFile == NIL
      QOut( "Create fixture: ERROR" )
      RETURN ""
   ENDIF
   IF FileWrite( pFile, cData ) != Len( cData )
      QOut( "Write fixture: ERROR" )
   ENDIF
   FileClose( pFile )

RETURN cName
