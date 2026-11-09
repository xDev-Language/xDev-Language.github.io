/*
 * $DOC$
 * $NAME$
 * SetFAttr()
 *
 * $ONELINER$
 * Set file attributes
 *
 * $SYNTAX$
 * SetFAttr( cFileName, [nAttributes] ) --> nErrorCode
 *
 * $ARGUMENTS$
 * cFileName
 * nAttributes
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
 * SetFAttr( "setfattr.txt", FA_READONLY )           OK
 * BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ) OK
 * SetFAttr( "setfattr.txt" )                        OK
 * BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ) OK
 * SetFAttr( "no-such-file.txt" )                    OK
 * FErase( "setfattr.txt" )                          OK
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

   LOCAL lText := MemoWrit( "setfattr.txt", "xDev", .F. )

   Check( 'SetFAttr( "setfattr.txt", FA_READONLY )           ', SetFAttr( "setfattr.txt", FA_READONLY ), 0 )
   Check( 'BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ) ', BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ), FA_READONLY )
   Check( 'SetFAttr( "setfattr.txt" )                        ', SetFAttr( "setfattr.txt" ), 0 )
   Check( 'BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ) ', BitAnd( FileAttr( "setfattr.txt" ), FA_READONLY ), 0 )
   Check( 'SetFAttr( "no-such-file.txt" )                    ', SetFAttr( "no-such-file.txt" ), -2 )
   Check( 'FErase( "setfattr.txt" )                          ', FErase( "setfattr.txt" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
