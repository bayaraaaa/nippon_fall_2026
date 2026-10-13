;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; List

;; Example

(define xs (cons 10 (cons 20 (cons 30 empty))))

(first xs)        ; 10
(rest xs)         ; (cons 20 (cons 30 '()))
(first (rest xs)) ; 20
(empty? xs)       ; #false
(cons? xs)        ; #true
(empty? empty)    ; #true

;; Ex01

;; second-item : List-of-numbers -> Number

(define first-item (cons 4 (cons 7 (cons 9 empty))))
(define (second-item first-item)
  (first (rest first-item)))

;; дор хаяж 2 элементтэй list-ийн хоёр дахь утга
(check-expect (second-item (cons 4 (cons 7 empty))) 7)
(check-expect (second-item (cons 4 (cons 7 (cons 9 empty)))) 7)

;; Ex02

;; sum-first-two : List-of-numbers -> Number
(define (sum-first-two first-item)
  (+ (first first-item) (first (rest first-item))))

;; дор хаяж 2 элементтэй list-ийн эхний хоёр утгын нийлбэр
(check-expect (sum-first-two (cons 4 (cons 7 (cons 9 empty)))) 11)

;; Ex03

;; starts-with-zero? : List-of-numbers -> Boolean

;; (define List-of-numbers (cons 5 (cons 0 empty)))
(define (starts-with-zero? List-of-numbers)
  (cond
    [(empty? List-of-numbers) #f]
    [(= (first List-of-numbers) 0) #t]
    [else #f]
  )
)

;; хоосон биш, эхний утга нь 0 бол #t. Хоосон list дээр алдаа гаргахгүй байх ёстой.
(check-expect (starts-with-zero? empty) #f)
(check-expect (starts-with-zero? (cons 0 empty)) #t)
(check-expect (starts-with-zero? (cons 5 (cons 0 empty))) #f)

;; one-item? : List-of-numbers -> Boolean

(define (one-item? item)
  (cond
    [(empty? item) #f]
    [(empty? (rest item)) #t]
    [else #f]
  )
)


;; яг нэг элементтэй бол #t
(check-expect (one-item? empty) #f)
(check-expect (one-item? (cons 1 empty)) #t)
(check-expect (one-item? (cons 1 (cons 2 empty))) #f)