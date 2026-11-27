/*
 * $DOC$
 * $NAME$
 * SClone()
 *
 * $ONELINER$
 * Duplicate a structure
 *
 * $SYNTAX$
 * SClone( stSource ) --> stDuplicate
 *
 * $ARGUMENTS$
 * stSource is a structure, or a field of a structure that holds a nested
 * structure.
 *
 * $RETURNS$
 * A new structure of the same type with a copy of the fields.
 *
 * $DESCRIPTION$
 * Assignment shares a structure; SClone() makes a copy of its own, as
 * AClone() does for an array and HClone() for a hash.
 *
 * Nested structures and arrays get their own copy. A STRING field shares
 * its text until it is changed. HASH and OBJECT fields are shared.
 *
 * A nested structure as a whole is not a value; SClone( st.field ) copies it
 * into a new structure.
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
 * AClone(), HClone(), STRUCT
 *
 * $DOCEND$
 */

STRUCT Settings
   year AS INT32
   city AS STRING
ENDSTRUCT

PROCEDURE Main()

   LOCAL stApp  AS Settings
   LOCAL stCopy AS Settings
   LOCAL stSame AS Settings

   stApp.year := 2026
   stApp.city := "Kraków"

   stCopy := SClone( stApp )
   stSame := stApp

   stCopy.year := 2025
   Check( 'stApp.year after a change in stCopy ', stApp.year, 2026 )

   stSame.year := 2025
   Check( 'stApp.year after a change in stSame ', stApp.year, 2025 )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
