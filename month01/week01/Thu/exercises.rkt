;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercises) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Exercises01
(+ 6 9)

;; Exercises02
(- 18 7)

;; Exercises03
(* 8 6)

;; Exercises04
(/ 32 4)

;; Exercises05
(+ 12 15)

;; output 27

;; Exercises06
;; (4 + 6) × 3
(* (+ 4 6) 3)


;; Exercises07
;; 20 - (5 × 2)
(- 20 (* 5 2))

;; Exercises08
;; (15 + 25) / 5
(/ (+ 15 25) 5)

;; Exercises09
;; 7, 12, болон 5-ын нийлбэрийг бодох
(+ 7 12 5)


;; Exercises10
;; (10 + 2) × (8 - 3)
(* (+ 10 2) (- 8 3))

;; Exercises11
(+ (* 4 5) (/ 12 3))
(+ 20 (/ 12 3))
(+ 20 4)
;; output 24

;; Exercises12
(* (- 10 3) (+ 2 3))
(* 7 (+ 2 3))
(* 7 5)
;;output 35

;; Exercises13
(/ (* 6 4) (- 10 2))
(/ 24 (- 10 2))
(/ 24 8)
;;output 3

;; Exercises14
(+ 5 (* 3 (- 8 4)))
(+ 5 (* 3 4))
(+ 5 12)
;; output 17

;; Exercises15
;; Даалгавар: 10 болон 6-гийн нийлбэрийг 2-т хуваах.
;; алдаа (bug) байна (/ 10 (+ 6 2))
(/ (+ 10 6) 2)

;; Exercises16
(define price 1500)
(define quantity 4)
(* price quantity)

;; Exercises17
(define base-salary 800000)
(define bonus 150000)
(+ base-salary bonus)

;; Exercises18
(define width 8)
(define height 5)
(* width height)

;; Exercises19
(define total-items 100)
(define boxes 4)
(/ total-items boxes)

;; Exercises20
(define radius 7)
(define pi2 3)
(* (* radius radius) pi2)

;; Exercises21
(string-append "Hello " "World")


;; Exercises22
(define first-name "Bat")
(define last-name "Bold")
(string-append last-name " " first-name)

;; Exercises23
(define greeting "DrRacket")
(string-length greeting)

;; Exercises24
(define word "Programming")
(string-ith word 0)

;; Exercises25
(define text "Computer")
(substring text 0 3)

;; Exercises26
(define age 20)
(number->string age)
(string-append "Age: " (number->string age))

;; Exercises27
(define x 15)
(> x 10)

;; Exercises28
(define pass1 "secret")
(define pass2 "secret")
(string=? pass1 pass2)

;; Exercises29
(define score 85)
(if (>= score 50) "Pass" "Fail")

;; Exercises30
(define item-price 120)
(define item-count 3)

(if (> (* item-price item-count) 300) "Expensive" "Affordable")