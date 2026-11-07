/*
 * $DOC$
 * $NAME$
 * AAdd()
 *
 * $ONELINER$
 * Add a new element to the end of an array
 *
 * $SYNTAX$
 * AAdd( aTarget, expValue ) --> Value
 *
 * $ARGUMENTS$
 * aTarget
 * expValue
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

   LOCAL aShopping := {}

   AAdd( aShopping, "bread" )
   AAdd( aShopping, "milk" )

   Check( 'Len( aShopping )            ', Len( aShopping ), 2 )
   Check( 'aShopping[ 2 ]              ', aShopping[ 2 ], "milk" )
   Check( 'AAdd( aShopping, "eggs" )   ', AAdd( aShopping, "eggs" ), "eggs" )
   Check( 'ATail( aShopping )          ', ATail( aShopping ), "eggs" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
