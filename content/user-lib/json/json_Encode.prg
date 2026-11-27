/*
 * $DOC$
 * $NAME$
 * json_Encode()
 *
 * $ONELINER$
 * Serialize an xDev value as UTF-8 JSON
 *
 * $SYNTAX$
 * json_Encode( xValue, [lPretty] ) --> cJson | NIL
 *
 * $ARGUMENTS$
 * `xValue` Value to serialize.
 * `lPretty` Pass `.T.` for indented output. The default is compact output.
 *
 * $RETURNS$
 * JSON text, or `NIL` when encoding fails. Read `json_Error()` for the reason.
 *
 * $DESCRIPTION$
 * A hash becomes a JSON object and an array becomes a JSON array. A nonempty date becomes a string in `YYYY-MM-DD` form. Empty dates, `NIL`, xDev objects, code blocks and pointers become JSON `null`. Cyclic containers and excessive nesting cause encoding to fail.
 *
 * $SEEALSO$
 * json_Decode(), json_Error(), JSON and hash maps
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL hData := { "name" => "Ada", "items" => { 1, .T., NIL } }

   QOut( json_Encode( hData ) )
   QOut( json_Encode( hData, .T. ) )

RETURN
