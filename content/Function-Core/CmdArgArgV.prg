/*
 * $DOC$
 * $NAME$
 * CmdArgArgV()
 *
 * $ONELINER$
 * Return the program name as it was started
 *
 * $SYNTAX$
 * CmdArgArgV( ) --> cProgram
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The first word of the command line: the program as the user or the system started it.
 *
 * $DESCRIPTION$
 * CmdArgArgV() is the same as ArgV( 0 ). The text may be a name without a directory, for example
 * "report", or a full path. ExeName() always gives the full path of the program file.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * CmdArgArgV() is ArgV( 0 )        OK
 * CmdArgArgV() is not empty        OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ArgV(), ArgC(), ExeName()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'CmdArgArgV() is ArgV( 0 )        ', CmdArgArgV(), ArgV( 0 ) )
   Check( 'CmdArgArgV() is not empty        ', Empty( CmdArgArgV() ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
