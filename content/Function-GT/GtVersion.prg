/*
 * $DOC$
 * $NAME$
 * GtVersion()
 *
 * $ONELINER$
 * Return the identifier or description of the active GT driver
 *
 * $SYNTAX$
 * GtVersion( [nType] ) --> cVersion
 *
 * $ARGUMENTS$
 * `nType` Use 0 or omit the argument for the short driver identifier. Use 1 for
 * the driver description. NIL uses the default of 0.
 *
 * $RETURNS$
 * A character string such as "WVT", "SDL3", "XWC" or "GLFW" for the short form.
 * The text in the second form depends on the driver. The base implementation
 * returns "NUL" for either form. When no GT driver is active, the result is "".
 *
 * $DESCRIPTION$
 * The result identifies the terminal driver at runtime. Use the short form
 * in diagnostic output, or the description when displaying driver information.
 *
 * $NOTES$
 * A supplied argument other than a number or NIL raises error 1102.
 * Drivers that implement GTI_VERSION provide the same information through GtInfo().
 *
 * Compare the runtime driver identifier with the selector result and handle an inactive terminal.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 *
 * $SEEALSO$
 * GtInfo(), GTI_VERSION
 *
 * $DOCEND$
 */

#include "inkey.ch"
#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL cDriver := GtVersion()
   LOCAL cDescription, xSelectorName

   IF Empty( cDriver )
      OutStd( "No active terminal driver.", Eol() )
      RETURN
   ENDIF

   cDescription := GtVersion( 1 )
   xSelectorName := GtInfo( GTI_VERSION )
   OutStd( "Driver: " + cDriver, Eol() )
   OutStd( "Description: " + cDescription, Eol() )

   IF xSelectorName == NIL
      OutStd( "GTI_VERSION is unavailable on this driver.", Eol() )
   ELSEIF xSelectorName == cDriver
      OutStd( "The driver identifier matches GTI_VERSION.", Eol() )
   ELSE
      OutStd( "GTI_VERSION reported: " + xSelectorName, Eol() )
   ENDIF

RETURN
