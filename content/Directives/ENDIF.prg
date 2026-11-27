/*
 * $DOC$
 * $NAME$
 * #endif
 *
 * $ONELINER$
 * Close the innermost conditional block
 *
 * $SYNTAX$
 * #endif
 *
 * $DESCRIPTION$
 * Each #if, #ifdef or #ifndef needs a matching #endif in the same source file. After #endif, processing resumes in the enclosing branch.
 *
 * When EXPORT_PRICES is defined the export includes a price. NET_PRICES chooses its basis. The item code appears in every build.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL nNet := 100

   QOut( "Item A17" )
#ifdef EXPORT_PRICES
   #ifdef NET_PRICES
      QOut( "Net price", nNet )
   #else
      QOut( "Gross price", nNet * 1.20 )
   #endif
#endif
   QOut( "End of record" )

   RETURN
