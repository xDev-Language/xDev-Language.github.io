/*
 * $DOC$
 * $NAME$
 * IsDisk()
 *
 * $ONELINER$
 * Test whether a drive letter is a drive of the system
 *
 * $SYNTAX$
 * IsDisk( cDrive ) --> lDriveExists
 *
 * $ARGUMENTS$
 * `cDrive` A drive letter, with or without ":", for example "C" or "d:".
 *
 * $RETURNS$
 * .T. when Windows has the drive. Always .F. on Linux, which has no drives.
 *
 * $DESCRIPTION$
 * IsDisk() tells whether a drive letter is in use, for example before the program offers a drive
 * for a backup.
 *
 * $NOTES$
 * A drive that exists may still be empty, for example a card reader without a card.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IsDisk( "C" ) on Windows         OK
 * a digit is not a drive           OK
 * an empty text gives .F.          OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DiskName(), DiskChange(), DirExists()
 *
 * $DOCEND$
 */

PROCEDURE Main()

#if OS_WINDOWS
   Check( 'IsDisk( "C" ) on Windows         ', IsDisk( "C" ), .T. )
#else
   Check( 'IsDisk( "C" ) on Linux           ', IsDisk( "C" ), .F. )
#endif

   Check( 'a digit is not a drive           ', IsDisk( "1" ), .F. )
   Check( 'an empty text gives .F.          ', IsDisk( "" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
