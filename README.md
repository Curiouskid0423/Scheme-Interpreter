# Scheme-Interpreter
CS61A Final Project (Fall 2019)
```scheme
(define (map f lst) (if (null? lst) nil (cons (f (car lst)) (map f (cdr lst)))))
```
