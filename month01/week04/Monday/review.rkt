;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; sum-passing : List-of-numbers -> Number

;; Ex01

(define (sum-passing numbers)
  (cond
    [(empty? numbers) 0]
    [else
       (if (>= (first numbers) 60)
           (+ (first numbers) (sum-passing (rest numbers)))
           (sum-passing (rest numbers))
           )
     ]
  ))


;; 60 ба түүнээс дээш оноонуудын нийлбэр
(check-expect (sum-passing empty) 0)
(check-expect (sum-passing (list 59 60 100)) 160)
(check-expect (sum-passing (list 10 20)) 0)

;; Ex02

;; all-passing? : List-of-numbers -> Boolean

(define (all-passing? l)
  (cond
    [(empty? l) #true]
    [(cons? l)
     (and (>= (first l) 60)
          (all-passing? (rest l)))]))

;; бүх оноо 60 ба түүнээс дээш бол #true. Хоосон list-д #true.
(check-expect (all-passing? empty) #true)
(check-expect (all-passing? (list 60 75)) #true)
(check-expect (all-passing? (list 60 59)) #false)

;; Ex03

;; score-dots : List-of-numbers -> Image

(define (grade-color score)
  (if (>= score 60)
      "green"
      "red"))

(define (grade-bar score)
  (circle 10 "solid" (grade-color score)))


(define (score-dots imgs)
  (cond
    [(empty? imgs) empty-image]
    [else (beside (grade-bar(first imgs))
                  (score-dots (rest imgs)))]))

;; оноо бүрийг радиус 10 тойрог болгож зэрэгцүүлнэ: 60+ ногоон, бусад улаан
(check-expect (score-dots empty) empty-image)
(check-expect (score-dots (list 70 40))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))
(check-expect (score-dots (list 60)) (circle 10 "solid" "green"))