/*
 * $DOC$
 *
 * $NAME$
 * FileSetIniComment()
 *
 * $ONELINER$
 * Set program-wide INI comment markers for FileReadIni() and FileWriteIni()
 *
 * $SYNTAX$
 * FileSetIniComment( cLineComment, cInlineComment ) --> NIL
 *
 * $ARGUMENTS$
 * Each argument is one marker byte, or an empty string to disable that kind of comment. Defaults at program
 * start are ; and #.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * Set program-wide INI comment markers for FileReadIni() and FileWriteIni(). Markers must differ from a double
 * quote, CR, LF or zero byte. Both inputs are validated before either setting changes. This changes parser
 * settings, owns no file resource and returns no handle.
 *
 * $NOTES$
 * Changing settings affects subsequent INI calls only. Restore defaults after a temporary change. Wrong types,
 * missing arguments, disallowed markers or more than one byte raise error 1102. Checks labelled Expected verify
 * deliberate argument or I/O failures; a missing or different error fails the check.
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
 * FileReadIni(), FileWriteIni()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( "! ignored" + Chr( 10 ) + "key=value ~ ignored" + Chr( 10 ) + "hash=keep#literal" )
   LOCAL hData

   s_Check( 'Setter returns NIL', FileSetIniComment( "!", "~" ), NIL )
   hData := FileReadIni( cName )
   s_Check( 'Custom inline marker', hData["MAIN"]["key"], "value" )
   s_Check( 'Old marker is literal', hData["MAIN"]["hash"], "keep#literal" )
   s_Check( 'Writer uses custom marker', FileWriteIni( cName, { "MAIN" => { "x" => "y" } }, "header" ), .T. )
   s_Check( 'Custom comment prefix', Left( FileLoad( cName ), 8 ), "! header" )
   s_Check( 'Disable comment recognition', FileSetIniComment( "", "" ), NIL )
   s_Check( 'Expected comment-output error', s_ErrorCode( {|| FileWriteIni( cName, { => }, "header" ) } ), 1102 )
   s_Check( 'Expected marker-length error', s_ErrorCode( {|| FileSetIniComment( "//", "#" ) } ), 1102 )
   s_Check( 'Expected marker-type error', s_ErrorCode( {|| FileSetIniComment( NIL, "#" ) } ), 1102 )
   s_Check( 'Restore defaults', FileSetIniComment( ";", "#" ), NIL )
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
