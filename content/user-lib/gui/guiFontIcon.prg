/*
 * $DOC$
 * $NAME$
 * guiFontIcon
 *
 * $ONELINER$
 * Describe a control picture taken from an icon font
 *
 * $SYNTAX$
 * guiFontIcon():New( cFile, nCode, [nColor], [nSize] ) --> oFontIcon
 * guiFontIcon() --> oFontIconClass
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
 * Class members declared by `guiFontIcon`:
 *
 * - Instance variables: `file` (read/write), `code` (read/write), `color` (read/write), `size`
 *   (read/write)
 * - Properties: none
 * - Methods: `New()`
 *
 * The object describes character `nCode` of the font file `cFile` as a square picture. `nColor` is 0xRRGGBB; NIL keeps the system text color. The default size is 24 pixels. Pass the object where the sidebar accepts a bitmap.
 *
 * The exported properties are `file`, `code`, `color` and `size`. A color of -1 means the system text color.
 *
 * $NOTES$
 * guiFontIcon is part of the `gui` user library for Windows.
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
 * guiSidebar, guiToolbar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oFontIcon := guiFontIcon():New( "icons.ttf", 0xE8B6, 0x336699, 24 )

   QOut( oFontIcon:file )

RETURN

