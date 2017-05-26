                     ┌----------┐
                     | Iterable |
                     └----------┘
                        /  |  \
                       /   |   \
                      /    |    \
                     /     |     \
                    /      |      \
             ┌-----┐    ┌-----┐    ┌--------------------------------┐
             | Set |    | Map |    |               Seq              |
             └-----┘    └-----┘    └--------------------------------┘
                                   /    |         |          .      .
                                  /     |         |          .       .
                                 /      |         |          .        .
                        ┌--------┐  ┌------┐  ┌-------┐  ┌-------┐   ┌--------┐
                        | Vector |  | List |  | Range |  | Array |   | String |
                        └--------┘  └------┘  └-------┘  └-------┘   └--------┘

Array e String possono essere trattate come sottoclassi di Seq e hanno metodi per trasformarli in Seq ma sono classi Java. 
Tra le Sequence: usare List per le ricorsioni (con i cons  h::t), usare i Range per i generatori e usare i Vector per l'indicizzazione (e per la performance)

```scala
xs flatmap f == (xs map f).flatten
```

for ( s ) yield e
  s = sequenza di generatori e filtri (che inizia con dei generatori)
  e = espressione il cui valore è ritornato da un'iteratore

esempio
```scala
for {
  i <- 1 until n
  j <- 1 until i
  if isPrime(i + j)
} yield (i, j)

def scalarProduct(xs: List[Double], ys: List[Double]) = {
  (for ( (x,y) <- xs zip ys ) yield x * y).sum
}
```

Set sono molto simili alle Sequence e ne condividono molte funzioni, inoltre si scrivono nello stesso modo. 
Peculiarità di Set è di essere NON ORDINATI e di NON AVERE DUPLICATI. L'operazione fondamentale su Set è `contains`.

Map[Key, Value] è anche una classe che estende la funzione Key => Value
Se Map viene usato con `miaMappa("miachiave")` (usando quindi il metodo `apply`) dove `miachiave` è una chiave inesistente, si ottiene un `NoSuchElementException`, se, invece, viene usato il metodo `get` viene restituito un `Option` (nel caso specifico, un `None`). Un altro modo è usare il metodo `withDefaultValue` che traforma una mappa, da funzione parziale a funzione totale; in questo modo non si avrà più l'eccezione ma il valore di default assegnato.

Definizione di Option:
```scala
trait Option[+A]
case class Some[+A](value: A) extends Option[A]
object None extends Option[Nothing]
```

Un metodo utile in Map è `groupBy`. Un esempio utile è rappresentato da una sorta di dizionario che, data una List[String] crea una Map[Char, List[String]] con la chiave il primo carattere della stringa e come valore la lista di tutte le stringhe che iniziano per quel carattere
```scala
val fruits = List("apples,"pear","pineapples","orange")
val dict = fruits groupBy (_.head)  // Map(p -> List("pear", "pineapple"), a -> List("apples"), o -> List("orange"))
```

Tutte le collections condividono i seguenti metodi:
```
 map
 flatMap
 filter
 foldLeft
 foldRight

```

La seguente espressione:
(1 until n) flatMap (i => (1 until i) filter (j => isPrime(i+j)) map (j => (i, j)))
si può scrivere come:
for {
    i <- 1 until n
    j <- 1 until i
    if isPrime(i+j)
} yield (i,j)


In generale
pat <- expr è tradotto in

x <- expr withFilter {
    case pat => true
    case _ => false
} map {
    case pat => x
}


ESPRESSIONI con `for`
```scala
for(x <- e1) yield e2
    //tradotto dal compilatore in
e1.map(x => e2)

for(x <- e1 if f; s) yield e2
    // tradotto dal compilatore in
for(x <- e1.withFilter(x => f); s) yield e2

for(x <- e1; y<- e1; s) yield e3
    // tradotto dal compilatore in
e1.flatMap(x => for(y <- e2; s) yield e3)

def map[T, U](xs: List[T], f: T => U): List[U] =
    for(x <- xs) yield f(x)

def flatMap[T, U](xs: List[T], f: T => Iterable[U]): List[U] =
    for(x <- xs; y <- f(x)) yield y

def filter[T](xs: List[T], p: T => Boolean): List[T] =
    for(x <- xs if p(x)) yield x
```

Gli `Stream` sono simili alle `List` eccetto per il fatto che le lore `tail` sono valutate ON DEMAND.
Esempi con Stream:
```scala
val xs = Stream.cons(1, Stream.cons(2, Stream.cons(3, Stream.empty)))
val s = Stream(1,2,3)
val l = (1 to 100).toStream  // res0: Stream[Int] = Stream(1, ?)

// L'upper bound (hi) non è raggiunto a priori, quindi non viene creata tutta la struttura
def streamRange(lo: Int, hi: Int): Stream[Int] = {
    if(lo >= hi) Stream.empty
    else Stream.cons(lo, streamRange(lo + 1, hi))
}

// Crea la list intera da lo a hi
def listRange(lo: Int, hi: Int): List[Int] = {
    if(lo >= hi) Nil
    else lo :: listRange(lo + 1, hi)
}

// x #:: xs == Stream.cons(x, xs)
// x :: xs == List.cons(x, xs)

def from(n: Int): Stream[Int] = n #:: from(n+1)  // normalmente con List non terminerebbe con Stream è perfettamente lecito
```
