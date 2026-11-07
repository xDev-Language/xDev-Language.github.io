/*
 * $DOC$
 * $NAME$
 * DiskUsed()
 *
 * $ONELINER$
 * Return the used storage space of a disk drive in bytes
 *
 * $SYNTAX$
 * DiskUsed( [cDrive] ) --> nUsedDiskSpace
 *
 * $ARGUMENTS$
 * cDrive
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

   Check( 'DiskUsed() > 0            ', DiskUsed() > 0, .T. )
   Check( 'DiskUsed() <= DiskTotal() ', DiskUsed() <= DiskTotal(), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
