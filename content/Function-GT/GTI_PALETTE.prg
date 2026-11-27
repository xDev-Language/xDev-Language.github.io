/*
 * $DOC$
 * $NAME$
 * GTI_PALETTE
 *
 * $ONELINER$
 * Query or change the 16 colors of the text
 *
 * $SYNTAX$
 * GtInfo( GTI_PALETTE, [aColors] ) --> aColors
 * GtInfo( GTI_PALETTE, nIndex, [nColor] ) --> nColor
 *
 * $ARGUMENTS$
 * `GTI_PALETTE` The selector, from gtinfo.ch.
 * `aColors` An array of 16 new colors.
 * `nIndex` The number of one color from 0 to 15.
 * `nColor` The new value of this color.
 *
 * $RETURNS$
 * The colors before the call, all 16 as an array or the one selected by nIndex.
 *
 * $DESCRIPTION$
 * The 16 colors are the colors of color strings such as "W+/B": 0 is N, 1 is B, up to 15 for W+.
 * A color value is 0xBBGGRR, with red in the lowest byte, unlike the 0xRRGGBB colors of
 * GfxPrimitive(). Text already on the screen takes the new colors at once.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
 *
 * Recolor an existing status banner through a palette entry, then restore its original color.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * SetColor(), GfxPrimitive()
 *
 * $DOCEND$
 */

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nSaved := GtInfo( GTI_PALETTE, 1 )
   LOCAL aColors := { 0x703818, 0x355018, 0x401C60 }
   LOCAL nTheme := 1
   LOCAL nKey

   IF ValType( nSaved ) != "N"
      OutStd( "Palette controls unavailable.", Eol() )
      RETURN
   ENDIF

   DispOutAt( 1, 2, " Status: connected ", "W+/B" )
   DispOutAt( 3, 2, "Space changes the color of the existing banner. Esc exits." )
   DO WHILE .T.
      GtInfo( GTI_PALETTE, 1, aColors[ nTheme ] )
      nKey := Inkey( 10, INKEY_KEYBOARD )
      IF nKey != K_SPACE
         EXIT
      ENDIF
      nTheme := nTheme % Len( aColors ) + 1
   ENDDO
   GtInfo( GTI_PALETTE, 1, nSaved )

RETURN
