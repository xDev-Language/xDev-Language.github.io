/*
 * $DOC$
 * $NAME$
 * Substring ($)
 *
 * $ONELINER$
 * Search for the left string within the right string.
 *
 * $SYNTAX$
 * left $ right
 *
 * $DESCRIPTION$
 * Search for the left string within the right string. The search is case-sensitive. An empty left string matches any string.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cLine

   FOR EACH cLine IN { "Error: disk full", "ERROR: timeout", "Ready" }
      IF "ERROR:" $ Upper( cLine )
         QOut( "Needs attention", cLine )
      ENDIF
   NEXT

   QOut( "Literal match", "error:" $ "Error: disk full" )

   RETURN
