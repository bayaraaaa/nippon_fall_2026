;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grade-bar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; grade-color : Number -> String
(define (grade-color n)
  (cond
    [(>= n 90) "green"]
    [(>= n 80) "blue"]
    [(>= n 70) "gold"]
    [(>= n 60) "orange"]
    [else "red"]
   ))

;; дундаж оноо → өнгө: 90+ "green", 80–89 "blue", 70–79 "gold", 60–69 "orange", бусад "red"
(check-expect (grade-color 90) "green")
(check-expect (grade-color 89) "blue")
(check-expect (grade-color 60) "orange")
(check-expect (grade-color 59) "red")


;; Ex01

;; grade-bar : Number -> Image

(define (grade-bar number)
  (rectangle number 20 "solid" (grade-color number)))

;; өргөн нь оноо, өндөр 20, өнгө нь grade-color
(check-expect (grade-bar 95) (rectangle 95 20 "solid" "green"))
(check-expect (grade-bar 59) (rectangle 59 20 "solid" "red"))

;; Ex02

;; grade-bars : List-of-numbers -> Image

(define (grade-bars imgs)
  (cond
    [(empty? imgs) empty-image]
    [else (above (grade-bar (first imgs)) 
                 (grade-bars (rest imgs)))]))

;; оноо бүрийн grade-bar-ыг дээрээс доош
(check-expect (grade-bars empty) empty-image)
(check-expect (grade-bars (list 95 59)) (above (grade-bar 95) (grade-bar 59)))

;; Ex03

;; row-of-circles : Natural -> Image

(define (row-of-circles n)
  (if (= n 0)
      empty-image
      (beside (circle 10 "solid" "red")
              (row-of-circles (- n 1)))))

;; n ширхэг улаан тойрог (радиус 10) зүүнээс баруун тийш
(check-expect (row-of-circles 0) empty-image)
(check-expect (row-of-circles 2) (beside (circle 10 "solid" "red") (circle 10 "solid" "red")))