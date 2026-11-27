/*
 * $DOC$
 * $NAME$
 * SetLastKey()
 *
 * $ONELINER$
 * Change the value returned by LastKey()
 *
 * $SYNTAX$
 * SetLastKey( nKey ) --> cNull
 *
 * $ARGUMENTS$
 * `nKey` The key code that LastKey() returns from now on.
 *
 * $RETURNS$
 * Always "".
 *
 * $DESCRIPTION$
 * SetLastKey() sets LastKey() without a key press. Use it to save LastKey() before code that reads
 * keys, for example an error handler, and to restore it afterwards.
 *
 * $NOTES$
 * The keyboard buffer does not change: Inkey() and NextKey() are not affected.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * SetLastKey( K_ESC ) gives ""     OK
 * LastKey() after SetLastKey()     OK
 * LastKey() restored               OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * LastKey(), Inkey()
 *
 * $DOCEND$
 */

#include "inkey.ch"

PROCEDURE Main()

   LOCAL nSaved := LastKey()

   Check( 'SetLastKey( K_ESC ) gives ""     ', SetLastKey( K_ESC ), "" )
   Check( 'LastKey() after SetLastKey()     ', LastKey(), K_ESC )

   SetLastKey( nSaved )
   Check( 'LastKey() restored               ', LastKey(), nSaved )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
