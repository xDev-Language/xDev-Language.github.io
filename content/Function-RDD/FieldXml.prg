/*
 * $DOC$
 * $NAME$
 * FieldXml()
 *
 * $ONELINER$
 * Return a field value as XML Schema text
 *
 * $SYNTAX$
 * FieldXml( cFieldName | nFieldPos ) --> cValue
 *
 * $ARGUMENTS$
 * Field name or one-based field position.
 *
 * $RETURNS$
 * Field value formatted as text suitable for XML Schema content.
 *
 * $DESCRIPTION$
 * FieldXml() converts the selected field value to text. Character values are
 * returned without trailing spaces; dates use ISO format.
 *
 * $NOTES$
 * The result is value text, not an XML element and is not XML-escaped.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $CATEGORY$
 * Functions RDD
 *
 * $HEADER$
 *
 * $SEEALSO$
 * FieldGet(), FieldName(), DbStruct()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "XML value: " + FieldXml( "NAME" ) )
   DbCloseArea()

RETURN
