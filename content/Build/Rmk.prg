/*
 * $DOC$
 *
 * $NAME$
 * File rmk
 *
 * $ONELINER$
 * Build a program or a library with xdev from a .rmk file
 *
 * $SYNTAX$
 * xdev file.rmk
 *
 * target: files [options]
 *
 * $ARGUMENTS$
 * target is the file to build: a program (.exe on Windows), an object
 * file (.o) or a static library (.a).
 *
 * files are the files the target is made of: .prg sources, .o object
 * files, .a libraries, an .ico icon and .png or .bmp pictures. A .ch header
 * is only a dependency: a newer header builds the target again.
 *
 * options are xdev options, each written as one word: --windows,
 * -Iinclude, -DNAME, -Wno-unused.
 *
 * $DESCRIPTION$
 * A .rmk file holds only rules "target: files". There are no commands:
 * xdev itself compiles and links every target.
 *
 * A program needs at least one .prg file; the first one holds Main().
 * The other .prg files are modules, and modules built earlier can be given
 * as .o files. A .o target is made of exactly one .prg file.
 *
 * A target is built when it is missing or older than one of its files,
 * the .rmk file, the runtime or an automatically linked user library.
 * Otherwise xdev reports that it is up to date.
 *
 * xdev builds every target of the file. A file that is the target of
 * another rule is built first.
 *
 * A rule starts in the first column. A line ending with \ continues on
 * the next line. // starts a comment that runs to the end of the line.
 * Names are relative to the folder of the .rmk file.
 *
 * $NOTES$
 * In the example only a changed module is compiled again into its .o
 * file; the program is then linked again with it.
 *
 * $EXAMPLES$
 * // Modules of the program
 * src\customers.o:  src\customers.prg
 * src\invoices.o:   src\invoices.prg
 *
 * // The program: the file with Main() and the modules
 * app.exe:  src\app.prg src\customers.o src\invoices.o \
 *           app.ico --windows
 *
 * $CATEGORY$
 * Build
 *
 * $HEADER$
 *
 * $SEEALSO$
 *
 * $DOCEND$
 */
