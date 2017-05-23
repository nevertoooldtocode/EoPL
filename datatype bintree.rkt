#lang s-exp "eopl-printing.rkt"

(define-datatype bintree bintree?
  (leaf-node
   (num integer?))
  (interior-node
   (key symbol?)
   (left bintree?)
   (right bintree?)))

(define (bintree->list tree)
  (cases bintree tree
    (leaf-node (num) (list 'leafnode num))
    (interior-node (key left right)
                   (list 'interior-node
                         key
                         (bintree->list left)
                         (bintree->list right)))))

(define (sum-leaves tree)
  (cases bintree tree
    (leaf-node (num) num)
    (interior-node (key left right)
                   (+ (sum-leaves left)
                      (sum-leaves right)))))

(define (max-interior tree)
  (define (iter max-node max-sum)
    (cases bintree tree
      (leaf-node (num) (cons max-node max-sum))
      (interior-node (key left right)
                     (let ([left-sum (sum-leaves left)]
                           [right-sum (sum-leaves right)])
                   
                         
                                        
(define tree-1
  (interior-node 'foo (leaf-node 2) (leaf-node 3)))
(define tree-2
  (interior-node 'bar (leaf-node -1) tree-1))
(define tree-3
  (interior-node 'baz tree-2 (leaf-node 1)))

(equal? (bintree->list tree-1)
        '(interior-node foo (leafnode 2) (leafnode 3)))
(equal? (bintree->list tree-3)
'(interior-node
  baz
  (interior-node bar (leafnode -1) (interior-node foo (leafnode 2) (leafnode 3)))
  (leafnode 1)))

(= (sum-leaves tree-1) 5)
(= (sum-leaves tree-2) 4)
(= (sum-leaves tree-3) 5)

(eq? (max-interior tree-1 'foo))
(eq? (max-interior tree-2 'foo))


