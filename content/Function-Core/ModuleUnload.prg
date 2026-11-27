/*
 * $DOC$
 * $NAME$
 * ModuleUnload()
 *
 * $ONELINER$
 * Run the EXIT procedures of a module and free it
 *
 * $SYNTAX$
 * ModuleUnload( nHandle ) --> lUnloaded
 *
 * $ARGUMENTS$
 * nHandle is the handle from ModuleLoad().
 *
 * $RETURNS$
 * .T. when the module is freed, .F. when it stays loaded.
 *
 * $DESCRIPTION$
 * ModuleUnload() runs the EXIT procedures of the module, clears its STATIC variables and frees the DLL.
 * The handle is not used again; ModuleCall() with it is a runtime error.
 *
 * The module stays loaded and ModuleUnload() returns .F. when:
 * - the handle is not loaded,
 * - a class of the module is in use, because its methods are code of the DLL,
 * - the program is already ending.
 *
 * A module that is not freed ends with the program: its EXIT procedures run then.
 *
 * $NOTES$
 * The program must not keep anything that points into the code of the module: code blocks made in the
 * module, @Function() of the module, an ErrorBlock() set by the module. After ModuleUnload() they point
 * to code that is gone. A module must not unload itself.
 *
 * Modules work on Windows. On other systems ModuleUnload() is the runtime error 1900.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * .T.
 * .F.
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ModuleLoad(), ModuleCall()
 *
 * $DOCEND$
 */

// The module Invoice.prg, built with: xdev --shared Invoice.prg
//
//    FUNCTION Start()
//    RETURN "Invoices ready"
//
// This program, built with: xdev --dynamic ModuleUnload.prg

PROCEDURE Main()

   LOCAL nInvoice := ModuleLoad( "Invoice.dll" )

   QOut( ModuleUnload( nInvoice ) )
   QOut( ModuleUnload( nInvoice ) )

RETURN
