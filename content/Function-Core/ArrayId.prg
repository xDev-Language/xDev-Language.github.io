/*
 * $DOC$
 * $NAME$
 * ArrayId()
 *
 * $ONELINER$
 * Return the identity of an array or object
 *
 * $SYNTAX$
 * ArrayId( aArray | oObject ) --> pIdentity
 *
 * $ARGUMENTS$
 * aArray is an array, or oObject is an object represented by an array.
 *
 * $RETURNS$
 * A pointer value identifying the array or object during this program run.
 *
 * $DESCRIPTION$
 * Returns the same identity for references to the same array or object.
 * Different live arrays and objects have different identities, even when
 * their contents compare equal.
 *
 * $NOTES$
 * The value is meaningful only while the referenced value and program live.
 * Do not store it as a persistent identifier. AClone() creates another array
 * and therefore another identity.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Alias has the same identity: OK
 * Other array differs: OK
 * Clone differs: OK
 * Object alias has the same identity: OK
 * Other object differs: OK
 *
 * $CATEGORY$
 * Function core
 *
 * $HEADER$
 *
 * $SEEALSO$
 * AClone()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL aFirst := {}
   LOCAL aAlias := aFirst
   LOCAL aOther := {}
   LOCAL aClone := AClone( aFirst )
   LOCAL oFirst := Error():New()
   LOCAL oAlias := oFirst
   LOCAL oOther := Error():New()

   s_Check( "Alias has the same identity", ArrayId( aFirst ) == ArrayId( aAlias ), .T. )
   s_Check( "Other array differs", ArrayId( aFirst ) != ArrayId( aOther ), .T. )
   s_Check( "Clone differs", ArrayId( aFirst ) != ArrayId( aClone ), .T. )
   s_Check( "Object alias has the same identity", ArrayId( oFirst ) == ArrayId( oAlias ), .T. )
   s_Check( "Other object differs", ArrayId( oFirst ) != ArrayId( oOther ), .T. )

RETURN

STATIC PROCEDURE s_Check( cTitle, xResult, xExpected )

   QOut( cTitle + ": " + IIF( xResult == xExpected, "OK", "ERROR" ) )

RETURN
