/*
 * $DOC$
 * $NAME$
 * json_Error()
 *
 * $ONELINER$
 * Read the error from the last JSON encode or decode
 *
 * $SYNTAX$
 * json_Error() --> cMessage
 *
 * $RETURNS$
 * The diagnostic message, or an empty string after a successful JSON operation.
 *
 * $DESCRIPTION$
 * Each call to `json_Encode()` or `json_Decode()` that processes a value starts with an empty diagnostic. Read the result of `json_Error()` before the next encode or decode. A wrong argument type passed to `json_Decode()` raises a runtime error.
 *
 * $SEEALSO$
 * json_Encode(), json_Decode(), JSON and hash maps
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL xValue := json_Decode( '{ "a": 1, }' )

   IF xValue == NIL
      QOut( json_Error() )
   ENDIF

RETURN
