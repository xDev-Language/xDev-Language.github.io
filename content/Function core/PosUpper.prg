/*
 * $DOC$
 * $NAME$
 * PosUpper()
 *
 * $ONELINER$
 * Return the position of the first upper case letter in a character string
 *
 * $SYNTAX$
 * PosUpper( cString, [lNoUpper], [nSkipChars] ) --> nPos
 *
 * $ARGUMENTS$
 * cString
 * lNoUpper
 * nSkipChars
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
 * PosUpper( cName )          OK
 * PosUpper( cName, .T. )     OK
 * PosUpper( cName, .F., 3 )  OK
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

   LOCAL cName := "mcDonald"

   Check( 'PosUpper( cName )          ', PosUpper( cName ), 3 )
   Check( 'PosUpper( cName, .T. )     ', PosUpper( cName, .T. ), 1 )
   Check( 'PosUpper( cName, .F., 3 )  ', PosUpper( cName, .F., 3 ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
