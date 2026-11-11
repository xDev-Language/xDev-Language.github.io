/*
 * $DOC$
 *
 * $NAME$
 * FileReadIni()
 *
 * $ONELINER$
 * Read UTF-8 INI configuration into hashes
 *
 * $SYNTAX$
 * FileReadIni( cFileName, [lCaseSens], [cDelimiters], [lAutoMain] ) --> hData | NIL
 *
 * $ARGUMENTS$
 * cFileName is a path. lCaseSens defaults to .T.; cDelimiters to :=| (any one of these bytes); lAutoMain to
 * .T.. NIL uses defaults.
 *
 * $RETURNS$
 * A hash of section hashes containing string values, or NIL on I/O or malformed-data failure. FileError() gives
 * the cause.
 *
 * $DESCRIPTION$
 * Read UTF-8 INI configuration into hashes. Global keys are assigned to MAIN by default; with lAutoMain false
 * they are root entries. Leading UTF-8 BOM is accepted. Space/tab around unquoted names and values is trimmed;
 * double-quoted values preserve whitespace and decode doubled quotes. Line and inline comments use
 * FileSetIniComment(). Inline markers inside quotes are data. Duplicate keys overwrite previous values;
 * repeated sections merge. This function opens and closes its own resource and returns no handle; callers do
 * not call FClose() or FileClose() for it.
 *
 * $NOTES$
 * Case-insensitive mode applies to section and field hashes. Default comments are semicolon for full lines and
 * # for inline comments. All values remain strings. Blank and unrecognized lines are skipped. Malformed
 * sections, quotes or zero bytes set error 13. Wrong argument types or empty delimiters raise error 1102.
 * Checks labelled Expected verify deliberate argument or I/O failures; a missing or different error fails the
 * check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Hash result: OK
 * Automatic MAIN: OK
 * Colon delimiter: OK
 * Pipe delimiter: OK
 * Quoted whitespace and marker: OK
 * Doubled quote: OK
 * Default case sensitivity: OK
 * Insensitive section and key: OK
 * No automatic MAIN: OK
 * Repeated section merges: OK
 * Expected malformed result: OK
 * Expected malformed I/O error: OK
 * Expected missing result: OK
 * Expected missing I/O error: OK
 * Expected delimiter error: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FileWriteIni(), FileSetIniComment(), HHasKey(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( Chr( 239 ) + Chr( 187 ) + Chr( 191 ) + "; comment" + Chr( 10 ) + "name = demo # ignored" + Chr( 10 ) + "[Section]" + Chr( 10 ) + "Value:42" + Chr( 10 ) + "Flag|yes" + Chr( 10 ) + 'Quoted=" x#y "' + Chr( 10 ) + 'Quote="a""b"' )
   LOCAL cBad := s_TestFile( 'key="unclosed' )
   LOCAL cRepeated := s_TestFile( "[A]" + Chr( 10 ) + "x=1" + Chr( 10 ) + "[A]" + Chr( 10 ) + "x=2" )
   LOCAL hData := FileReadIni( cName )
   LOCAL hInsensitive := FileReadIni( cName, .F. )
   LOCAL hFlat := FileReadIni( cName, .T., NIL, .F. )
   LOCAL hRepeated := FileReadIni( cRepeated )

   s_Check( 'Hash result', ValType( hData ), "H" )
   s_Check( 'Automatic MAIN', hData["MAIN"]["name"], "demo" )
   s_Check( 'Colon delimiter', hData["Section"]["Value"], "42" )
   s_Check( 'Pipe delimiter', hData["Section"]["Flag"], "yes" )
   s_Check( 'Quoted whitespace and marker', hData["Section"]["Quoted"], " x#y " )
   s_Check( 'Doubled quote', hData["Section"]["Quote"], 'a"b' )
   s_Check( 'Default case sensitivity', HHasKey( hData, "section" ), .F. )
   s_Check( 'Insensitive section and key', hInsensitive["section"]["value"], "42" )
   s_Check( 'No automatic MAIN', hFlat["name"], "demo" )
   s_Check( 'Repeated section merges', hRepeated["A"]["x"], "2" )
   s_Check( 'Expected malformed result', FileReadIni( cBad ), NIL )
   s_Check( 'Expected malformed I/O error', FileError(), 13 )
   s_Check( 'Expected missing result', FileReadIni( cName + ".missing" ), NIL )
   s_Check( 'Expected missing I/O error', FileError() != 0, .T. )
   s_Check( 'Expected delimiter error', s_ErrorCode( {|| FileReadIni( cName, NIL, "" ) } ), 1102 )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FileReadIni( NIL ) } ), 1102 )
   FErase( cName )
   FErase( cBad )
   FErase( cRepeated )

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
