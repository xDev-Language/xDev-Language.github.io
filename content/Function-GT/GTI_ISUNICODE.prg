/*
 * $DOC$
 * $NAME$
 * GTI_ISUNICODE
 *
 * $ONELINER$
 * Tell whether the terminal works with Unicode
 *
 * $SYNTAX$
 * GtInfo( GTI_ISUNICODE ) --> lUnicode
 *
 * $ARGUMENTS$
 * `GTI_ISUNICODE` The selector, from gtinfo.ch.
 *
 * $RETURNS$
 * .T. for all xDev graphics drivers.
 *
 * $DESCRIPTION$
 * The screen and the keyboard use Unicode characters, and the program exchanges them as UTF-8.
 *
 * $NOTES$
 * Supported by GTWVT, GTSDL3, GTXWC and GTGLFW. On other terminals the result is NIL.
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
 * GtInfo()
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lUnicode := GtInfo( GTI_ISUNICODE ) == .T.

   IF lUnicode
      DispOutAt( 1, 2, "UTF-8 sample: Zażółć gęślą jaźń" )
   ELSE
      DispOutAt( 1, 2, "ASCII sample: terminal output" )
   ENDIF
   Inkey( 3 )

RETURN
