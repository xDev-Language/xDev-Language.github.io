/*
 * $DOC$
 * $NAME$
 * FileDelete()
 *
 * $ONELINER$
 * Delete files specified by a file mask and file attributes
 *
 * $SYNTAX$
 * FileDelete( cFileMask, [nAttributes] ) --> lDeleted
 *
 * $ARGUMENTS$
 * cFileMask
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
 * FileDelete( "fd*.tmp" )                  OK
 * File( "fd1.tmp" ) .OR. File( "fd2.tmp" ) OK
 * FileDelete( "fd*.tmp" )                  OK
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL lFirst  := MemoWrit( "fd1.tmp", "1", .F. )
   LOCAL lSecond := MemoWrit( "fd2.tmp", "2", .F. )

   Check( 'FileDelete( "fd*.tmp" )                  ', FileDelete( "fd*.tmp" ), .T. )
   Check( 'File( "fd1.tmp" ) .OR. File( "fd2.tmp" ) ', File( "fd1.tmp" ) .OR. File( "fd2.tmp" ), .F. )
   Check( 'FileDelete( "fd*.tmp" )                  ', FileDelete( "fd*.tmp" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
