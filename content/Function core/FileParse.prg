/*
 * $DOC$
 *
 * $NAME$
 * FileParse()
 *
 * $ONELINER$
 * Read a CSV file into records, supporting delimiters and CR/LF bytes inside quoted fields
 *
 * $SYNTAX$
 * FileParse( cFileName, [cDelimiter] ) --> aRecords
 *
 * $ARGUMENTS$
 * cFileName is an existing CSV file path. cDelimiter is one byte, default comma, excluding a quote or a line
 * ending.
 *
 * $RETURNS$
 * A two-dimensional array of string fields. Failure returns an empty array and sets FileError().
 *
 * $DESCRIPTION$
 * Read a CSV file into records, supporting delimiters and CR/LF bytes inside quoted fields. Uses the same field
 * parser as FParseLine(). Doubled quotes decode to one quote. Blank physical records produce empty arrays; a
 * trailing newline adds no record. The function opens and closes its own resource and does not change the
 * selected FileText area.
 *
 * $NOTES$
 * FParse() and FParseEx() were duplicate placeholders; FileParse() is the single implementation. Malformed
 * input sets error 13 and discards all parsed rows. Wrong types or delimiters raise error 1102. Memory use
 * grows with the returned records and line index. Checks labelled Expected verify deliberate argument or I/O
 * failures; a missing or different error fails the check.
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
 * FileTextUse(), FileTextSelect(), FileTextInfo(), FileError()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cName := s_TestFile( 'a,b' + Chr( 10 ) + '"x,y","z"' + Chr( 10 ) + '"multi' + Chr( 13 ) + Chr( 10 ) + 'line",tail' )
   LOCAL cBad := s_TestFile( 'a,b' + Chr( 10 ) + '"unclosed' )
   LOCAL aRows := FileParse( cName )
   LOCAL cCustom := s_TestFile( "a;b" )
   LOCAL aCustom := FileParse( cCustom, ";" )

   s_Check( 'Record count', Len( aRows ), 3 )
   s_Check( 'First record', aRows[1][2], "b" )
   s_Check( 'Quoted delimiter', aRows[2][1], "x,y" )
   s_Check( 'Quoted line ending', aRows[3][1], "multi" + Chr( 13 ) + Chr( 10 ) + "line" )
   s_Check( 'Final field', aRows[3][2], "tail" )
   s_Check( 'Custom delimiter', aCustom[1][2], "b" )
   s_Check( 'Malformed input discards all rows', Len( FileParse( cBad ) ), 0 )
   s_Check( 'Expected malformed error', FileError(), 13 )
   s_Check( 'Missing input', Len( FileParse( cName + ".missing" ) ), 0 )
   s_Check( 'Expected I/O error', FileError() != 0, .T. )
   s_Check( 'Expected delimiter error', s_ErrorCode( {|| FileParse( cName, "||" ) } ), 1102 )
   s_Check( 'Expected type error', s_ErrorCode( {|| FileParse( 1 ) } ), 1102 )
   FErase( cName )
   FErase( cBad )
   FErase( cCustom )

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
