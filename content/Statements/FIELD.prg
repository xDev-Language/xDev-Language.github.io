/*
 * $DOC$
 * $NAME$
 * FIELD
 *
 * $ONELINER$
 * Declare database field names
 *
 * $SYNTAX$
 * FIELD idField list [IN idAlias]
 *
 * $ARGUMENTS$
 * `idField list` is a list of names to declare as fields to the compiler.
 * `IN idAlias` gives the alias assumed for the names in `idField list`.
 * Without IN, a name refers to a field of the current work area, as if it
 * were written with FIELD->.
 *
 * $DESCRIPTION$
 * FIELD declares the names of database fields to the compiler and optionally
 * gives each name an alias. The compiler then treats a name written without
 * an alias as a field of that alias. Only names written without an alias are
 * affected.
 *
 * FIELD neither opens a database file nor checks that the fields exist. Using
 * a field when its table is not open is a runtime error.
 *
 * A FIELD declaration inside a procedure or function is valid in that
 * procedure or function. A FIELD declaration at module level, before the
 * first procedure or function, is valid in the whole source file (.prg).
 *
 * FIELD, like other declarations, must come before any executable statement
 * of the procedure or function.
 *
 * $NOTES$
 * xDev resolves names at compile time, so a field of a table that is read
 * without an alias must be declared with FIELD.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Name: Anna
 * City: Lodz
 * Employee: Jan
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FUNCTION, LOCAL, PROCEDURE, STATIC
 *
 * $DOCEND$
 */

PROCEDURE Main()

   FIELD Name, City
   FIELD EmpName IN Employee

   DbCreate( "fld_employee", { { "EMPNAME", "C", 10, 0 } } )
   DbCreate( "fld_orders", { { "NAME", "C", 10, 0 }, { "CITY", "C", 10, 0 } } )

   DbUseArea( .T., , "fld_employee", "Employee" )
   DbAppend()
   FieldPut( 1, "Jan" )

   DbUseArea( .T., , "fld_orders", "Orders" )
   DbAppend()
   FieldPut( 1, "Anna" )
   FieldPut( 2, "Lodz" )

   QOut( "Name: " + RTrim( Name ) )            // Orders->NAME, the current work area
   QOut( "City: " + RTrim( City ) )            // Orders->CITY
   QOut( "Employee: " + RTrim( EmpName ) )     // Employee->EMPNAME

   DbCloseAll()
   FErase( "fld_employee.dbf" )
   FErase( "fld_orders.dbf" )

   RETURN
