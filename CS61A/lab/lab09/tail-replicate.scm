(define (tail-replicate x n)
  ; BEGIN
  (define (helper n cur) (if (= n 0) cur (helper (- n 1) (cons x cur)))) (helper n '())
  ; END
)