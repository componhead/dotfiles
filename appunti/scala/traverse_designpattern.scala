def traverse[G[_],A,B](as: List[A])(f: A => G[B])(implicit G: Applicative[G]): G[List[B]] = {
  as.foldRight(G.pure(List[B]())) {
    (a,gbs) => G.apply2(f(a), gbs)(_ :: _)
  }
}

def sequence[G[_],A,B](as: List[G[A]])(implicit G: Applicative[G]): G[List[A]] = traverse(as)(ga=>ga)

