/*
 * $DOC$
 *
 * $NAME$
 * Classes in C
 *
 * $ONELINER$
 * Write a class in C and use it from .prg code
 *
 * $SYNTAX$
 * Point():New( [nX], [nY] ) --> oPoint
 * oPoint:Move( nDX, nDY ) --> oPoint
 * oPoint:Distance( oOther ) --> nDistance
 * oPoint:ToString() --> cText
 * oPoint:x, oPoint:y --> nValue
 *
 * $ARGUMENTS$
 * `nX` is the x coordinate of the new point; a missing value is 0.
 * `nY` is the y coordinate of the new point; a missing value is 0.
 * `nDX` is added to x by Move().
 * `nDY` is added to y by Move().
 * `oOther` is another Point object.
 *
 * $RETURNS$
 * Point():New() and Move() return the Point object. Distance() returns the
 * distance between the two points. ToString() returns the coordinates as a
 * text, such as "(1, 2)".
 *
 * $DESCRIPTION$
 * The Point class is written in C, in the file point.c. A .prg program uses
 * it like a class written in .prg: Point():New( 1, 2 ) makes an object,
 * oPoint:Move( 1, 1 ) sends it a message and oPoint:x reads its variable.
 *
 * point.c has three parts: an `enum` with the position of every variable in
 * the object, one C function for every method, and the class function
 * `X_FUNC( POINT )`. On its first call the class function makes the class:
 * the variables, their types and the methods. Every call returns a new
 * object.
 *
 * The runtime API used in point.c:
 *
 * - `IIF()` – chooses one of two values by a condition
 * - `X_ARGCHECK()` – raises an argument error and leaves the function when its condition is false
 * - `X_ARGCHECK_OPT()` – the same check for an optional argument: a missing argument passes
 * - `x_arrayGetND()` – reads a numeric variable of the object
 * - `x_arraySetND()` – writes a numeric variable of the object
 * - `x_clsAdd()` – adds a method to the class
 * - `x_clsAddData()` – adds a variable to the class at its position in the object
 * - `x_clsCreate()` – makes a new class with the given number of variables
 * - `x_clsReturn()` – finishes the class and returns a new object from the class function
 * - `x_clsSetDataType()` – gives a variable a type, such as `X_OO_VALUE_FLOAT64`
 * - `X_FUNC()` – a function that .prg code can call, such as Point()
 * - `X_FUNC_STATIC()` – a function seen only in the C file; used for the methods
 * - `X_FUNCNAME()` – the name of a function made by `X_FUNC()` or `X_FUNC_STATIC()`
 * - `X_ISNIL()` – tells whether an argument is NIL or missing
 * - `X_ISNUM()` – tells whether an argument is a number
 * - `X_ISOBJECT()` – tells whether an argument is an object
 * - `x_itemCopy()` – copies a value
 * - `x_objGetClass()` – returns the class of an object
 * - `x_paritem()` – returns an argument as a value
 * - `x_parnd()` – returns an argument as a number
 * - `x_retc()` – returns a text from the function
 * - `x_retnd()` – returns a number from the function
 *
 * In a method `ctx->self` is the object and `ctx->result` is the value the
 * method returns. A method that copies `ctx->self` into `ctx->result`
 * returns the object, which allows chains such as
 * oPoint:Move( 1, 1 ):Move( 2, 0 ).
 *
 * Build the program in two steps. First compile point.c with exception
 * support into point.o. Then `xdev main.prg point.o` compiles main.prg and
 * links it with the class.
 *
 * $NOTES$
 * -fexceptions is required. A runtime error passes through the C functions
 * of the class, and only code compiled with -fexceptions lets it pass and
 * releases its values on the way.
 *
 * The variables x and y have the type FLOAT64. Assigning a text to
 * oPoint:x is a runtime error, as in a .prg class with DATA x AS FLOAT.
 *
 * Several classes can go into one static library. Pass that library to xdev
 * like any other `.a` input, for example `xdev main.prg libshapes.a`.
 *
 * A class written in .prg cannot inherit FROM a class written in C.
 *
 * $EXAMPLES$
 * // point.c: the Point class written in C
 *
 * #include "classes.h"
 *
 * #include <math.h>
 * #include <stdio.h>
 *
 * // The instance variables: their position in the object, from 1
 * enum
 * {
 *    POINT_X = 1,
 *    POINT_Y,
 *    POINT_DATA = POINT_Y
 * };
 *
 * // Set the coordinates of a new point; a missing coordinate is 0
 * // Point():New( [nX], [nY] ) --> self
 * X_FUNC_STATIC( POINT_NEW )
 * {
 *    X_ARGCHECK_OPT( ctx, 1, X_ISNIL( ctx, 1 ) || X_ISNUM( ctx, 1 ), "POINT:NEW" );
 *    X_ARGCHECK_OPT( ctx, 2, X_ISNIL( ctx, 2 ) || X_ISNUM( ctx, 2 ), "POINT:NEW" );
 *
 *    x_arraySetND( ctx->self, POINT_X, IIF( X_ISNUM( ctx, 1 ), x_parnd( ctx, 1 ), 0 ) );
 *    x_arraySetND( ctx->self, POINT_Y, IIF( X_ISNUM( ctx, 2 ), x_parnd( ctx, 2 ), 0 ) );
 *
 *    x_itemCopy( ctx->result, ctx->self );
 * }
 *
 * // Move the point by nDX and nDY
 * // oPoint:Move( nDX, nDY ) --> self
 * X_FUNC_STATIC( POINT_MOVE )
 * {
 *    X_ARGCHECK( ctx, X_ISNUM( ctx, 1 ) && X_ISNUM( ctx, 2 ), "POINT:MOVE" );
 *
 *    x_arraySetND( ctx->self, POINT_X, x_arrayGetND( ctx->self, POINT_X ) + x_parnd( ctx, 1 ) );
 *    x_arraySetND( ctx->self, POINT_Y, x_arrayGetND( ctx->self, POINT_Y ) + x_parnd( ctx, 2 ) );
 *
 *    x_itemCopy( ctx->result, ctx->self );
 * }
 *
 * // The distance to another point
 * // oPoint:Distance( oOther ) --> nDistance
 * X_FUNC_STATIC( POINT_DISTANCE )
 * {
 *    X_ARGCHECK( ctx, X_ISOBJECT( ctx, 1 ), "POINT:DISTANCE" );
 *    X_ARGCHECK( ctx, x_objGetClass( x_paritem( ctx, 1 ) ) == x_objGetClass( ctx->self ), "POINT:DISTANCE" );
 *
 *    const X_ITEM *other = x_paritem( ctx, 1 );
 *    double dx = x_arrayGetND( other, POINT_X ) - x_arrayGetND( ctx->self, POINT_X );
 *    double dy = x_arrayGetND( other, POINT_Y ) - x_arrayGetND( ctx->self, POINT_Y );
 *
 *    x_retnd( ctx, sqrt( dx * dx + dy * dy ) );
 * }
 *
 * // The coordinates as a text
 * // oPoint:ToString() --> "(x, y)"
 * X_FUNC_STATIC( POINT_TOSTRING )
 * {
 *    double x = x_arrayGetND( ctx->self, POINT_X );
 *    double y = x_arrayGetND( ctx->self, POINT_Y );
 *    char text[64];
 *
 *    snprintf( text, sizeof( text ), "(%.15g, %.15g)", x, y );
 *    x_retc( ctx, text );
 * }
 *
 * // Point class: a point with the coordinates x and y
 * // Point():New( 0, 0 ) --> oPoint: a new object at (0, 0)
 * X_FUNC( POINT )
 * {
 *    static X_CLASS_HANDLE s_class = 0;
 *
 *    if( s_class == 0 )
 *    {
 *       s_class = x_clsCreate( POINT_DATA, "POINT" );
 *
 *       // Instance variables
 *       x_clsAddData( s_class, "X", POINT_X );
 *       x_clsAddData( s_class, "Y", POINT_Y );
 *
 *       x_clsSetDataType( s_class, "X", X_OO_VALUE_FLOAT64 );
 *       x_clsSetDataType( s_class, "Y", X_OO_VALUE_FLOAT64 );
 *
 *       // Methods
 *       x_clsAdd( s_class, "NEW",      X_FUNCNAME( POINT_NEW ) );
 *       x_clsAdd( s_class, "MOVE",     X_FUNCNAME( POINT_MOVE ) );
 *       x_clsAdd( s_class, "DISTANCE", X_FUNCNAME( POINT_DISTANCE ) );
 *       x_clsAdd( s_class, "TOSTRING", X_FUNCNAME( POINT_TOSTRING ) );
 *    }
 *
 *    x_clsReturn( ctx, s_class );
 * }
 *
 * $OUTPUT$
 * (1, 2) (4, 6) (0, 0)
 * 5
 * (4, 4) 4 4
 * (10, 4)
 *
 * $CATEGORY$
 * Classes
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Classes in PRG, CREATE CLASS, METHOD, Error
 *
 * $DOCEND$
 */

// main.prg: uses the Point class of point.c
PROCEDURE Main()

   LOCAL oA := Point():New( 1, 2 )
   LOCAL oB := Point():New( 4, 6 )
   LOCAL oC := Point():New()

   QOut( oA:ToString(), oB:ToString(), oC:ToString() )
   QOut( oA:Distance( oB ) )

   oA:Move( 2, 2 ):Move( 1, 0 )
   QOut( oA:ToString(), oA:x, oA:y )

   oA:x := 10
   QOut( oA:ToString() )

RETURN
