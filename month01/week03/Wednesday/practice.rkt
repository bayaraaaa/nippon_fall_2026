;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; List-of-numbers

;; Ex01

;; contains? : Number List-of-numbers -> Boolean

(define (contains? number numbers)
  (cond
    [(empty? numbers) #f]
    [(= number (first numbers) 5) #true]
    [else (contains? number (rest numbers))]
    ))

;; target list дотор байвал #t
(check-expect (contains? 5 empty) #f)
(check-expect (contains? 5 (cons 3 (cons 5 (cons 7 empty)))) #t)
(check-expect (contains? 4 (cons 3 (cons 5 empty))) #f)

;; Ex02

;; count-greater-than : List-of-numbers Number -> Number

(define (count-greater-than numbers limit)
  (cond
    [(empty? numbers) 0]
    [else
    (if (> (first numbers) limit) 
            (+ 1 (count-greater-than (rest numbers) limit))
         (count-greater-than (rest numbers) limit))]))

 
;; limit-ээс ИХ (тэнцүү биш) тоонуудын тоо
(check-expect (count-greater-than empty 5) 0)
(check-expect (count-greater-than (cons 2 (cons 8 (cons 10 empty))) 5) 2)
(check-expect (count-greater-than (cons 5 (cons 6 empty)) 5) 1)   ; 5 тоологдохгүй

;; NEList-of-numbers

;; Ex01

;; find-max : NEList-of-numbers -> Number

(define (find-max numbers)
  (cond
    [(empty? (rest numbers)) (first numbers)]
    
    [else (max (first numbers) (find-max (rest numbers)))
          ]))


;; хамгийн их утга. max ашиглаж болно: (max 3 8) → 8
(check-expect (find-max (cons 70 empty)) 70)
(check-expect (find-max (cons 70 (cons 95 (cons 63 empty)))) 95)
(check-expect (find-max (cons -5 (cons -2 empty))) -2)

;; Ex02

;; average : NEList-of-numbers -> Number

(define (count-items items)
  (cond
    [(empty? items) 0]
    [else (+ 1
             (count-items (rest items)))]
    ))

(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]
    ))

(define (average numbers)
  (/ (sum numbers) (count-items numbers)))



;; дундаж = sum / count-items. Хоосон биш тул 0-д хуваахгүй.
(check-expect (average (cons 80 empty)) 80)
(check-expect (average (cons 70 (cons 82 (cons 95 (cons 63 (cons 88 empty)))))) 79.6)



