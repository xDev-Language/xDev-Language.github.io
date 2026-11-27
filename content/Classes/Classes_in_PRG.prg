/*
 * $DOC$
 *
 * $NAME$
 * Classes in PRG
 *
 * $ONELINER$
 * Write a class in .prg code with CREATE CLASS
 *
 * $SYNTAX$
 * CREATE CLASS idClass [FROM idParent]
 *    [EXPORTED: | PROTECTED: | HIDDEN:]
 *    DATA idData [AS type] [INIT value] [READONLY]
 *    CLASSDATA idData [AS type] [INIT value] [READONLY] [SHARED]
 *    METHOD idMethod( [params] )
 *    ACCESS idProperty
 *    ASSIGN idProperty( param )
 * ENDCLASS
 *
 * METHOD idMethod( [params] ) CLASS idClass
 *    ...
 * RETURN value
 *
 * $ARGUMENTS$
 * idClass is the name of the class and of its class function.
 *
 * idParent is the class it inherits from.
 *
 * $DESCRIPTION$
 * A class is declared at module level, between CREATE CLASS and ENDCLASS.
 * The declaration lists the members; the code of every method follows
 * after ENDCLASS, in METHOD ... CLASS idClass.
 *
 * The members:
 *
 * - `DATA` is a variable of every object; with `AS type` it has a type and a typed initial value: 0, "", .F. or an empty date
 * - `CLASSDATA` is one variable shared by all objects of the class
 * - `METHOD` is a function that works on the object
 * - `ACCESS` and `ASSIGN` make a property: reading it runs ACCESS, assigning to it runs ASSIGN
 * - `EXPORTED:`, `PROTECTED:` and `HIDDEN:` set the scope of the members that follow: visible everywhere, in the class and its subclasses, or in the class only
 * - `READONLY` lets code outside the class read a DATA but not change it
 * - `SHARED` makes a CLASSDATA keep one value for the class and its subclasses
 *
 * A class can also declare `CLASSMETHOD`, `VIRTUAL`, `DELEGATE`,
 * `DESTRUCTOR`, `ON ERROR` and `OPERATOR` members; see CREATE CLASS and
 * METHOD.
 *
 * The class function idClass() returns a new object. idClass():New( ... )
 * then calls the New method, which sets the variables and returns Self.
 * Inside a method, `::name` is a member of the current object and
 * `Super:New( ... )` calls the method of the parent class.
 *
 * A method that returns Self allows chains:
 * `oAccount:Deposit( 50 ):Deposit( 25 )`.
 *
 * $NOTES$
 * A typed DATA checks every assignment: a text assigned to a DATA declared
 * AS FLOAT is a runtime error.
 *
 * A class that comes before the code that uses it can be a type:
 * `LOCAL oAccount AS Account`.
 *
 * In the example, Withdraw() returns .F. and does not change the balance,
 * because 500 is more than the 175 on the account. Savings inherits New(),
 * Deposit() and the balance property from Account, and its AddInterest()
 * reads the PROTECTED amount directly.
 *
 * $EXAMPLES$
 *
 * $OUTPUT$
 * Anna 175
 * .F. 175
 * Anna 1242 3.5
 * Accounts opened: 2
 *
 * $CATEGORY$
 * Classes
 *
 * $HEADER$
 *
 * $SEEALSO$
 * Classes in C, CREATE CLASS, METHOD, Error
 *
 * $DOCEND$
 */

// A bank account and a savings account that inherits from it
CREATE CLASS Account

   EXPORTED:

   DATA owner AS STRING
   CLASSDATA opened INIT 0

   METHOD New( cOwner, nDeposit )
   METHOD Deposit( nAmount )
   METHOD Withdraw( nAmount )
   ACCESS balance

   PROTECTED:

   DATA amount AS FLOAT INIT 0

ENDCLASS

CREATE CLASS Savings FROM Account

   DATA rate AS FLOAT INIT 0

   METHOD New( cOwner, nDeposit, nRate )
   METHOD AddInterest()

ENDCLASS

METHOD New( cOwner, nDeposit ) CLASS Account

   ::owner := cOwner
   ::amount := nDeposit
   ::opened++

RETURN Self

METHOD Deposit( nAmount ) CLASS Account

   ::amount += nAmount

RETURN Self

// .F. when the balance is too low; the balance does not change then
METHOD Withdraw( nAmount ) CLASS Account

   IF nAmount > ::amount
      RETURN .F.
   ENDIF

   ::amount -= nAmount

RETURN .T.

ACCESS balance CLASS Account
RETURN ::amount

METHOD New( cOwner, nDeposit, nRate ) CLASS Savings

   Super:New( cOwner, nDeposit )
   ::rate := nRate

RETURN Self

// A subclass reads the PROTECTED amount directly
METHOD AddInterest() CLASS Savings

   ::amount += Round( ::amount * ::rate / 100, 2 )

RETURN Self

PROCEDURE Main()

   LOCAL oCheck := Account():New( "Anna", 100 )
   LOCAL oSave := Savings():New( "Anna", 1000, 3.5 )

   oCheck:Deposit( 50 ):Deposit( 25 )
   QOut( oCheck:owner, oCheck:balance )
   QOut( oCheck:Withdraw( 500 ), oCheck:balance )

   oSave:Deposit( 200 ):AddInterest()
   QOut( oSave:owner, oSave:balance, oSave:rate )
   QOut( "Accounts opened:", oSave:opened )

RETURN
