/*
 * $DOC$
 * $NAME$
 * json_Decode()
 *
 * $ONELINER$
 * Parse UTF-8 JSON into an xDev value
 *
 * $SYNTAX$
 * json_Decode( cJson ) --> xValue | NIL
 *
 * $ARGUMENTS$
 * `cJson` UTF-8 text containing one JSON value. A leading UTF-8 byte order mark is accepted.
 *
 * $RETURNS$
 * The decoded value, or `NIL` on parse failure. A valid JSON `null` also returns `NIL`. An empty `json_Error()` result distinguishes successful parsing of `null` from a failure.
 *
 * $DESCRIPTION$
 * Objects become hashes in source key order, arrays become arrays, and booleans become logical values. Whole numbers that fit are returned as integers. Other numbers are returned as doubles. Unicode escapes and surrogate pairs are decoded into UTF-8. Date strings remain strings.
 *
 * $SEEALSO$
 * json_Encode(), json_Error(), JSON and hash maps
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL hData := json_Decode( '{ "name": "Ada", "items": [1, true, null] }' )

   QOut( hData[ "name" ] )
   QOut( Len( hData[ "items" ] ) )

RETURN
