/*
 * $DOC$
 * $NAME$
 * GTI_FULLSCREEN
 *
 * $ONELINER$
 * Check cursor-positioning support using the alias for GTI_ISSCREENPOS
 *
 * $SYNTAX$
 * GtInfo( GTI_FULLSCREEN ) --> lSupported
 *
 * $ARGUMENTS$
 * GTI_FULLSCREEN expands to GTI_ISSCREENPOS (13) in gtinfo.ch.
 *
 * $RETURNS$
 * .T. when the driver supports positioning the cursor at a specified screen cell.
 * An active driver that does not handle this query returns NIL.
 *
 * $DESCRIPTION$
 * Use GTI_ISSCREENPOS for this capability in new code. Use GTI_ISFULLSCREEN (63)
 * to read or change the full-screen mode of the window.
 *
 * $CATEGORY$
 * Functions GT
 *
 * $HEADER$
 * gtinfo.ch
 *
 * $SEEALSO$
 * GTI_ISSCREENPOS, GTI_ISFULLSCREEN, SetPos()
 *
 * $DOCEND$
 */

#include "gtinfo.ch"

#if OS_LINUX
   REQUEST GTXWC
#else
   REQUEST GTWVT
#endif

PROCEDURE Main()

   LOCAL lCanPosition := GtInfo( GTI_FULLSCREEN )
   LOCAL lFullScreen := GtInfo( GTI_ISFULLSCREEN )

   IF lCanPosition == .T.
      SetPos( 2, 4 )
      DispOut( "Text positioned at row 2, column 4." )
   ENDIF
   IF ValType( lFullScreen ) == "L"
      OutStd( IIF( lFullScreen, "Full-screen window", "Windowed mode" ) + Eol() )
   ENDIF
   Inkey( 3 )

RETURN
