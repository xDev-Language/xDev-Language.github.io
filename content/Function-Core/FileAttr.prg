/*
 * $DOC$
 * $NAME$
 * FileAttr()
 *
 * $ONELINER$
 * Return the attributes of a file
 *
 * $SYNTAX$
 * FileAttr( cFileName ) --> nAttributes
 *
 * $ARGUMENTS$
 * cFileName
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * BitAnd( FileAttr( "fileattr.txt" ), FA_DIRECTORY ) OK
 * BitAnd( FileAttr( "." ), FA_DIRECTORY )            OK
 * FileAttr( "no-such-file.txt" )                     OK
 * FErase( "fileattr.txt" )                           OK
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "fileio.ch"

PROCEDURE Main()

   LOCAL lText := MemoWrit( "fileattr.txt", "xDev", .F. )

   Check( 'BitAnd( FileAttr( "fileattr.txt" ), FA_DIRECTORY ) ', BitAnd( FileAttr( "fileattr.txt" ), FA_DIRECTORY ), 0 )
   Check( 'BitAnd( FileAttr( "." ), FA_DIRECTORY )            ', BitAnd( FileAttr( "." ), FA_DIRECTORY ), FA_DIRECTORY )
   Check( 'FileAttr( "no-such-file.txt" )                     ', FileAttr( "no-such-file.txt" ), 0 )
   Check( 'FErase( "fileattr.txt" )                           ', FErase( "fileattr.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
