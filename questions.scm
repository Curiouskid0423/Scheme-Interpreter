(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
 (define (helper lst) (cons first lst))
 (map helper rests)
 )

(define (zip pairs)
    (list (map car pairs) (map cadr pairs)))

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
    (define (helper s num)
        (if (null? s)
            ()
            (cons (list num (car s)) (helper (cdr s) (+ num 1))))
    
    )
    (helper s 0)
)
  ; END PROBLEM 16

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
    (cond
        ((null? denoms) nil)
        ((= total 0) (cons nil nil)) 
        ((> (car denoms) total) (list-change total (cdr denoms)))
        (else
            (define with_first (list-change (- total (car denoms)) denoms))
            (define without_first (list-change total (cdr denoms)))
            (append (cons-all (car denoms) with_first) without_first)
        )
  )
)

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ; (let ((a 1) (b 2)) (+ a b))
        ; ((lambda (a b) (+ a b)) 1 2)
        ; (define a 2)
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (append (list form params) (map let-to-lambda body))
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           ; END PROBLEM 18
           (define params (car (zip values)))
           (define params_values (map let-to-lambda (cadr (zip values))))
           (define func_body (map let-to-lambda body))
           (cons (append (list 'lambda params) func_body) params_values)
           ))
        (else
         ; BEGIN PROBLEM 18
         (map let-to-lambda expr)
         ; END PROBLEM 18
         )))
