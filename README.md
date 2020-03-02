# Scheme-Interpreter
CS61A Final Project (Fall 2019)
A scheme interpreter built in Python, with built-in methods such as map, define-lambda.

```scheme
scm> 2020
2020
(define (map f lst) (if (null? lst) nil (cons (f (car lst)) (map f (cdr lst)))))
```
