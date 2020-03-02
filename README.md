# Scheme-Interpreter
CS61A Final Project (Fall 2019)
A scheme interpreter built in Python, with built-in methods such as map, define-lambda.
This project demands a deep understanding in the read-eval-print feature of a program, being able to recursively evaluate expressions, and knowledge on lexcial scoping vs dynamic scoping.

```scheme
scm> 2020
2020
scm> (define (map f lst) (if (null? lst) nil (cons (f (car lst)) (map f (cdr lst)))))
map
scm> ((lambda (a b) (+ a b)) 1 2)
3
scm> (define-macro (for formal iterable body)
          (list 'map (list 'lambda (list formal) body) iterable))
for
scm> (for i '(1 2 3) (print (* i i)))
1
4
9
(null null null)
```
