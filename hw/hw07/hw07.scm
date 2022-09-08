(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (cons keys (cons values nil))  
)
;another version:
;(list keys values)



(define (get-keys-kwlist1 kwlist) 
  (car kwlist)
)

(define (get-values-kwlist1 kwlist)
  (car (cdr kwlist))  
)

(define (make-kwlist2 keys values)
(if (null? keys) nil
  (let ((rest (make-kwlist2 (cdr keys) (cdr values))))
    (cons (list (car keys) (car values)) rest)
)
)  
)

(define (get-keys-kwlist2 kwlist) 
  (if (null? kwlist)
  nil
  (let ((rest (get-keys-kwlist2 (cdr kwlist))))
  (cons (car (car kwlist)) rest)
)
)
)
;this is my solution, here I'll record two
;standard solution from cs61a team
;(map (lambda (x) (car x)) kwlist)
;
;(if (null? kwlist)
;  nil
;  (cons (car (car kwlist)))
;     (get-keys-kwlist2 (cdr kwlist)))  
;)


(define (get-values-kwlist2 kwlist)
  (if (null? kwlist)
    nil
    (cons (cadr (car kwlist)) (get-values-kwlist2 (cdr kwlist)))
  )  
)
;(map (lambda (x) (cadr)) kwlist)

(define (add-to-kwlist kwlist key value)
  (make-kwlist 
    (append (get-keys-kwlist kwlist) (list key))
    (append (get-values-kwlist kwlist) (list value)))  

)

(define (get-first-from-kwlist kwlist key)
  (if (null? (get-keys-kwlist kwlist)) 
    nil
    (let ((nk (get-keys-kwlist kwlist)) 
      (nv (get-values-kwlist kwlist)))
    (cond
      ((equal? (car nk) key) (car nv))
      (else (get-first-from-kwlist 
        (make-kwlist (cdr nk) (cdr nv)) key))
      
    
    )
    )
  )
)
