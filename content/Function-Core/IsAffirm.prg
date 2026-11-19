/*
 * $DOC$
 * $NAME$
 * IsAffirm()
 *
 * $ONELINER$
 * Test whether an answer means "yes"
 *
 * $SYNTAX$
 * IsAffirm( cAnswer ) --> lIsYes
 *
 * $ARGUMENTS$
 * `cAnswer` The answer of the user, for example a key or a word.
 *
 * $RETURNS$
 * .T. when the answer starts with the letter of "yes" of NationMsg( 12 ), "Y", in upper or lower
 * case.
 *
 * $DESCRIPTION$
 * IsAffirm() reads the "yes" letter from the national messages, so a program asks with
 * NationMsg( 12 ) and tests the answer without writing "Y" itself.
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * IsAffirm( "y" )                  OK
 * IsAffirm( "Yes" )                OK
 * IsAffirm( "n" )                  OK
 * IsAffirm( "" )                   OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IsNegative(), NationMsg()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'IsAffirm( "y" )                  ', IsAffirm( "y" ), .T. )
   Check( 'IsAffirm( "Yes" )                ', IsAffirm( "Yes" ), .T. )
   Check( 'IsAffirm( "n" )                  ', IsAffirm( "n" ), .F. )
   Check( 'IsAffirm( "" )                   ', IsAffirm( "" ), .F. )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
