/*
 * $DOC$
 * $NAME$
 * GTI_INKEYREAD
 *
 * $ONELINER$
 * Query or change a block that supplies keys
 *
 * $SYNTAX$
 * GtInfo( GTI_INKEYREAD, [bRead] ) --> bPrevious
 *
 * $ARGUMENTS$
 * `GTI_INKEYREAD` The selector, from gtinfo.ch.
 * `bRead` A block without arguments that returns a key code or 0. NIL removes the block.
 *
 * $RETURNS$
 * The block set before the call, or NIL.
 *
 * $DESCRIPTION$
 * Inkey() evaluates the block before it reads the keyboard. A result other than 0 is returned as
 * the key, so the block can feed keys from another source.
 *
 * $NOTES$
 * Handled by the terminal layer, so it works with every GT driver.
 *
 * Feed a repeatable sequence into a menu loop without requiring live keyboard input.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Selected action: Export
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GTI_INKEYFILTER, Inkey()
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

   LOCAL aKeys := { K_DOWN, K_DOWN, K_ENTER }
   LOCAL nNext := 0
   LOCAL bSaved := GtInfo( GTI_INKEYREAD, {|| s_NextKey( aKeys, @nNext ) } )
   LOCAL aActions := { "Open", "Preview", "Export" }
   LOCAL nActive := 1
   LOCAL nKey, nStep

   FOR nStep := 1 TO Len( aKeys )
      nKey := Inkey( 1, INKEY_KEYBOARD )
      DO CASE
      CASE nKey == K_DOWN
         nActive := Min( nActive + 1, Len( aActions ) )
      CASE nKey == K_ENTER
         EXIT
      ENDCASE
   NEXT
   GtInfo( GTI_INKEYREAD, bSaved )

   OutStd( "Selected action: " + aActions[ nActive ], Eol() )

RETURN

STATIC FUNCTION s_NextKey( aKeys, nNext )

   nNext++

   IF nNext <= Len( aKeys )
      RETURN aKeys[ nNext ]
   ENDIF

RETURN 0
