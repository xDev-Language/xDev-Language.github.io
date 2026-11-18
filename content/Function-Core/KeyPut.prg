/*
 * $DOC$
 * $NAME$
 * KeyPut()
 *
 * $ONELINER$
 * Put keys at the end of the keyboard buffer
 *
 * $SYNTAX$
 * KeyPut( nInkeyCode | cText | aKeys ) --> NIL
 *
 * $ARGUMENTS$
 * `nInkeyCode` One key code, for example K_ENTER.
 *
 * `cText` A text in UTF-8; each character becomes one key.
 *
 * `aKeys` An array of key codes and texts.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * KeyPut() adds keys after the keys that are already waiting. Inkey() then reads them in this
 * order.
 *
 * $NOTES$
 * KeyPut() needs a GT. KEYBOARD first empties the buffer; KeyPut() keeps the waiting keys.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * the key code comes first         OK
 * then the text                    OK
 * then the array                   OK
 * the buffer is empty              OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Inkey(), NextKey(), SetLastKey()
 *
 * $DOCEND$
 */

#include "inkey.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL nFirst, cText, nLast

   Scroll()
   SetPos( 0, 0 )

   KeyPut( K_F1 )
   KeyPut( "ab" )
   KeyPut( { K_ENTER } )

   nFirst := Inkey()
   cText := Chr( Inkey() ) + Chr( Inkey() )
   nLast := Inkey()

   Check( 'the key code comes first         ', nFirst, K_F1 )
   Check( 'then the text                    ', cText, "ab" )
   Check( 'then the array                   ', nLast, K_ENTER )
   Check( 'the buffer is empty              ', NextKey(), 0 )

   QOut( "" )
   QOut( "Any key or 10 seconds ends the program" )
   Inkey( 10 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
