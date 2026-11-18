/*
 * $DOC$
 * $NAME$
 * DefPath()
 *
 * $ONELINER$
 * Return the SET DEFAULT directory with a separator at the end
 *
 * $SYNTAX$
 * DefPath( ) --> cDefaultPath
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The directory of Set( _SET_DEFAULT ) ready to be joined with a file name, or "" without SET
 * DEFAULT.
 *
 * $DESCRIPTION$
 * DefPath() adds the path separator when the directory does not end with one. On Windows a
 * single letter is a drive and gets ":".
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * DefPath() without SET DEFAULT    OK
 * a separator is added             OK
 * no second separator              OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Set(), OsPathSeparator()
 *
 * $DOCEND$
 */

#include "set.ch"

PROCEDURE Main()

   LOCAL cOld := Set( _SET_DEFAULT, "" )

   Check( 'DefPath() without SET DEFAULT    ', DefPath(), "" )

#if OS_WINDOWS
   Set( _SET_DEFAULT, "C:\data" )
   Check( 'a separator is added             ', DefPath(), "C:\data\" )
   Set( _SET_DEFAULT, "C:\data\" )
   Check( 'no second separator              ', DefPath(), "C:\data\" )
#else
   Set( _SET_DEFAULT, "/home/data" )
   Check( 'a separator is added             ', DefPath(), "/home/data/" )
   Set( _SET_DEFAULT, "/home/data/" )
   Check( 'no second separator              ', DefPath(), "/home/data/" )
#endif

   Set( _SET_DEFAULT, cOld )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
