/*
 * $DOC$
 * $NAME$
 * ModuleLoad()
 *
 * $ONELINER$
 * Load a DLL module and run its INIT procedures
 *
 * $SYNTAX$
 * ModuleLoad( cFile ) --> nHandle
 *
 * $ARGUMENTS$
 * cFile is the DLL of the module, built with xdev --shared. Without a directory Windows looks for it
 * next to the program, in the system directories, in the current directory and on PATH.
 *
 * $RETURNS$
 * The handle of the module for ModuleCall() and ModuleUnload().
 *
 * $DESCRIPTION$
 * ModuleLoad() loads the DLL, sets the STATIC variables of the module and runs its INIT procedures.
 * The module uses the runtime of the program, libxdev.dll, so the program must be built with
 * xdev --dynamic. Loading the same DLL again gives the same handle and runs nothing.
 *
 * A file that cannot be loaded is the runtime error 1950. A DLL that xdev --shared did not build is
 * the error 1951. A module built for another version of the runtime is the error 1952; build it again
 * with the xdev of the program.
 *
 * $NOTES$
 * Modules work on Windows. On other systems ModuleLoad() is the runtime error 1900.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Invoices ready
 *
 * $CATEGORY$
 * Functions Core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * ModuleCall(), ModuleUnload()
 *
 * $DOCEND$
 */

// The module Invoice.prg, built with: xdev --shared Invoice.prg
//
//    FUNCTION Start()
//    RETURN "Invoices ready"
//
// This program, built with: xdev --dynamic ModuleLoad.prg

PROCEDURE Main()

   LOCAL nInvoice := ModuleLoad( "Invoice.dll" )

   QOut( ModuleCall( nInvoice, "Start" ) )
   ModuleUnload( nInvoice )

RETURN
