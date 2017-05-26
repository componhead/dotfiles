# LAMBDA CALCULUS
The lambda calculus is a model of computation devised in the 1930s by Alonzo Church.
A calculus is a method of calculation or reasoning; the lambda calculus is one process for formalizing a method.
The essence of functional programming is that programs are a combination of expressions. Expressions include concrete values, variables, and also functions. Functions have a more specific definition: they are expressions that are applied to an argument or input, and once applied, can be reduced or evaluated therefore they always return a (one) result: the same result when given the same values. In Haskell, and in functional programming more generally, functions are first-class: they can be used as values or passed as arguments, or inputs, to yet more functions.
Haskell is a pure functional language, because all the features of the language are translatable to lambda expressions.
The word *purity* in functional programming is sometimes also used to mean what is more properly called *referential transparency*. Referential transparency means that the same function, given the same values to evaluate, will always return the same result in pure functional programming, as they do in math.
The lambda calculus has three basic components, or lambda terms: expressions, variables, and abstractions:
 - The word *expression* refers to a superset of all those things: an expression can be a variable name, an abstraction, or a combination of those things. The simplest expression is a single variable. Variables here have no meaning or value; they are just names for potential inputs to functions.
 - An *abstraction* is a function. It is a lambda term that has a head (a lambda) and a body and is applied to an argument. An argument is an input value.
Abstractions consist of two parts: the head and the body. The head of the function is a `𝜆` (lambda) followed by a variable name. The body of the function is another expression.

`𝜆𝑥.𝑥` is a simple, anonymous function, where the head is `𝜆𝑥.` and the body is `𝑥`. The first `𝑥` in `𝜆𝑥.` is an argument too that binds a variable. The second `𝑥` is the bound variable. The dot `.` separates the parameters of the lambda from the function body.
When we apply the abstraction to arguments, we replace the names with values, making it concrete. When we apply a function to an argument, we substitute the input expression for all instances of bound variables within the body of the abstraction. You also eliminate the head of the abstraction, since its only purpose was to bind a variable. This process is called *beta reduction*.

Applications in the lambda calculus are left associative.
1. `(𝜆𝑥.𝑥)(𝜆𝑦.𝑦)𝑧` is writable as `((𝜆𝑥.𝑥)(𝜆𝑦.𝑦))𝑧`
2. `[𝑥 ∶= (𝜆𝑦.𝑦)]` the body (`.𝑥`) is substituted by tha value `(𝜆𝑦.𝑦)`
3. `(𝜆𝑦.𝑦)𝑧`
4. `[𝑦 ∶= 𝑧]`
5. `𝑧`
The process of beta reduction stops when there are either no more heads, or lambdas, leift to apply or no more arguments to apply functions to. *Beta normal form* is when you cannot beta reduce (apply lambdas to arguments) the terms any further. This corresponds to a fully valuated expression, or, in programming, a fully executed program. All reducible expressions are also called *redexes*.

The *free variables* are variables in the body that are not bound by the head.

## Currying:
`𝜆𝑥𝑦.𝑥𝑦 == 𝜆𝑥.(𝜆𝑦.𝑥𝑦) == 𝜆𝑥.𝜆𝑦.𝑥𝑦`
As in the lambda calculus, all functions in Haskell take one argument and return one result. The way to think of this is that, in Haskell, when it seems we are passing multiple arguments to a function, we are actually applying a series of nested functions, each to one argument. This is called *currying*.

A *combinator* is a lambda term with no free variables or rather, every term in the body occurs in the head. Combinators, as the name suggests, serve only to combine the arguments they are given.
Not all reducible lambda terms reduce neatly to a beta normal form. This isn’t because they’re already fully reduced, but rather because they *diverge*.Divergence here means that the reduction process never terminates or ends:
1. `(𝜆𝑥.𝑥𝑥)(𝜆𝑥.𝑥𝑥)`
2. `([𝑥 ∶= (𝜆𝑥.𝑥𝑥)]𝑥𝑥)`
3. `(𝜆𝑥.𝑥𝑥)(𝜆𝑥.𝑥𝑥)`

# HASKELL
The parameters of a function correspond to the “head” of a lambda and bind variables that appear in the body expression.
Once a term has reached its simplest form, we say that it is irreducible or finished evaluating. Usually, we call this a value. Haskell uses a nonstrict evaluation (sometimes called “lazy evaluation”) strategy which defers evaluation of terms until they’re forced by other terms referring to them. 
If the function name is alphanumeric, it is a prefix function by default, and not all prefix functions can be made infix. If the name is a symbol, it is infix by default but can be made prefix by wrapping it in parentheses. Is possible use prefix operators in infix fashion by wrapping them in backticks.
Infix and prefix operator default notation, with precedence, is shown by `:info` command of ghci.
The identation of declarations counts! This code won't compile:
```haskell
foo x =
    let y = x * 2
      z = x^2
  in 2 * y * z
```
This compile:
```haskell
foo x =
    let y = x * 2
        z = x^2   // aligned with 'y' declaration
    in 2 * y * z  // aligned with 'let'
```
`let` introduces an expression, so it can be used wherever you can have an expression, but `where` is a declaration and is bound to a surrounding syntactic construct.
```haskell
let x = 5; y = 6 in x * y
```
could be rewritten as:
```haskell
mult1 = x*y
  where x = 5
        y = 6
```
Remember that when you write code in a source file, the order is unimportant, but when writing code directly into the REPL the order does matter.

# DEFINITIONS
- The terms *argument* and *parameter* are often used interchangeably. However, it is worthwhile to understand the distinction. A parameter, or formal parameter, represents a value that will be passed to the function when the function is called. Thus, parameters are usually variables. An argument is an input value the function is applied to. A function’s parameter is bound to the value of an argument when the function is applied to that argument.
- An expression is a combination of symbols that conforms to syn- tactic rules and can be evaluated to some result. In Haskell, an expression is a well-structured combination of constants, vari- ables, and functions. While irreducible constants are technically expressions, we usually refer to those as “values”, so we usually mean “reducible expression” when we use the term expression.
- A redex is a reducible expression.
- A value is an expression that cannot be reduced or evaluated any further.
- A function is a mathematical object whose capabilities are lim- ited to being applied to an argument and returning a result. Functions can be described as a list of ordered pairs of their inputs and the resulting outputs, like a mapping.
- Infix notation is the style used in arithmetic and logic. Infix means that the operator is placed between the operands or arguments.
- Operators are functions that are infix by default. In Haskell, operators must use symbols and not alphanumeric characters.
- Syntactic sugar is syntax within a programming language de-signed to make expressions easier to write or read.

# SYMBOLS
- The function application is symbolized by a whitespace ` ` and has the greatest precedence on other symbols.
- The `$` symbol will allow everything to the right of it to be evaluated first and can be used to delay function application. It is an infix operator with the lowest possible precedence and *is used for express something with fewer pairs of parentheses*.
```haskell
negate . sum $ [1,2,3,4,5]
    -- is reduced to
    negate . (sum [1,2,3,4,5])
    -- but is also writeable in POINTFREE style (the point-free is the arg)
    let f = negate . sum
    f [1,2,3,4,5]
```
```haskell
-- This doesn't compile because negate needs a function but function application has precedence (10) over compose function (9)
negate . sum [1,2,3,4,5]    
    -- is reduced to
    negate . 15
```
- The symbol `:` is called *cons* and is used to separate the head of a list from his tail. Should be prenthesised because function application has higher priority than all other operators in the language. 
- The `::` symbol is a way to write down a type signature. You can think of it as saying, “has the type”.
- The `|` symbols means "such that" when is used in a *guarded equation* else it means "or".
- The symbol `_` is used as a "wildcard pattern" in pattern matching and means "any value".
- The `<-` symbol means "drawn from" and is used with *generators*, as in `x <- [1..10]`.
- The `\` symbol represent a *lambda* and, followed by a variable, is used in *lambda expressions* (nameless functions).
- The `->` symbol is a *mapping* because map an argument to a result.

# ARITY
Arity is the number of arguments a function accepts. This notion is a little slippery in Haskell as, due to currying, all functions are 1-arity and we handle accepting multiple arguments by nesting functions.

# TYPES
Expressions, when evaluated, reduce to values. Every value has a *type*. Types are how we group a set of values together that share something in common.

# TYPECLASS
A typeclass is a set of operations defined with respect to a polymorphic type. When a type is an *instance of a typeclass*, values of that type can be used in the standard operations defined for that typeclass. In Haskell, typeclasses are unique pairings of class and concrete instance. This means that if a given type `a` has an instance of `Eq`, it has only one instance of `Eq`.
*Typeclass inheritance* is when a typeclass has a superclass. This is a way of expressing that a typeclass requires another typeclass to be available for a given type before you can write an instance.
Typeclasses and types in Haskell are, in a sense, opposites. Where a declaration of a type defines how that type in particular is created, a declaration of a typeclass defines how a set of types are consumed or used in computations.
A type has an *instance* of a typeclass when there is code that defines how the values and functions from that typeclass work for that type.
- A typeclass defines a set of functions and/or values.
- Types have instances of that typeclass.
- The instances specify the ways that type uses the functions of the typeclass.

# DATATYPE DECLARATION
A datatype declaration defines a *type constructor* and *data constructors*.
Data declarations are how *datatypes* are defined and are, everytime, defined with the keyword `data` followed by the *type constructor* (or name of the type that will appear in type signatures), the equals sign to denote a definition, and then *data constructors* (or names of values that inhabit your term-level code).

# TYPE CONSTRUCTOR
Type constructors in Haskell are not values and can only be used in type signatures. Just as data declarations generate data constructors to create values that inhabit that type, data declarations generate type constructors which can be used to denote that type. The arrow, (`->`), is the type constructor for functions in Haskell. It’s baked into the language, but syntactically it works in very much the same way as all the other types you’ve seen so far. *The arrow is an infix operator that has two parameters and associates to the right (although function application is left associative)*, so `f :: a -> b -> c` associates as `f :: a -> (b -> c)` althogh the evaluation start from `a` and end to `c` so, `f x` produces a function `f' :: b -> c` called *partial function*.
A function must have two arguments — one input and one result — in order to be a function. Unlike the tuple constructor, though, the function type has no data constructors. The value that shows up at term level is the function.

# DATA CONSTRUCTOR
Data constructors in Haskell provide a means of creating values that inhabit a given type. Data constructors in Haskell have a type and can either be constant values (nullary) or take one or more arguments just like functions.
```haskell
-- Why name a cat? They don't answer anyway.
     type Name = String  -- *type alias*
     data Pet = Cat | Dog Name  -- Pet is a *type constructor* in a *data declaration*
     -- Cat is a *nullary data constructor*
     -- Cat :: Pet
     -- Dog is a data constructor with argument
     -- Dog :: Name -> Pet
```
In type theory a *Sum type* of two types is a type whose terms are terms in either type, but not simultaneously. In Haskell sum types are represented using the pipe `|` in a *data definition*.

# TYPE ALIAS
A type alias is away to refer to a type constructor or type constant by an alternate name, usually to communicate something more specific or for brevity.

# POLYMORPHISM
Type signatures may have three kinds of types: concrete, constrained polymorphic, or parametrically polymorphic.
Polymorphism in Haskell means being able to write code in terms of values which may be one of several, or any, type. Polymorphism  is either *parametric* or *constrained*. Is constrained when the function definition is bounded to a specific set of types (with `=>` symbol).
```haskell
firstExample:: (Num a, Num b) => a -> b -> b
secondExample:: (Ord a, Num a) => a -> a -> Ordering
```
The tuple of constraints does represent a product, or conjunction, of constraints.
In the `secondExample`, both of the constraints are on the one variable `a` that is, `a` must be a type that implements both `Ord` and `Num`.
*Ad-hoc polymorphism* occurs when a function is defined over several different types, acting in a different way for each type. A typical example is overloaded multiplication: the same symbol may be used to denote multiplication of integers and multiplication of floating point values.
*Parametric polymorphism* occurs when a function is defined over a range of types, acting in the same way for each type. A typical example is the `length` function, which act in the same way on a list of integers and a list of floating point number. Parametric polymorphism refers to fully polymorphic parameters. *Parametricity* means that the behavior of a function with respect to the types of its (parametrically polymorphic) arguments is uniform. The behavior can not change just because it was applied to an argument of a different type.

Curried functions (default): Many functions, one argument apiece. ex.: a -> a -> a
Uncurried functions: One function, many arguments. ex.: `(a -> a) -> a`
Higher-order functions yield more function values as each argument is applied until there are no more (->) type constructors and it terminates in a non-function value.
The term *sectioning* specifically refers to partial application of infix operators, which has a special syntax and allows you to choose whether the argument you’re partially applying the operator to is the first or second argument.

The term *partial function* refers to something different other than *partial application of a function*. A partial function is one that doesn’t handle all the possible cases, so there are possible scenarios in which we haven’t defined any way for the code to evaluate.
`read` is a *partial function* because it doesn’t return a proper value as a result for *all possible inputs*.

# TYPECLASS INSTANCES
## EXAMPLES
```haskell
data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun

-- day of week and numerical day of month
data Date =
    Date DayOfWeek Int

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Weds Weds = True
    (==) Thu Thu = True
    (==) Fri Fri = True 
    (==) Sat Sat = True 
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date weekday dayOfMonth)
        (Date weekday' dayOfMonth') =
        weekday == weekday' && dayOfMonth == dayOfMonth'

data Identity a = Identity a
instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'
```

# TUPLES
A tuple is an ordered grouping of values. In Haskell, you cannot have a tuple with only one element, but there is a zero tuple also called unit or `()`. The types of the elements of tuples are allowed to vary, so you can have both `(String, String)` or `(Integer, String)`. Tuples in Haskell are the usual means of expressing an anonymous product.
The tuple in Haskell is a type that allows you to store and pass around multiple values within a single value. Tuples have a distinctive, builtin syntax that is used at both type and term levels, and each tuple has a fixed number of constituents. We refer to tuples by how many constituents are in each tuple: the two-tuple or pair, for example, has two values inside it `(x, y)`; the three-tuple or triple has three `(x, y, z)`, and so on. This number is also known as the *tuple’s arity*. The values within a tuple do not have to be of the same type. The two-tuple is expressed at both the type level and term level with the constructor (,). The `(x, y)` syntax of the tuple is special. The constructors you use in the type signatures and in your code (terms) are syntactically identical even though they’re different things.

# LISTS
Lists in Haskell are another type used to contain multiple values within a single value. However, they differ from tuples in three important ways: First, all constituents of a list must be of the same type. Second, Lists have their own distinct `[]` syntax. Like the tuple syntax, it is used for both the type constructor in type signatures and at the term level to express list values. Third, the number of constituents within a list can change as you operate on the list, unlike tuples where the arity is set in the type and immutable. 

# FOLDS
```haskell
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- for simplicity
foldr :: (a -> b -> b) -> b -> [a]-> b
foldl :: (b -> a -> b) -> b -> [a] -> b
map :: (a -> b) -> [a] -> [b]
```
Folds, as a general concept, are called *catamorphism*. Catamorphism are a means of deconstructing data. If the *spine* of a list is the structure of a list, then a fold is what can reduce that structure.
Where a `map` applies a function to each member of a list and returns a list, a `fold` replaces the cons contructors with the function and reduces the list.
Examples of mapping function are `sum`, `length`, `product` and `concat` with, respectively, "0", "0", "1" and "[]" as *identity value*.
```haskell
last (scanl f z xs) = foldl f z xs
head (scanr f z xs) = foldr f z xs
```
```haskell
Prelude> let f = (\x y -> concat ["(",x,"+",y,")"])
Prelude> foldr f "0" (map show [1..5])
"(1+(2+(3+(4+(5+0)))))"
Prelude> foldl f "0" (map show [1..5])
"(((((0+1)+2)+3)+4)+5)"
Prelude> foldr (:) [] [1..3]
[1,2,3]
Prelude> foldl (flip (:)) [] [1..3]
[3,2,1]
```
An important difference between `foldr` and `foldl` is that a left fold has the successive steps as its first argument. The next recursion of the spine isn't intermediated by the folding function as it is in `foldr`, which also means recursion of the spine is unconditional. Having a function that doesn't force evaluation of either of its arguments won't change anything. 
This feature means that `foldl` is inappropriate with lists that are or could be infinite, but the combination of the *forced spine evaluation* with *non-strictness* means that it is inappropriate even for long lists, as the forced evaluation of the spine affects performance negatively. Because `foldl` must evaluate its whole spine before it starts evaluating values in each single cell, it accumulates a pile of unevaluated values as it traverse the spine.
