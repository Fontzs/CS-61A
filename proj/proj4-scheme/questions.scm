(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  'replace-this-line'replace-this-line
  (define (help idx ele)
      (if (null? ele) nil
          (cons (list idx (car ele)) (help (+ idx 1) (cdr ele))))) (help 0 s)
  )
  ; END PROBLEM 15
  
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? list1 list2)
  ; BEGIN PROBLEM 16
  (cond ((null? list1) list2)
       ((null? list2) list1)
       (else
            (if (ordered? (car list1) (car list2))
                (cons (car list1) (merge ordered? (cdr list1) list2))
                (cons (car list2) (merge ordered? list1 (cdr list2)))
            )
        )
  )
  )
  ; END PROBLEM 16

