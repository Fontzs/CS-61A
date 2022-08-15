(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (interleave lst1 lst2) 
(cond ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))
)
)

(define (my-filter pred lst) 
(cond ((null? lst) nil) 
    ((pred (car lst)) (cons (car lst) (my-filter pred (cdr lst))))
    (else (my-filter pred (cdr lst)))
)
)

(define (concatenate s) 
    (define (helper lst cur) 
            (if (null? lst)  
                cur 
                (helper (cdr lst) (append cur (car lst)))
            )
    )
    

    (helper s nil)


)
