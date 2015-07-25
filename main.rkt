#lang typed/racket/base

(provide ?<- ?<-2)

;; Option monadic bind:

(: ?<- (All (a b) ((U (a -> b) (a -> (Option b))) (Option a)
                   -> (Option b))))
(define (?<- f v)
  (if (boolean? v) #f (f v)))

(: ?<-2 (All (a b c)
             ((U (a b -> c) (a b -> (Option c))) (Option a) (Option b)
              -> (Option c))))
(define (?<-2 f v1 v2)
  (if (or (boolean? v1) (boolean? v2)) #f (f v1 v2)))

(module+ test
  (require typed/rackunit)

  (: f (Real -> Real))
  (define (f x) (+ 5 x))

  (: g (Real -> (Option Real)))
  (define (g x) (if (zero? x) #f (/ 10 x)))

  (: h (Real Real -> (Option Real)))
  (define (h x y)
    (if (= x y) #f (/ 1 (abs (- x y)))))

  (check-false (?<- f #f))
  (check-equal? (?<- f 3) 8)
  (check-false (?<- f (g 0)))
  (check-equal? (?<- f (g 1)) 15)

  (check-false (?<-2 h (f 5) (g 1)))          ; failure in h
  (check-false (?<-2 h (?<- f (g 0)) (g 10))) ; left arg fails
  (check-false (?<-2 h (?<- f (g 1)) (g 0)))  ; right arg fails

  (check-equal? (?<-2 h (?<- f (g 2)) (g 0.5))
                0.1)
  )

