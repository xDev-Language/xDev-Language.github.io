/*
 * $DOC$
 * $NAME$
 * Member access (: and ::)
 *
 * $ONELINER$
 * Send a message to an object or access a data member.
 *
 * $SYNTAX$
 * object:message( arguments )
 * object:data
 * ::member
 *
 * $DESCRIPTION$
 * Send a message to an object or access a data member. Inside a method, :: uses the current object as the receiver.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

CREATE CLASS ParcelBox
   DATA space INIT 10
   METHOD Pack( nLoad )
ENDCLASS

METHOD Pack( nLoad ) CLASS ParcelBox

   IF nLoad > ::space
      RETURN .F.
   ENDIF
   ::space -= nLoad

   RETURN .T.

PROCEDURE Main()

   LOCAL oBox := ParcelBox()
   LOCAL nLoad

   FOR EACH nLoad IN { 6, 5, 4 }
      IF oBox:Pack( nLoad )
         QOut( "Packed", nLoad, "space left", oBox:space )
      ELSE
         QOut( "Needs another box", nLoad )
      ENDIF
   NEXT

   RETURN
