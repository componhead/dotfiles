Syntax in "Extended Backus-Naur form" (aka EBNF)
    * | is an alternative
    * [...] is an option (0 or 1)
    * {...} is a repetition (0 or more)

Type = SimpleType | FunctionType
FunctionType = SimpleType => Type | `(` [Types] `)` `=>` Type
SimpleType = Ident
Types = Type {`,` Type}

A type can be:
    * numeric type: Int, Double ...
    * Boolean type with true or false value
    * String type
    * function type: Int => Int, (Int, Int) => Int ...


Expressions:
Expr = InfixExpr | FunctionExpr | if `(` Expr `)` Expr else Expr
InfixExpr = PrefixExpr | InfixExpr Operator InfixExpr
Operator = ident
PrefixExpr = [`+` | `-` | `!` | `~`] SimpleExpr
SimpleExpr = ident | literal | SimpleExpr `.` ident | Block
FunctionExpr = Bindings `=>` Expr
Bindings = ident [`:` SimpleType] | `(` [Binding {`,` Binding}] `)`
Binding = ident [`:` Type]
Block = `{` Def `;`} Expr `}`


An expression can be:
    * An identifier such as x, isGoodEnough
    * A literal like 0, 1.0, "abc"
    * A functiona application like sqr(x)
    * An operator application like -x, x + y
    * A selection like math.abs
    * A conditional expression like if(x<0) -x else x
    * A block like {val x = math.abs(y) ; x * 2}
    * An anonymous function like x => x + 1


Definitions:
Def = FunDef | ValDef
FunDef = def ident {`(` [Parameters] `)`} [`:` Type] `=` Expr
ValDef = val ident [`:` Type] `=` Expr
Parameter = ident `:` [ `=>` ] Type
Parameters = Parameter {`,` Parameter}

A definition can be:
    * A function definition like def square(x: Int) = x * x
    * A value definition like val y = square(2)

A parameter can be:
    * A call-by-value parameter like (x: Int)
    * A call-by-name parameter like (y: => Double)


Infix notation:
def add(y: Int) = { ... }
x add y

Unary notation
def unary_- : Int = { ... }
y + -x


Precedence (from least to most):
(all letters)
|
^
&
< >
= !
:
+ -
* / %
(all other special characters)


Anonymous function as:
    (x: Int) => x * x
is expanded in a class:
    {
        class AnonFun extends Function1[Int, Int] {
            def apply(x: Int) = x * x
        }
        new AnonFun
    }
or, using anonymous class syntax:
    new Function1[Int, Int] {
        def apply(x: Int) = x * x
    }


Case class contructor defined like this:
`case class MyClass(x: Int) extends YourClass`
is expanded in a companion object:
```
object MyClass {
    def apply(x: Int) = new MyClass(x)
}
```
The class can be istantiated without the use of 'new' keyword
