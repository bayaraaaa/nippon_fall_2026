;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; review
(require 2htdp/image)
;; Ex01

;; scale-all : List-of-numbers Number -> List-of-numbers

(define (scale-all numbers factor)
  (cond
    [(empty? numbers) empty]
    [else (cons (* (first numbers) factor) (scale-all (rest numbers) factor))]))

;; тоо бүрийг factor-оор үржүүлнэ
(check-expect (scale-all empty 10) empty)
(check-expect (scale-all (list 1 2) 10) (list 10 20))

;; Ex02

;; best-grade : NEList-of-numbers -> String

(define (letter-grade n)
  (cond
    [(>= n 90) "A"]
    [(>= n 80) "B"]
    [(>= n 70) "C"]
    [(>= n 60) "D"]
    [else "F"]
    
   ))

(define (highest numbers)
  (cond
    [(empty? numbers) 0]
    [else (max (first numbers) (highest (rest numbers)))]
  ))

(define (best-grade list)
  (cond
    [(empty? list) 0]
    [else (letter-grade (highest list))]))

;; хамгийн их онооны үсгэн дүн. Пүрэвийн highest, 2-р долоо хоногийн letter-grade-г дууд.
(check-expect (best-grade (list 70 95)) "A")
(check-expect (best-grade (list 59)) "F")

;; Ex03

;; badge-row : List-of-numbers -> Image

(define (grade-color score)
  (if (>= score 60)
      "green"
      "red"))

(define (grade-bar score)
  (circle 20 "solid" (grade-color score)))


(define (badge-row imgs)
  (cond
    [(empty? imgs) empty-image]
    [else (beside (grade-bar(first imgs))
                  (badge-row (rest imgs)))]))


;; оноо бүрийг 2-р долоо хоногийн pass-fail-badge-аар (60+ ногоон, бусад улаан, радиус 20) зүүнээс баруун тийш
(check-expect (badge-row empty) empty-image)
(check-expect (badge-row (list 60 59))
              (beside (circle 20 "solid" "green") (circle 20 "solid" "red")))