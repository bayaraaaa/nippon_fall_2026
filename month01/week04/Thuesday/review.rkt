;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex01 

;; sum-digits-3 : Number -> Number

(define (sum-digits-3 n)
  (+ (quotient n 100)                     ; Gets the hundreds digit
     (quotient (remainder n 100) 10)      ; Gets the tens digit
     (remainder n 10)))                   ; Gets the ones digit

;; гурван оронтой тооны цифрүүдийн нийлбэр. remainder, quotient ашигла.
(check-expect (sum-digits-3 507) 12)
(check-expect (sum-digits-3 100) 1)
(check-expect (sum-digits-3 999) 27)

;; Ex02

;; quiz-gap : Student -> Number

(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))



(define (quiz-gap a-student)
  (abs (- (student-quiz a-student) 
          (student-project a-student))))

;; quiz ба project онооны зөрүү (үргэлж эерэг). abs ашигла.
(check-expect (quiz-gap aki) 10)
(check-expect (quiz-gap sora) 0)
(check-expect (quiz-gap (make-student "Zul" 90 70)) 20)

;; Ex03

;; count-a-scores : List-of-numbers -> Number

(define (count-a-scores list)
  (cond
    [(empty? list) 0]
    [else
     (if (>= (first list) 90)
         (+ 1 (count-a-scores (rest list)))
         (count-a-scores (rest list)))]))

;; 90 ба түүнээс дээш оноо хэд байгааг тоолно
(check-expect (count-a-scores empty) 0)
(check-expect (count-a-scores (list 90 89 100)) 2)