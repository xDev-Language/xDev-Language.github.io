/*
 * $DOC$
 * $NAME$
 * Division assignment (/=)
 *
 * $ONELINER$
 * Apply division to the current value of the target and the right operand.
 *
 * $SYNTAX$
 * target /= value
 *
 * $DESCRIPTION$
 * Apply division to the current value of the target and the right operand. Store the result back in the target. The operand rules are those of /.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nSize := 1572864

   QOut( "Bytes", nSize )
   nSize /= 1024
   QOut( "KiB", nSize )
   nSize /= 1024
   QOut( "MiB", nSize )

   RETURN
