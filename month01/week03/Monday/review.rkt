;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; review

(require 2htdp/image)

;; Ex01

;; curved-average : Number Number Number -> Number
(define (sum s1 s2 s3)
  (+ s1 s2 s3))
(define (average3 s1 s2 s3)
  (/ (sum s1 s2 s3) 3))
(define (curved-average s1 s2 s3)
  (+ (average3 s1 s2 s3) 5))

;; гурван онооны дундаж дээр 5 оноо нэмнэ. Даваагийн average3-г дууд.
(check-expect (curved-average 60 70 80) 75)
(check-expect (curved-average 0 0 0) 5)

;; Ex02

;; honor-student? : Number Number -> Boolean
(define  (honor-student? score attendance)
  (and (>= score 90) (>= attendance 90)))

;; дундаж 90 ба түүнээс дээш, ирц 90 ба түүнээс дээш бол #t
(check-expect (honor-student? 90 90) #t)
(check-expect (honor-student? 89 100) #f)
(check-expect (honor-student? 100 89) #f)

;; Ex03

;; status-light : Number -> Image
(define (status-light n)
  (cond
    [(>= n 80) (circle 15 "solid" "green")]
    [(>= n 60) (circle 15 "solid" "yellow")]
    [else (circle 15 "solid" "red")]
  )
)

;; оноо 80+ ногоон, 60–79 шар, бусад улаан тойрог (радиус 15). (require 2htdp/image) мартаж болохгүй.
(check-expect (status-light 80) (circle 15 "solid" "green"))
(check-expect (status-light 79) (circle 15 "solid" "yellow"))
(check-expect (status-light 60) (circle 15 "solid" "yellow"))
(check-expect (status-light 59) (circle 15 "solid" "red"))