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

   FIELD Client IN Buyers
   FIELD Units, Price IN Lines
   LOCAL cBuyers := "stmt_field_buyers.dbf"
   LOCAL cLines := "stmt_field_lines.dbf"

   IF FileExists( cBuyers ) .OR. FileExists( cLines )
      QOut( "Example tables already exist" )
      RETURN
   ENDIF
   DbCreate( cBuyers, { { "CLIENT", "C", 16, 0 } } )
   DbCreate( cLines, { { "UNITS", "N", 4, 0 }, { "PRICE", "N", 8, 0 } } )
   DbUseArea( .T., , cBuyers, "Buyers" )
   DbAppend()
   FieldPut( 1, "North Shop" )
   DbUseArea( .T., , cLines, "Lines" )
   DbAppend()
   FieldPut( 1, 3 )
   FieldPut( 2, 250 )

   // The selected area is Lines. Client still resolves to Buyers.
   QOut( RTrim( Client ), "invoice cents", Units * Price )
   DbCloseAll()
   FErase( cLines )
   FErase( cBuyers )

   RETURN
