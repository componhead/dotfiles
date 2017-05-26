sealed Trait TailRec[A]
case class Return[A](a: A) extends TailRec
case class Suspend[A](resume: () => TailRec[A]) extends TailRec[A]

  def composeAll[A](fs: List[A => A]): A => A = {
    a1 => (fs.foldRight(Return(_)) {
      (f,r) => a2 => Suspend(() => f(r(a2)))
    })(a1.run)
  }
