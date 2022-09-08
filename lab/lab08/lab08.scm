(define (over-or-under num1 num2) 
    (cond ((< num1 num2) -1)
          ((= num1 num2) 0)
          ((> num1 num2) 1)  

    )

)

(define (composed f g) (
    lambda (x) (f (g  x))
))

(define (square n) (* n n))

(define (pow base exp) 
(
    if (= exp 1) base 
    (if (= 1 (modulo exp 2)) 
    (* base  (pow base (- exp 1))) 
    (square (pow base (/ exp 2)))
    )
)
                        
)

(define (ascending? lst) 
 (if (null? (cdr lst)) #t
  (if (> (car lst) (car (cdr lst)))  #f 
   (ascending? (cdr lst))
  )  
    
 )
)
