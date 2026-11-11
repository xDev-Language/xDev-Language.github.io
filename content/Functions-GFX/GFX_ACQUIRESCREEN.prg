/*
 * $DOC$
 * $NAME$
 * GFX_ACQUIRESCREEN
 *
 * $ONELINER$
 * Start a group of drawing operations that is shown at once
 *
 * $SYNTAX$
 * GfxPrimitive( GFX_ACQUIRESCREEN ) --> nResult
 *
 * $ARGUMENTS$
 * `GFX_ACQUIRESCREEN` The operation, from gfxdef.ch. It takes no other arguments.
 *
 * $RETURNS$
 * 1, or 0 on a terminal without graphics.
 *
 * $DESCRIPTION$
 * GFX_ACQUIRESCREEN prepares the window for drawing and holds back the update of the screen
 * until the matching GFX_RELEASESCREEN. All pixels and text drawn in between appear together,
 * so an animation does not flicker and a picture is never seen half drawn. It works like
 * DispBegin() and also holds back text output.
 *
 * The pairs can be nested. A counter is increased by every GFX_ACQUIRESCREEN and decreased by
 * every GFX_RELEASESCREEN, and the screen is updated when it falls back to 0.
 *
 * $NOTES$
 * Drawing also works without GFX_ACQUIRESCREEN, but then every operation can be shown on its
 * own. Every GFX_ACQUIRESCREEN must have its GFX_RELEASESCREEN, also on an early RETURN.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $IMAGE$
 * GFX_ACQUIRESCREEN.png
 *
 * $CATEGORY$
 * Functions GFX
 *
 * $HEADER$
 * gfxdef.ch
 *
 * $SEEALSO$
 * GFX_RELEASESCREEN, GfxPrimitive(), DispBegin(), DispEnd()
 *
 * $DOCEND$
 */

#include "gfxdef.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

#define RADIUS 20

PROCEDURE Main()

   LOCAL nHeight := GtInfo( GTI_SCREENHEIGHT )
   LOCAL nWidth  := GtInfo( GTI_SCREENWIDTH )
   LOCAL nTop    := 3 * GtInfo( GTI_FONTSIZE )
   LOCAL nRow    := nTop + RADIUS
   LOCAL nCol    := RADIUS
   LOCAL nStepV  := 3
   LOCAL nStepH  := 4
   LOCAL nFrame

   Scroll()
   SetPos( 0, 0 )

   DispOutAt( 0, 0, "A ball drawn again in every frame, without flicker" )
   DispOutAt( 1, 0, "Any key ends the program" )

   FOR nFrame := 1 TO 1000
      // Background and ball of one frame appear together
      Check( GfxPrimitive( GFX_ACQUIRESCREEN ) )
      GfxPrimitive( GFX_FILLEDRECT, nTop, 0, nHeight - 1, nWidth - 1, 0x102030 )
      GfxPrimitive( GFX_FILLEDCIRCLE, nRow, nCol, RADIUS, 0xFF6020 )
      GfxPrimitive( GFX_RELEASESCREEN )

      IF nRow + nStepV < nTop + RADIUS .OR. nRow + nStepV > nHeight - 1 - RADIUS
         nStepV := -nStepV
      ENDIF
      IF nCol + nStepH < RADIUS .OR. nCol + nStepH > nWidth - 1 - RADIUS
         nStepH := -nStepH
      ENDIF
      nRow += nStepV
      nCol += nStepH

      IF Inkey( 0.02 ) != 0
         EXIT
      ENDIF
   NEXT

RETURN

STATIC PROCEDURE Check( nResult )

   IF nResult != 1
      DispOutAt( 1, 40, "GFX_ACQUIRESCREEN: ERROR" )
   ENDIF

RETURN
