;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct student(name quiz project))

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define students (list aki sora mina ren))

(define (final-score student)
  (+ (* (student-quiz student) 0.4) (* (student-project student) 0.6)))

(define (honor? s)
  (>= (final-score s) 90))

(define (passing? s)
  (>= (final-score s) 60))

;; Ex01

;; count-honor : List-of-students -> Number


(define (count-honor s)
  (cond
    [(empty? s) 0]
    [(cons? s)
     (if (honor? (first s))
         (+ 1 (count-honor (rest s)))
         (count-honor (rest s)))]))
;; эцсийн оноо 90+ сурагчийн тоо (Пүрэвийн honor? ашигла)
(check-expect (count-honor empty) 0)
(check-expect (count-honor students) 1)
(check-expect (count-honor (list mina (make-student "Nine" 90 90))) 2)

;; Ex02

;; failing-names : List-of-students -> List-of-strings

(define (failing-names alost)
  (cond
    [(empty? alost) empty]
    [else ...])) 

;; тэнцээгүй сурагчдын нэр
(check-expect (failing-names empty) empty)
(check-expect (failing-names students) (list "Ren"))