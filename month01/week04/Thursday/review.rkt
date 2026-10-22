;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Ex01

;; honor? : Student -> Boolean

(define-struct student(name quiz project))

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define (final-score student)
  (+ (* (student-quiz student) 0.4) (* (student-project student) 0.6)))

(define (honor? s)
  (>= (final-score s) 90))

;; эцсийн оноо 90 ба түүнээс дээш бол #true
(check-expect (honor? mina) #true)
(check-expect (honor? aki) #false)
(check-expect (honor? (make-student "Nine" 90 90)) #true)

;; Ex02

;; swap-scores : Student -> Student

(define (swap-scores s)
  (make-student (student-name s) (student-project s) (student-quiz s)))

;; quiz ба project оноог сольсон шинэ сурагч
(check-expect (swap-scores aki) (make-student "Aki" 90 80))
(check-expect (swap-scores sora) sora)

;; Ex03

;; pass-label : Student -> Image

(define (passing? s)
  (>= (final-score s) 60))

(define (pass-label s)
  (if (passing? s)
      (text "PASS" 16 "green")
      (text "FAIL" 16 "red")
  ))

;; тэнцсэн бол ногоон "PASS", үгүй бол улаан "FAIL" (16)
(check-expect (pass-label aki) (text "PASS" 16 "green"))
(check-expect (pass-label ren) (text "FAIL" 16 "red"))

