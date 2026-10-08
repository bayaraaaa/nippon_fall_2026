;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex01

(define (days-to-hours day)
  (* day 24))
;; days-to-hours : Number -> Number
(check-expect (days-to-hours 2) 48)

(define (hours-to-seconds hours)
  (* hours 3600))
;; days-to-seconds : Number -> Number

(define (days-to-seconds day)
  (hours-to-seconds (days-to-hours day)))
;; days-to-hours, hours-to-seconds-г дуудна
(check-expect (days-to-seconds 1) 86400)

;; Ex02

;; outside-range? : Number -> Boolean
(define (in-range? n)
  (and (>= n 1) (<= n 10)))

(define (outside-range? n)
  (not (in-range? n)))
;; n нь 1–10-ийн гадна бол #t
(check-expect (outside-range? 0) #t)
(check-expect (outside-range? 1) #f)
(check-expect (outside-range? 10) #f)
(check-expect (outside-range? 11) #t)

;; Ex03

;; grade-change : Number Number -> String
(define (grade-change a b)
  (cond
    [(< a b) "up"]
    [(= a b) "same"]
    [else "down"]
   ))

;; хуучин оноо, шинэ оноо → "up", "same", "down"
(check-expect (grade-change 70 80) "up")
(check-expect (grade-change 80 80) "same")
(check-expect (grade-change 90 80) "down")