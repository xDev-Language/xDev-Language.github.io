/*
 * $DOC$
 * $NAME$
 * OsPathDelimiters()
 *
 * $ONELINER$
 * Return the characters that delimit the parts of a path
 *
 * $SYNTAX$
 * OsPathDelimiters( ) --> cDelimiters
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The characters that end a drive or a directory in a path: "\/:" on Windows and "/" on Linux.
 *
 * $DESCRIPTION$
 * OsPathDelimiters() tells which characters separate the parts of a path on the system the
 * program runs on. A file name starts after the last of them.
 *
 * Use it to test single characters, for example with the `$` operator. To build a path, use
 * OsPathSeparator(): it returns the one character the system writes between directories.
 *
 * $NOTES$
 * Windows accepts both "\" and "/" between directories, and ":" ends the drive letter.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * OsPathDelimiters() on Windows    OK
 * "\" is a delimiter               OK
 * "." is not a delimiter           OK
 * the file name of the path        OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * OsPathSeparator(), OsDriveSeparator(), OsPathListSeparator()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cPath, i

#if OS_WINDOWS
   cPath := "C:\data\report.txt"
   Check( 'OsPathDelimiters() on Windows    ', OsPathDelimiters(), "\/:" )
   Check( '"\" is a delimiter               ', "\" $ OsPathDelimiters(), .T. )
#else
   cPath := "/home/data/report.txt"
   Check( 'OsPathDelimiters() on Linux      ', OsPathDelimiters(), "/" )
   Check( '"/" is a delimiter               ', "/" $ OsPathDelimiters(), .T. )
#endif

   Check( '"." is not a delimiter           ', "." $ OsPathDelimiters(), .F. )

   /* the file name starts after the last delimiter */
   i := Len( cPath )
   DO WHILE i > 0 .AND. .NOT. SubStr( cPath, i, 1 ) $ OsPathDelimiters()
      i--
   ENDDO
   Check( 'the file name of the path        ', SubStr( cPath, i + 1 ), "report.txt" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
