#lang info
(define collection "option-bind")
(define deps '("base" "typed-racket-lib"))
(define build-deps '("scribble-lib" "racket-doc" "typed-racket-lib"
                     "typed-racket-more"))
(define scribblings '(("scribblings/option-bind.scrbl" ())))
(define pkg-desc "Shortcuts for applying TR functions to Option values.")
(define version "1.0.1")
(define pkg-authors '(jteach))
