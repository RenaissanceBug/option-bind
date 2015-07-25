#lang scribble/manual
@require[@for-label[option-bind racket/base]]

@title{option-bind}
@author[@author+email["Jordan Johnson" "jmj@fellowhuman.com"]]

@defmodule[option-bind]{
  Provides for applying functions to values of type @racket[(Option x)],
  propagating false results.
}

@defproc[(?<- [f (U (a -> b) (a -> (Option b)))]
              [v (Option a)])
         (Option b)]{
  If @racket[v] is @racket[#f], produces @racket[#f]. Otherwise, produces
  @racket[(f v)].
}

@defproc[(?<-2 [f (U (a b -> c) (a b -> (Option c)))]
               [v1 (Option a)]
               [v2 (Option b)])
         (Option c)]{
  If @racket[v1] or @racket[v2] is @racket[#f], produces @racket[#f].
  Otherwise, produces @racket[(f v1 v2)].
}

