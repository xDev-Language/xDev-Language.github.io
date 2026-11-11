/*
 * $DOC$
 * $NAME$
 * AFields()
 *
 * $ONELINER$
 * Fill arrays with the structure of the current database file
 *
 * $SYNTAX$
 * AFields( [aFieldNames], [aTypes], [aWidths], [aDecimals] ) --> nFields
 *
 * $ARGUMENTS$
 * aFieldNames
 * aTypes
 * aWidths
 * aDecimals
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

   LOCAL aNames    := Array( 3 )
   LOCAL aTypes    := Array( 3 )
   LOCAL aWidths   := Array( 3 )
   LOCAL aDecimals := Array( 3 )

   DbCreate( "people.dbf", { { "NAME", "C", 20, 0 }, { "BORN", "D", 8, 0 }, { "SALARY", "N", 10, 2 } } )

   USE people NEW

   Check( 'AFields( aNames, aTypes, aWidths, aDecimals ) ', AFields( aNames, aTypes, aWidths, aDecimals ), 3 )
   Check( 'aNames[ 1 ]                                   ', aNames[ 1 ], "NAME" )
   Check( 'aTypes[ 2 ]                                   ', aTypes[ 2 ], "D" )
   Check( 'aWidths[ 3 ]                                  ', aWidths[ 3 ], 10 )
   Check( 'aDecimals[ 3 ]                                ', aDecimals[ 3 ], 2 )

   CLOSE people
   FErase( "people.dbf" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
