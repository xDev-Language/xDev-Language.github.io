/*
 * $DOC$
 * $NAME$
 * DbRecordInfo()
 *
 * $ONELINER$
 * Return information about a record
 *
 * $SYNTAX$
 * DbRecordInfo( nInfoType, [nRecord], [expNewSetting] ) --> uCurrentSetting
 *
 * $ARGUMENTS$
 * `nInfoType` Selector. `nRecord` Optional record identity. `expNewSetting` Optional setting.
 *
 * $RETURNS$
 * The selected record information.
 *
 * $DESCRIPTION$
 * DbRecordInfo() queries metadata for the current or specified record. The
 * selector determines the returned value and is defined by the RDD headers.
 *
 * $NOTES$
 * A work area must be open. xDev exposes this operation as read-only.
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
 * DbFieldInfo(), RecNo(), DbInfo()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   DbUseArea( .T., , "people.dbf", "People" )
   QOut( "DbRecordInfo: " + ValType( DbRecordInfo( 1 ) ) )
   DbCloseArea()

   RETURN
