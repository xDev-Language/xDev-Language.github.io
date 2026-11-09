/*
 * $DOC$
 * $NAME$
 * ANNOUNCE
 *
 * $ONELINER$
 * Declare a module identifier
 *
 * $SYNTAX$
 * ANNOUNCE idModule
 *
 * $ARGUMENTS$
 * `idModule` is the name of the module.
 *
 * $DESCRIPTION$
 * ANNOUNCE gives a name to a source file (.prg). Another file can then link
 * the whole module into the program with REQUEST idModule, even when no
 * function of the module is called. This is useful for a module that only
 * has an INIT PROCEDURE or EXIT PROCEDURE.
 *
 * Write ANNOUNCE at module level, outside any function. A source file has
 * only one module name.
 *
 * $NOTES$
 * The module name becomes an empty procedure, so it must not duplicate the
 * name of a function or procedure in the program. A second ANNOUNCE in the
 * same file, or ANNOUNCE inside a function, is a compile error.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * The CustomInit module is ready
 * Main() runs after the INIT PROCEDURE
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * REQUEST, INIT PROCEDURE
 *
 * $DOCEND$
 */

ANNOUNCE CustomInit

INIT PROCEDURE CustomStart()

   QOut( "The CustomInit module is ready" )

   RETURN

PROCEDURE Main()

   QOut( "Main() runs after the INIT PROCEDURE" )

   RETURN
