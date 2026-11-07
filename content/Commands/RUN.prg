/*
 * $DOC$
 * $NAME$
 * RUN
 *
 * $ONELINER$
 * RUN Execute a DOS command or program
 *
 * $SYNTAX$
 * RUN | !* xcCommandLine
 *
 * $ARGUMENTS$
 *
 * $RETURNS$
 *
 * $DESCRIPTION$
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Commands
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */

#include "std.ch"

PROCEDURE Main()

   // This shell command is for Windows; replace it on other operating systems.
   RUN DIR *.DBF

   RETURN
