/*
 * $DOC$
 * $NAME$
 * CSetCent()
 *
 * $ONELINER$
 * Query or change the SET CENTURY setting
 *
 * $SYNTAX$
 * CSetCent( [lNewMode] ) --> lOldMode
 *
 * $ARGUMENTS$
 * `lNewMode` .T. shows the year of a date with four digits, .F. with two. Without the argument the
 * setting does not change.
 *
 * $RETURNS$
 * The setting before the call.
 *
 * $DESCRIPTION$
 * CSetCent() is the function form of SET CENTURY. It changes how DToC() and the other date
 * functions show the year.
 *
 * $NOTES$
 * CSetCent() and SetCentury() change the same setting.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * CSetCent( .T. ) gives old value  OK
 * four digits of the year          OK
 * CSetCent( .F. ) gives .T.        OK
 * two digits of the year           OK
 *
 * $CATEGORY$
 * Functions CT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * SetCentury(), DToC(), Set()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL lOld := CSetCent()

   Check( 'CSetCent( .T. ) gives old value  ', CSetCent( .T. ), lOld )
   Check( 'four digits of the year          ', Right( DToC( SToD( "20261118" ) ), 4 ), "2026" )
   Check( 'CSetCent( .F. ) gives .T.        ', CSetCent( .F. ), .T. )
   Check( 'two digits of the year           ', Right( DToC( SToD( "20261118" ) ), 3 ), "/26" )

   CSetCent( lOld )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
