/*
 * $DOC$
 * $NAME$
 * guiTimer
 *
 * $ONELINER$
 * Run an action at a regular interval
 *
 * $SYNTAX$
 * guiTimer():New( oWindow, nInterval, [bAction] ) --> oTimer
 * oTimer:Start() --> oTimer
 * oTimer:Stop() --> oTimer
 * oTimer:active --> lActive
 * oTimer:interval --> nInterval
 * oTimer:interval := nInterval
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
 * Class members declared by `guiTimer`:
 *
 * - Instance variables: `onTimer` (read/write), `parent` (read-only), `intervalMs` (internal),
 *   `timerId` (internal)
 * - Properties: `active` (read-only), `interval` (read/write)
 * - Methods: `New()`, `Start()`, `Stop()`
 *
 * The constructor creates a stopped timer owned by a window. Its action receives the timer every `nInterval` milliseconds. Start() begins the ticks and Stop() ends them. A running timer stays alive until it stops or its window closes.
 *
 * `onTimer` is the action block. `active` reports whether it is running. Changing `interval` restarts a running timer with the new positive interval.
 *
 * $NOTES$
 * guiTimer is part of the `gui` user library for Windows.
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
 * guiApplication, guiWindow
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Timer", 360, 150 )
   LOCAL oLabel := guiLabel():New( oWindow, 30, 45, 300, 25, Time() )
   LOCAL oTimer := guiTimer():New( oWindow, 1000, {|| oLabel:text := Time() } )

   oTimer:Start()
   guiApplication():Run( oWindow )

RETURN

