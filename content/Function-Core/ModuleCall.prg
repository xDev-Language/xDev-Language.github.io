/*
 * $DOC$
 * $NAME$
 * ModuleCall()
 *
 * $ONELINER$
 * Call a function of a module loaded by ModuleLoad()
 *
 * $SYNTAX$
 * ModuleCall( nHandle, cFunction, [xArg1, ...] ) --> xResult
 *
 * $ARGUMENTS$
 * nHandle is the handle from ModuleLoad().
 * cFunction is the name of a FUNCTION or PROCEDURE of the module; case does not matter.
 * xArg1, ... are the arguments of the function.
 *
 * $RETURNS$
 * The value the function returns.
 *
 * $DESCRIPTION$
 * ModuleCall() finds the function in the module by its name and calls it. Only the public functions of
 * the module can be called; a STATIC FUNCTION stays inside the module. A BREAK and a runtime error of
 * the function reach the code that called ModuleCall().
 *
 * A handle that is not loaded is the runtime error 1953. A name that the module does not have is the
 * runtime error 1954.
 *
 * $NOTES$
 * Modules work on Windows. On other systems ModuleCall() is the runtime error 1900.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * 120.00
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ModuleLoad(), ModuleUnload()
 *
 * $DOCEND$
 */

// The module Invoice.prg, built with: xdev --shared Invoice.prg
//
//    FUNCTION Gross( nNet, nRate )
//    RETURN nNet * ( 100 + nRate ) / 100
//
// This program, built with: xdev --dynamic ModuleCall.prg

PROCEDURE Main()

   LOCAL nInvoice := ModuleLoad( "Invoice.dll" )

   QOut( Str( ModuleCall( nInvoice, "Gross", 100, 20 ), 6, 2 ) )
   ModuleUnload( nInvoice )

RETURN
