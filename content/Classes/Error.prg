/*
 * $DOC$
 * $NAME$
 * Error
 *
 * $ONELINER$
 * Describe a runtime error
 *
 * $SYNTAX$
 * Error():New( [cSubSystem], [nGenCode], [nSubCode], [cOperation], [cDescription], [aArgs] ) --> oError
 * ErrorNew( [cSubSystem], [nGenCode], [nSubCode], [cOperation], [cDescription], [aArgs] ) --> oError
 *
 * $ARGUMENTS$
 * `cSubSystem` is the name of the subsystem that raises the error.
 * `nGenCode` is the general error code.
 * `nSubCode` is the error code of the subsystem.
 * `cOperation` is the name of the failed function or operation.
 * `cDescription` is the text that describes the error.
 * `aArgs` is an array with the arguments of the failed function or operator.
 *
 * $RETURNS$
 * A new Error object. Every argument is optional; a variable without an
 * argument keeps its initial value.
 *
 * $DESCRIPTION$
 * An Error object holds the information about one runtime error. The runtime
 * creates it when an error occurs and passes it to the block of ErrorBlock().
 * A program can also create its own Error object.
 *
 * ErrorNew() is the same as Error():New().
 *
 * A new object has empty texts, 0 in the numbers, .F. in the logical
 * variables and NIL in `args` and `cargo`. The variables can be read and
 * changed:
 *
 * - `args` array with the arguments of the failed function or operator
 * - `canDefault` .T. when the default recovery is available
 * - `canRetry` .T. when the failed operation can be tried again
 * - `canSubstitute` .T. when a new result can replace the failed one
 * - `cargo` any value of the program
 * - `description` text that describes the error
 * - `filename` name of the file connected with the error
 * - `genCode` general error code
 * - `operation` name of the failed function or operation
 * - `osCode` error code of the operating system
 * - `severity` severity of the error
 * - `subCode` error code of the subsystem
 * - `subSystem` name of the subsystem that raised the error
 * - `tries` number of attempts of the failed operation
 *
 * $NOTES$
 * The variables have types. A text assigned to `genCode` or a number
 * assigned to `description` is a runtime error. `cargo` takes any value.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * MYLIB 2001: File not found (data.dbf)
 * MYLIB 2002: Disk full
 * 1102: Argument error
 *
 * $CATEGORY$
 *
 * $HEADER$
 *
 * $SEEALSO$
 * BEGIN SEQUENCE, ErrorBlock(), Break()
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL oError
   LOCAL oCaught
   LOCAL bPrevious
   LOCAL xNumber := 1

   // a new Error object, filled one variable at a time
   oError := Error():New()
   oError:subSystem   := "MYLIB"
   oError:subCode     := 2001
   oError:description := "File not found"
   oError:filename    := "data.dbf"
   QOut( oError:subSystem + " " + LTrim( Str( oError:subCode ) ) + ": " + oError:description + " (" + oError:filename + ")" )

   // ErrorNew() creates and fills the object in one line
   oError := ErrorNew( "MYLIB", 21, 2002, "Save", "Disk full" )
   QOut( oError:subSystem + " " + LTrim( Str( oError:subCode ) ) + ": " + oError:description )

   // a runtime error arrives as an Error object
   bPrevious := ErrorBlock( {| oFailure | Break( oFailure ) } )
   BEGIN SEQUENCE
      Upper( xNumber )
   RECOVER USING oCaught
      QOut( LTrim( Str( oCaught:subCode ) ) + ": " + oCaught:description )
   END SEQUENCE
   ErrorBlock( bPrevious )

   RETURN
