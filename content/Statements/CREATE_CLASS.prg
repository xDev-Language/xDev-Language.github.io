/*
 * $DOC$
 * $NAME$
 * CREATE CLASS
 *
 * $ONELINER$
 * Declare a class and its members
 *
 * $SYNTAX$
 * CREATE CLASS idClass [FROM idParent [, ...]]
 *    member declarations...
 * ENDCLASS
 *
 * $ARGUMENTS$
 * idClass names the class. FROM lists base classes. DATA declares
 * instance values, CLASSDATA declares class values and METHOD declares
 * instance methods. CLASSMETHOD declares class methods. ACCESS and ASSIGN
 * declare property accessors. EXPORTED, PROTECTED and HIDDEN set visibility
 * for the following declarations.
 *
 * $DESCRIPTION$
 * Declare a class at module level. A method body identifies its class with
 * METHOD idMethod( ... ) CLASS idClass. Call idClass() to obtain an object.
 * Use : to access a member and :: within a method to access a member of
 * the current object.
 *
 * $NOTES$
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
 * METHOD, FUNCTION, LOCAL
 *
 * $DOCEND$
 */

CREATE CLASS Bin
   DATA freeSpace INIT 10
   METHOD Pack( nLoad )
ENDCLASS

METHOD Pack( nLoad ) CLASS Bin

   IF nLoad <= 0 .OR. nLoad > ::freeSpace
      RETURN .F.
   ENDIF
   ::freeSpace -= nLoad

   RETURN .T.

PROCEDURE Main()

   LOCAL oFirst := Bin()
   LOCAL oSecond := Bin()
   LOCAL nLoad

   FOR EACH nLoad IN { 7, 5, 3 }
      IF !oFirst:Pack( nLoad )
         oSecond:Pack( nLoad )
      ENDIF
   NEXT
   QOut( "Remaining capacity", oFirst:freeSpace, oSecond:freeSpace )

   RETURN
