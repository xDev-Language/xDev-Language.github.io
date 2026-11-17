/*
 * $DOC$
 * $NAME$
 * gui_Font
 *
 * $ONELINER$
 * Describe the font used by a GUI control
 *
 * $SYNTAX$
 * gui_Font():New( [nSize], [lBold], [lItalic], [cName] ) --> oFont
 * gui_Font() --> oFontClass
 *
 * $ARGUMENTS$
 * `nSize` Font size in points. NIL or 0 uses the system size.
 * `lBold` Bold style. The default is `.F.`.
 * `lItalic` Italic style. The default is `.F.`.
 * `cName` Font family name. NIL or an empty string uses the system font.
 *
 * $RETURNS$
 * `gui_Font():New()` returns a font object. `gui_Font()` returns the class object.
 *
 * $DESCRIPTION$
 * A gui_Font object stores the four properties used to create a control font:
 * `size`, `bold`, `italic` and `name`. The object does not draw text by itself.
 * Assign it to a GUI control's `font` property to give that control its own
 * font. The same font object can be assigned to several controls.
 *
 * When a control receives the object, the GUI library creates the native font
 * for the scale of that control's window. A size of 0 and an empty name mean
 * the system size and system font. Assigning NIL to a control's `font`
 * property restores the system font for that control.
 *
 * The constructor validates the values. nSize, when supplied, must be positive;
 * lBold and lItalic must be logical values; cName must be text. Invalid values
 * raise a GUI runtime error. Changing the object's properties affects controls
 * the next time they create or refresh their native font.
 *
 * $NOTES$
 * The font is measured in points, not pixels. The selected font family must be
 * available to the operating system. `gui_Font` is part of the `gui` user library.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Font: Segoe UI, 14 pt, bold
 * Label font: Segoe UI, 14 pt
 *
 * $CATEGORY$
 * User libraries GUI
 *
 * $HEADER$
 *
 * $SEEALSO$
 * gui_Window, gui_Label, gui_Edit, gui_Browse
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oWindow := gui_Window():New( "Font example", 420, 180 )
   LOCAL oFont   := gui_Font():New( 14, .T., .F., "Segoe UI" )
   LOCAL oLabel  := gui_Label():New( oWindow, 20, 25, 360, 30, "Font assigned to a label" )

   oLabel:font := oFont

   QOut( "Font: " + oFont:name + ", " + LTrim( Str( oFont:size ) ) + " pt, " + ;
      IIF( oFont:bold, "bold", "regular" ) )
   QOut( "Label font: " + oLabel:font:name + ", " + LTrim( Str( oLabel:font:size ) ) + " pt" )

   oWindow:Close()

RETURN
