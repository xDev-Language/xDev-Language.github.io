/*
 * $DOC$
 * $NAME$
 * #if
 *
 * $ONELINER$
 * Select source lines using a compile-time expression
 *
 * $SYNTAX$
 * #if expression
 *    source lines
 * #endif
 *
 * $DESCRIPTION$
 * An integer or logical expression selects the branch when its value is nonzero. Definitions expand before evaluation. An undefined identifier evaluates to zero. Use defined( name ) to test whether a definition exists.
 *
 * The platform definitions have numeric values. The example selects a path separator using the value of OS_WINDOWS.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#if OS_WINDOWS
   #define PATH_SEPARATOR Chr( 92 )
#else
   #define PATH_SEPARATOR "/"
#endif

PROCEDURE Main()
   QOut( "reports" + PATH_SEPARATOR + "annual.csv" )
   RETURN
