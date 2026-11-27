/*
 * $DOC$
 * $NAME$
 * NationMsg()
 *
 * $ONELINER$
 * Return a message of the national language
 *
 * $SYNTAX$
 * NationMsg( nMessage ) --> cMessage
 *
 * $ARGUMENTS$
 * `nMessage` The number of the message, from 1 to 13.
 *
 * $RETURNS$
 * The message, "" for another number. Without the argument: "Invalid argument".
 *
 * $DESCRIPTION$
 * The messages are the texts of the classic xBase reports, lists and input fields:
 *
 * | Number | Message |
 * |---|---|
 * | 1 | Database Files    # Records    Last Update     Size |
 * | 2 | Do you want more samples? |
 * | 3 | Page No. |
 * | 4 | ** Subtotal ** |
 * | 5 | * Subsubtotal * |
 * | 6 | *** Total *** |
 * | 7 | Ins |
 * | 8 | three spaces, the place of "Ins" |
 * | 9 | Invalid date |
 * | 10 | Range: |
 * | 11 | " - " |
 * | 12 | Y/N |
 * | 13 | INVALID EXPRESSION |
 *
 * $NOTES$
 * xDev has the English messages. IsAffirm() and IsNegative() use message 12.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * NationMsg( 12 )                  OK
 * NationMsg( 9 )                   OK
 * NationMsg( 14 )                  OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * IsAffirm(), IsNegative()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   Check( 'NationMsg( 12 )                  ', NationMsg( 12 ), "Y/N" )
   Check( 'NationMsg( 9 )                   ', NationMsg( 9 ), "Invalid date" )
   Check( 'NationMsg( 14 )                  ', NationMsg( 14 ), "" )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
