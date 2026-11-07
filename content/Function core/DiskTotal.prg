/*
 * $DOC$
 * $NAME$
 * DiskTotal()
 *
 * $ONELINER$
 * Return the total storage space of a disk drive in bytes
 *
 * $SYNTAX$
 * DiskTotal( [cDrive] ) --> nTotalBytes
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

   Check( 'DiskTotal() > 0           ', DiskTotal() > 0, .T. )
   Check( 'DiskTotal() >= DiskUsed() ', DiskTotal() >= DiskUsed(), .T. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
