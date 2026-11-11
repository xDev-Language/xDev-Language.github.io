/*
 * $DOC$
 *
 * $NAME$
 * FNameMerge()
 *
 * $ONELINER$
 * Join a path, file name and extension
 *
 * $SYNTAX$
 * FNameMerge( [cPath], [cFileName], [cExtension] ) --> cResult
 *
 * $ARGUMENTS$
 * All components are optional strings. NIL or omission means an empty component.
 *
 * $RETURNS$
 * The joined name, or an empty string with no arguments.
 *
 * $DESCRIPTION$
 * Join a path, file name and extension. Adds a native path separator when needed and a dot before an extension
 * lacking one. Existing separators are preserved. There is no normalization, file access or existence check.
 *
 * $NOTES$
 * A path alone is unchanged. An extension alone starts with a dot. Wrong argument types raise error 1102.
 * Checks labelled Expected deliberately exercise failure paths. A missing or different error fails the check.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * No arguments: OK
 * Name only: OK
 * Extension with dot: OK
 * Extension without dot: OK
 * Separator added: OK
 * No duplicate separator: OK
 * Path only: OK
 * Extension only: OK
 * Split and merge: OK
 * Expected argument error: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FNameSplit(), DirName(), PS()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cPath, cName, cExtension
   LOCAL cFull := "data" + PS() + "report.txt"

   s_Check( 'No arguments', FNameMerge(), "" )
   s_Check( 'Name only', FNameMerge( NIL, "report" ), "report" )
   s_Check( 'Extension with dot', FNameMerge( NIL, "report", ".txt" ), "report.txt" )
   s_Check( 'Extension without dot', FNameMerge( NIL, "report", "txt" ), "report.txt" )
   s_Check( 'Separator added', FNameMerge( "data", "report", "txt" ), cFull )
   s_Check( 'No duplicate separator', FNameMerge( "data" + PS(), "report", "txt" ), cFull )
   s_Check( 'Path only', FNameMerge( "data" ), "data" )
   s_Check( 'Extension only', FNameMerge( NIL, NIL, "txt" ), ".txt" )
   FNameSplit( cFull, @cPath, @cName, @cExtension )
   s_Check( 'Split and merge', FNameMerge( cPath, cName, cExtension ), cFull )
   s_Check( 'Expected argument error', s_ErrorCode( {|| FNameMerge( 1 ) } ), 1102 )

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
