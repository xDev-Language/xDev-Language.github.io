/*
 * $DOC$
 * $NAME$
 * Default()
 *
 * $ONELINER$
 * Give a variable a default value when it holds NIL
 *
 * $SYNTAX$
 * Default( @xVariable, xDefault ) --> NIL
 *
 * $ARGUMENTS$
 * `@xVariable` A variable passed by reference, usually a parameter of a function.
 *
 * `xDefault` The value for the variable when it holds NIL.
 *
 * $RETURNS$
 * NIL.
 *
 * $DESCRIPTION$
 * Default() fills in optional parameters at the start of a function:
 *
 * FUNCTION Report( cTitle, nCopies )
 *    Default( @cTitle, "Report" )
 *    Default( @nCopies, 1 )
 *
 * A variable that holds any other value, also "" or 0, keeps it.
 *
 * $NOTES$
 * DefaultValue( xValue, xDefault ) returns the value instead of changing a variable.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NIL gets the default             OK
 * a value stays                    OK
 * an empty text stays              OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DefaultValue()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nCopies, cTitle := "Sales", cNote := ""

   Default( @nCopies, 1 )
   Default( @cTitle, "Report" )
   Default( @cNote, "none" )

   Check( 'NIL gets the default             ', nCopies, 1 )
   Check( 'a value stays                    ', cTitle, "Sales" )
   Check( 'an empty text stays              ', cNote, "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
