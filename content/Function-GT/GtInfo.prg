/*
 * $DOC$
 * $NAME$
 * GtInfo()
 *
 * $ONELINER$
 * Query or change a setting or invoke a service of the active GT driver
 *
 * $SYNTAX$
 * GtInfo( nSelector, [xValue], [xValue2] ) --> xResult
 *
 * $ARGUMENTS$
 * `nSelector` A numeric operation selector. Use a GTI_* constant defined in gtinfo.ch.
 * `xValue` The optional value or input for the operation.
 * `xValue2` The optional second input. For example, GTI_PALETTE uses it for the new
 * color when xValue selects a palette entry.
 *
 * $RETURNS$
 * The result specified by the selector, or NIL if the active driver does not handle it.
 *
 * $DESCRIPTION$
 * GT is the terminal driver that handles screen output and input. Each GTI_* reference
 * page specifies its own arguments, return value and supported drivers. For example,
 * GTI_ISUNICODE queries a capability, GTI_CARGO reads or replaces an application value,
 * and GTI_FILEDIALOG opens a system dialog on supported drivers.
 *
 * $NOTES$
 * A missing or nonnumeric selector raises error 1102. If no GT driver is active,
 * the call raises error 1901. XDev_GtInfo() is an alias.
 *
 * Build a terminal capability report and handle unsupported selectors explicitly.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GtVersion(), GTI_ISUNICODE, GTI_CARGO, GTI_PALETTE, GTI_FILEDIALOG
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

   LOCAL aSettings := { { "Unicode", GTI_ISUNICODE }, ;
                        { "Graphics", GTI_ISGRAPHIC }, ;
                        { "Text width", GTI_SCREENWIDTH }, ;
                        { "Renderer", GTI_RENDERERNAME } }
   LOCAL aSetting, xValue

   OutStd( "Terminal: " + GtVersion(), Eol() )
   FOR EACH aSetting IN aSettings
      xValue := GtInfo( aSetting[ 2 ] )
      DO CASE
      CASE ValType( xValue ) == "L"
         xValue := IIF( xValue, "yes", "no" )
      CASE ValType( xValue ) == "N"
         xValue := LTrim( Str( xValue ) ) + " px"
      CASE xValue == NIL
         xValue := "unsupported"
      ENDCASE
      OutStd( aSetting[ 1 ] + ": " + xValue, Eol() )
   NEXT

RETURN
