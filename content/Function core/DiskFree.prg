/*
 * $DOC$
 * $NAME$
 * DiskFree()
 *
 * $ONELINER$
 * Return the free storage space of a disk drive in bytes
 *
 * $SYNTAX$
 * DiskFree( [cDrive] ) --> nFreeDiskSpace
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

   Check( 'DiskFree() > 0                  ', DiskFree() > 0, .T. )
   Check( 'DiskFree() <= DiskTotal()       ', DiskFree() <= DiskTotal(), .T. )
   Check( 'DiskFree( "no-such-directory" ) ', DiskFree( "no-such-directory" ), -1 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
