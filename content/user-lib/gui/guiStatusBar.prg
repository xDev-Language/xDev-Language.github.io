/*
 * $DOC$
 * $NAME$
 * guiStatusBar
 *
 * $ONELINER$
 * Show status information at the bottom of a window
 *
 * $SYNTAX$
 * guiStatusBar():New( oWindow, [cText] ) --> oStatusBar
 * oStatusBar:Add( [nWidth], [cText], [lRaised] ) --> nPanel
 * oStatusBar:SetText( nPanel, cText ) --> oStatusBar
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
 * Class members declared by `guiStatusBar`:
 *
 * - Instance variables: none
 * - Properties: `scoreboard` (read/write), `foreground` (read/write), `background` (read/write)
 * - Methods: `New()`, `Add()`, `SetText()`
 *
 * Inherited from `guiControl`:
 *
 * - Instance variables: `handle` (read-only), `parent` (read-only), `name` (read/write)
 * - Properties: `focused` (read-only), `font` (read/write), `text` (read/write), `value`
 *   (read/write), `x` (read/write), `y` (read/write), `width` (read/write), `height`
 *   (read/write), `toolTip` (read/write), `contextMenu` (read/write), `visible` (read/write),
 *   `enabled` (read/write), `anchor` (read/write)
 * - Methods: `SetFocus()`, `Destroy()`
 *
 * The bar follows the width of its window. Add() appends a panel and returns its 1-based number. A panel with width 0 shares the room left by fixed-width panels. SetText() changes one panel.
 *
 * `scoreboard` selects a panel that shows `Ins` during ReadModal() while insert mode is active; 0 disables it. `foreground` and `background` set colors. `text` is the text used before panels are added.
 *
 * $NOTES$
 * guiStatusBar is part of the `gui` user library for Windows.
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
 * guiWindow, guiToolbar, guiControl
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := guiWindow():New( "Status bar", 480, 220 )
   LOCAL oStatus := guiStatusBar():New( oWindow, "Ready" )

   oStatus:Add( 0, "Ready" )
   oStatus:Add( 100, "UTF-8" )
   guiApplication():Run( oWindow )

RETURN

