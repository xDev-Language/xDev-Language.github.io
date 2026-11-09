/*
 * $DOC$
 * $NAME$
 * NumToken()
 *
 * $ONELINER$
 * Return the number of tokens in a string
 *
 * $SYNTAX$
 * NumToken( cString, [cDelimiter], [nSkipWidth] ) --> nCount
 *
 * $ARGUMENTS$
 * cString
 * cDelimiter
 * nSkipWidth
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
 * NumToken( "Good Morning!" )                       OK
 * NumToken( "Yes!  That is it. Maybe not?", ".!?" ) OK
 * NumToken( cString, "," )                          OK
 * NumToken( cString, ",", 1 )                       OK
 * NumToken( "" )                                    OK
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

   LOCAL cString := "one,two,,four"

   Check( 'NumToken( "Good Morning!" )                       ', NumToken( "Good Morning!" ), 2 )
   Check( 'NumToken( "Yes!  That is it. Maybe not?", ".!?" ) ', NumToken( "Yes!  That is it. Maybe not?", ".!?" ), 3 )
   Check( 'NumToken( cString, "," )                          ', NumToken( cString, "," ), 3 )
   Check( 'NumToken( cString, ",", 1 )                       ', NumToken( cString, ",", 1 ), 4 )
   Check( 'NumToken( "" )                                    ', NumToken( "" ), 0 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
