/*
 * $DOC$
 * $NAME$
 * OsPathListSeparator()
 *
 * $ONELINER$
 * Return the character that separates the paths in a list of paths
 *
 * $SYNTAX$
 * OsPathListSeparator( ) --> cSeparator
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The separator of a list of paths: ";" on Windows and ":" on Linux.
 *
 * $DESCRIPTION$
 * A list of paths is one string with several directories, for example the PATH environment
 * variable. OsPathListSeparator() returns the character the system puts between them.
 *
 * Use it to split such a list into directories or to join directories into one list.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * OsPathListSeparator() on Windows OK
 * the list has three directories   OK
 * the second directory             OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GetEnv(), OsPathDelimiters(), OsPathSeparator()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aDirs, cList, cSep

#if OS_WINDOWS
   aDirs := { "C:\bin", "C:\tools", "D:\lib" }
   Check( 'OsPathListSeparator() on Windows ', OsPathListSeparator(), ";" )
#else
   aDirs := { "/usr/bin", "/opt/tools", "/home/lib" }
   Check( 'OsPathListSeparator() on Linux   ', OsPathListSeparator(), ":" )
#endif

   cSep  := OsPathListSeparator()
   cList := aDirs[ 1 ] + cSep + aDirs[ 2 ] + cSep + aDirs[ 3 ]

   Check( 'the list has three directories   ', NumToken( cList, cSep ), 3 )
   Check( 'the second directory             ', Token( cList, cSep, 2 ), aDirs[ 2 ] )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
