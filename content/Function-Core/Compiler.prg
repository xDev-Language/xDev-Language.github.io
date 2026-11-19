/*
 * $DOC$
 * $NAME$
 * Compiler()
 *
 * $ONELINER$
 * Return the C compiler that built the xDev runtime
 *
 * $SYNTAX$
 * Compiler( ) --> cCompilerVersion
 *
 * $ARGUMENTS$
 * None.
 *
 * $RETURNS$
 * The name and the version of the C compiler, for example "Clang 22.1.0".
 *
 * $DESCRIPTION$
 * Compiler() gives the same text as Version( VERSION_COMPILER ).
 *
 * $NOTES$
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Compiler() is Version()          OK
 * Compiler() is not empty          OK
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Version(), BuildDate()
 *
 * $DOCEND$
 */

#include "version.ch"

PROCEDURE Main()

   Check( 'Compiler() is Version()          ', Compiler(), Version( VERSION_COMPILER ) )
   Check( 'Compiler() is not empty          ', Empty( Compiler() ), .F. )

   QOut( "" )
   QOut( Compiler() )

RETURN

STATIC PROCEDURE Check( cTitle, xResult, xExpected )

   QOut( cTitle + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
