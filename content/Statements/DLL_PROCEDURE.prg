/*
 * $DOC$
 * $NAME$
 * DLL PROCEDURE
 *
 * $ONELINER$
 * Declare a void function imported from a DLL
 *
 * $SYNTAX$
 * DLL [STATIC] PROCEDURE idName( [idParam AS type [, ...]] ) [PASCAL] [FROM symbol] LIB "file.dll"
 *
 * $ARGUMENTS$
 * AS gives each parameter its native type. FROM specifies the export.
 * LIB names the DLL. STATIC limits the declaration to the current file.
 *
 * $DESCRIPTION$
 * Declare a DLL PROCEDURE at module level for a native function that
 * returns void. The linker resolves the export when building the program.
 * Use a fixed list of parameters matching the native signature.
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
 * DLL FUNCTION, CALLBACK PROCEDURE, STRUCT
 *
 * $DOCEND$
 */

// Field order and widths match the native SYSTEMTIME layout.
STRUCT UtcStamp
   year AS UINT16
   month AS UINT16
   weekday AS UINT16
   day AS UINT16
   hour AS UINT16
   minute AS UINT16
   second AS UINT16
   milliseconds AS UINT16
ENDSTRUCT

DLL PROCEDURE ReadUtc( address AS PTR ) FROM GetSystemTime LIB "kernel32.dll"

PROCEDURE Main()

   LOCAL stamp AS UtcStamp
   LOCAL nSlot

   ReadUtc( @stamp )
   nSlot := Int( stamp.minute / 15 )
   QOut( "UTC hour", stamp.hour, "minute", stamp.minute )
   QOut( "Quarter-hour window starts at minute", nSlot * 15 )

   RETURN
