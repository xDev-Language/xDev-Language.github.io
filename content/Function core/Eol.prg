/*
 * $DOC$
 * $NAME$
 * Eol()
 *
 * $ONELINER$
 * Return the end of line of the system or the one used in a text
 *
 * $SYNTAX$
 * Eol( [cText] ) --> cEol
 *
 * $ARGUMENTS$
 * `cText` A text, for example the contents of a file read with MemoRead(). Without the argument
 * Eol() returns the end of line of the system.
 *
 * $RETURNS$
 * Without `cText`: the end of line of the system, Chr( 13 ) + Chr( 10 ) on Windows and Chr( 10 ) on
 * Linux.
 *
 * With `cText`: the end of line used in the text. Chr( 13 ) + Chr( 10 ) when the text has it
 * anywhere, otherwise Chr( 10 ) when the text has it, otherwise Chr( 13 ) when the text has it,
 * otherwise the end of line of the system.
 *
 * $DESCRIPTION$
 * There are two cases, and each has its own form of the call:
 *
 * - A new text, for example a report or a new file: lines end with Eol(), the end of line of the
 *   system the program runs on.
 * - A changed text, for example a file opened in an editor and saved again: lines end with
 *   Eol( cText ), the end of line the file already has. A file from Linux keeps Chr( 10 ) after
 *   saving on Windows, and a file from Windows keeps Chr( 13 ) + Chr( 10 ) on Linux.
 *
 * Read the end of line before the text is split into lines, for example with
 * ATokens( cText, .T. ): the lines have no end of line any more.
 *
 * For a large file the beginning is enough, for example Eol( Left( cText, 4096 ) ).
 *
 * $NOTES$
 * One Chr( 13 ) + Chr( 10 ) anywhere in the text decides, also when the other lines end with
 * Chr( 10 ) only.
 *
 * MemoWrit() adds the end of file character Chr( 26 ) by default; MemoWrit( cFile, cText, .F. )
 * writes the text without it.
 *
 * OutStd(), OutErr() and QOut() without a GT write the bytes as given: OutStd( cText + Eol() )
 * ends the line once, on Windows too.
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
 * ATokens(), MemoRead(), MemoWrit(), OutStd()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cCrLf := Chr( 13 ) + Chr( 10 )
   LOCAL cLf   := Chr( 10 )
   LOCAL cCr   := Chr( 13 )
   LOCAL cText, cEol, aLines, cSaved, i

#if OS_WINDOWS
   Check( 'Eol() on Windows                 ', Eol(), cCrLf )
#else
   Check( 'Eol() on Linux                   ', Eol(), cLf )
#endif

   Check( 'Eol( "a" + CRLF + "b" )          ', Eol( "a" + cCrLf + "b" ), cCrLf )
   Check( 'Eol( "a" + LF + "b" )            ', Eol( "a" + cLf + "b" ), cLf )
   Check( 'Eol( "a" + CR + "b" )            ', Eol( "a" + cCr + "b" ), cCr )
   Check( 'Eol( "abc" ), no end of line     ', Eol( "abc" ), Eol() )
   Check( 'Eol( "a" + LF + "b" + CRLF )     ', Eol( "a" + cLf + "b" + cCrLf ), cCrLf )

   /* a file from Linux is changed and saved again: it keeps its end of line */
   MemoWrit( "eol-demo.txt", "first" + cLf + "second" + cLf + "third", .F. )

   cText  := MemoRead( "eol-demo.txt" )
   cEol   := Eol( cText )
   aLines := ATokens( cText, .T. )

   aLines[ 2 ] := "second, changed"

   cSaved := ""
   FOR i := 1 TO Len( aLines )
      cSaved += aLines[ i ] + iif( i < Len( aLines ), cEol, "" )
   NEXT
   MemoWrit( "eol-demo.txt", cSaved, .F. )

   cText := MemoRead( "eol-demo.txt" )
   Check( 'the file keeps LF                ', Eol( cText ), cLf )
   Check( 'the file has no CR               ', cCr $ cText, .F. )
   Check( 'the changed line                 ', ATokens( cText, .T. )[ 2 ], "second, changed" )

   FErase( "eol-demo.txt" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
