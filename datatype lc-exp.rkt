#lang s-exp "eopl-printing.rkt"

(define identifier? symbol?)

(define-datatype lc-exp lc-exp?
  (var-exp
   (var identifier?))
  (lambda-exp
   (bound-var identifier?)
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?)))

(define (occurs-free? x exp)
  (cases lc-exp exp
    (var-exp (var) (not (eq? x var)))
    (lambda-exp (bound-var body)
                (and
                 (not (eq? x bound-var))
                 (occurs-free? x body)))
    (app-exp (rator rand)
             (or
              (occurs-free? x rator)
              (occurs-free? x rand)))))

(lc-exp? (var-exp 'x))
(occurs-free? 'x (var-exp 'y))
(not (occurs-free? 'x (var-exp 'x)))


