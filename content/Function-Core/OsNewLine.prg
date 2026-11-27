/*
 * $DOC$
 * $NAME$
 * OsNewLine()
 *
 * $ONELINER$
 * Return the end of line of the operating system
 *
 * $SYNTAX$
 * OsNewLine( ) --> cEndOfLine
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * Chr( 13 ) + Chr( 10 ) on Windows and Chr( 10 ) on Linux.
 *
 * $DESCRIPTION$
 * OsNewLine() returns the same value as Eol() without an argument.
 *
 * $NOTES$
 * Eol( cText ) also finds the end of line that a text already uses.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * OsNewLine() on Windows           OK
 * OsNewLine() is Eol()             OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Eol()
 *
 * $DOCEND$
 */

PROCEDURE Main()

#if OS_WINDOWS
   Check( 'OsNewLine() on Windows           ', OsNewLine(), Chr( 13 ) + Chr( 10 ) )
#else
   Check( 'OsNewLine() on Linux             ', OsNewLine(), Chr( 10 ) )
#endif

   Check( 'OsNewLine() is Eol()             ', OsNewLine(), Eol() )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
