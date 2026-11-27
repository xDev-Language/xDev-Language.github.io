/*
 * $DOC$
 * $NAME$
 * IsNegative()
 *
 * $ONELINER$
 * Test whether an answer means "no"
 *
 * $SYNTAX$
 * IsNegative( cAnswer ) --> lIsNo
 *
 * $ARGUMENTS$
 * `cAnswer` The answer of the user, for example a key or a word.
 *
 * $RETURNS$
 * .T. when the answer starts with the letter of "no" of NationMsg( 12 ), "N", in upper or lower
 * case.
 *
 * $DESCRIPTION$
 * IsNegative() is the counterpart of IsAffirm(). An answer that is neither "yes" nor "no" gives
 * .F. in both.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IsNegative( "No" )               OK
 * IsNegative( "n" )                OK
 * IsNegative( "y" )                OK
 * "x" is neither yes nor no        OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IsAffirm(), NationMsg()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'IsNegative( "No" )               ', IsNegative( "No" ), .T. )
   Check( 'IsNegative( "n" )                ', IsNegative( "n" ), .T. )
   Check( 'IsNegative( "y" )                ', IsNegative( "y" ), .F. )
   Check( '"x" is neither yes nor no        ', IsNegative( "x" ) .OR. IsAffirm( "x" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
