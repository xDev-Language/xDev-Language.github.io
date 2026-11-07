/*
 * $DOC$
 * $NAME$
 * AltD()
 *
 * $ONELINER$
 * Invoke the xDev debugger
 *
 * $SYNTAX$
 * AltD( [nAction] ) --> NIL
 *
 * $ARGUMENTS$
 * nAction
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
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'AltD()     ', AltD(), NIL )
   Check( 'AltD( 1 )  ', AltD( 1 ), NIL )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
