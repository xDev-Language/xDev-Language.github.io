/*
 * $DOC$
 * $NAME$
 * SAY
 *
 * $ONELINER$
 * @...SAY Display data at a specified screen or printer row and column
 *
 * $SYNTAX$
 * @ nRow, nCol
 *    SAY exp [PICTURE cSayPicture]
 *    [COLOR cColorString]
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Commands
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   LOCAL cCustomer := "Northwind Supply"

   LOCAL nBalance := 1825.75

   @ 2, 5 SAY "Account review" COLOR "W+/B"

   @ 4, 5 SAY "Customer:"; @ 4, 16 SAY cCustomer

   @ 5, 5 SAY "Balance:"; @ 5, 16 SAY nBalance PICTURE "999,999.99"

   RETURN
