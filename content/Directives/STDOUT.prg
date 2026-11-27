/*
 * $DOC$
 * $NAME$
 * #stdout
 *
 * $ONELINER$
 * Print a message during preprocessing
 *
 * $SYNTAX$
 * #stdout message
 *
 * $DESCRIPTION$
 * An active #stdout sends the text to compiler standard output. Names inside the message are literal text. Select separate directives when the message depends on the build configuration.
 *
 * The build message identifies the selected capacity. The program reports the corresponding runtime value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#ifdef BULK_LOAD
   #stdout Building bulk loader with 500 rows per batch
   #define BATCH_SIZE 500
#else
   #stdout Building standard loader with 50 rows per batch
   #define BATCH_SIZE 50
#endif

PROCEDURE Main()
   QOut( "Rows per batch", BATCH_SIZE )
   RETURN
