/*
 * $DOC$
 * $NAME$
 * #elif
 *
 * $ONELINER$
 * Try another condition in an open conditional block
 *
 * $SYNTAX$
 * #if expression
 *    source lines
 * #elif otherExpression
 *    source lines
 * #endif
 *
 * $DESCRIPTION$
 * The preprocessor evaluates an #elif condition only when the enclosing source is active and no earlier branch was selected. Several #elif branches may precede a final #else.
 *
 * Set -DPACK_LEVEL=2 or -DPACK_LEVEL=3 to choose another package size.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 *
 * $DOCEND$
 */

#ifndef PACK_LEVEL
   #define PACK_LEVEL 1
#endif

#if PACK_LEVEL == 1
   #define PACK_SIZE 6
#elif PACK_LEVEL == 2
   #define PACK_SIZE 12
#elif PACK_LEVEL == 3
   #define PACK_SIZE 24
#else
   #error PACK_LEVEL must be 1, 2 or 3
#endif

PROCEDURE Main()
   QOut( "Units in four packs", 4 * PACK_SIZE )
   RETURN
