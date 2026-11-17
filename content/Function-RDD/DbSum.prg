/*
 * $DOC$
 * $NAME$
 * DbSum()
 *
 * $ONELINER$
 * Sum an expression over a record scope
 *
 * $SYNTAX$
 * DbSum( bExpression, [bFor], [bWhile], [nNext], [nRecord], [lRest] ) --> nSum
 *
 * $ARGUMENTS$
 * `bExpression` Numeric expression block. Remaining arguments define the scope.
 *
 * $RETURNS$
 * The sum of expression values in the selected records.
 *
 * $DESCRIPTION$
 * DbSum() evaluates bExpression for records in the current work area and adds
 * the numeric results.
 *
 * $NOTES$
 * An empty scope returns zero.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * DbAverage(), DbCount(), DbTotal()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "sales.dbf", "Sales" )
   QOut( "Sum: " + LTrim( Str( DbSum( {|| FIELD->AMOUNT } ) ) ) )
   DbCloseArea()

RETURN
