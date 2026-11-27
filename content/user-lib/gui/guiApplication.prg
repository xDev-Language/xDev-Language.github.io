/*
 * $DOC$
 * $NAME$
 * guiApplication
 *
 * $ONELINER$
 * Run the message loop of a GUI program
 *
 * $SYNTAX$
 * guiApplication():Run( oWindow ) --> .T.
 * guiApplication() --> oApplicationClass
 *
 * $ARGUMENTS$
 * Arguments are described by the signatures above. Positions and sizes are
 * logical pixels. Optional arguments in brackets use the defaults described
 * below.
 *
 * $RETURNS$
 * Constructors return the new object unless the syntax states otherwise.
 * Methods returning the object may be chained.
 *
 * $DESCRIPTION$
 * Class members declared by `guiApplication`:
 *
 * - Instance variables: none
 * - Properties: none
 * - Methods: `Run()`
 *
 * Run() shows the main window and processes window, control and timer events until that window closes. An error raised by an event is passed back to the application after event processing ends.
 *
 * Call Run() once after the main window and its controls have been created.
 *
 * $NOTES$
 * guiApplication is part of the `gui` user library for Windows.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * User libraries GUI
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GUI, guiWindow, guiTimer
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Application", 420, 180 )

   guiLabel():New( oWindow, 20, 30, 380, 25, "The message loop is running." )
   guiApplication():Run( oWindow )

RETURN

