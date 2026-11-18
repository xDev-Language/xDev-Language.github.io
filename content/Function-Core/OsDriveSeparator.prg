/*
 * $DOC$
 * $NAME$
 * OsDriveSeparator()
 *
 * $ONELINER$
 * Return the character that ends the drive in a path
 *
 * $SYNTAX$
 * OsDriveSeparator( ) --> cSeparator
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * ":" on Windows. An empty string on Linux, which has no drives.
 *
 * $DESCRIPTION$
 * On Windows a path can start with a drive letter, for example "C:". OsDriveSeparator() returns
 * the character after the letter.
 *
 * On Linux the result is empty, so code that builds a path with it works on both systems.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * OsDriveSeparator() on Windows    OK
 * the root of drive C              OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * OsPathDelimiters(), OsPathSeparator()
 *
 * $DOCEND$
 */

PROCEDURE Main()

#if OS_WINDOWS
   Check( 'OsDriveSeparator() on Windows    ', OsDriveSeparator(), ":" )
   Check( 'the root of drive C              ', "C" + OsDriveSeparator() + OsPathSeparator(), "C:\" )
#else
   Check( 'OsDriveSeparator() on Linux      ', OsDriveSeparator(), "" )
   Check( 'the root of the file system      ', OsDriveSeparator() + OsPathSeparator(), "/" )
#endif

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
