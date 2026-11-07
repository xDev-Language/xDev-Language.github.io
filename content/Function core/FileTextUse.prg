/*
 * $DOC$
 *
 * $NAME$
 * FileTextUse()
 *
 * $ONELINER$
 * Open or close the selected text file area
 *
 * $SYNTAX$
 * FileTextUse( [cFileName], [nMode] ) --> nBorrowedHandle
 *
 * $ARGUMENTS$
 * cFileName is the path to an existing file; omitted, NIL or empty closes it. nMode defaults to FO_READ +
 * FO_DENYNONE from fileio.ch. Read-only or read/write modes are accepted; write-only mode cannot build a line
 * index.
 *
 * $RETURNS$
 * A borrowed numeric handle on opening success; -1 on failure or after closing. FileError() distinguishes
 * successful close (0) from failure.
 *
 * $DESCRIPTION$
 * Open or close the selected text file area. Opening builds a byte-offset index of physical lines, using CRLF,
 * CR or LF endings. A trailing ending adds no phantom line. A failed replacement preserves the previously open
 * file. No filename or an empty filename closes the area. The area owns its open resource. Any numeric handle
 * returned by FileTextUse() is borrowed: do not close it with FClose() or FileClose(). Close the selected area
 * with FileTextUse(). All open areas are also closed at runtime shutdown. FileOpen()/FileClose() instead use an
 * independently managed resource.
 *
 * $NOTES$
 * The index is a snapshot built on opening; external edits are not reflected until reopening. A closed-area
 * query or navigation sets FileError() to 6, except closing an already closed area succeeds. Wrong argument
 * types or invalid area numbers raise error 1102. Checks labelled Expected verify deliberate argument or I/O
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

   LOCAL cName := s_TestFile( "one" + Chr( 13 ) + Chr( 10 ) + Chr( 10 ) + "three" + Chr( 10 ) )
   LOCAL nOldArea := FileTextSelect( 1 )
   LOCAL nHandle := FileTextUse( cName )

   s_Check( 'Borrowed numeric handle', ValType( nHandle ), "N" )
   s_Check( 'Open succeeds', nHandle >= 0, .T. )
   s_Check( 'Initial line', FileTextReadLn(), "one" )
   s_Check( 'Expected missing-file result', FileTextUse( cName + ".missing" ), -1 )
   s_Check( 'Expected I/O error', FileError() != 0, .T. )
   s_Check( 'Failed replacement preserves open area', FileTextReadLn(), "one" )
   s_Check( 'Close result', FileTextUse(), -1 )
   s_Check( 'Close succeeds', FileError(), 0 )
   s_Check( 'Closed area EOF', FileTextEof(), .T. )
   s_Check( 'Expected type error', s_ErrorCode( {|| FileTextUse( 1 ) } ), 1102 )
   s_Check( 'Expected write-only mode error', s_ErrorCode( {|| FileTextUse( cName, 1 ) } ), 1102 )
   FileTextSelect( 1 )
   FileTextUse()
   FErase( cName )
   FileTextSelect( nOldArea )

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
