;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct student(name quiz project))

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define (final-score student)
  (+ (* (student-quiz student) 0.4) (* (student-project student) 0.6)))

;; Ex01 

;; better-student : Student Student -> Student

(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))

;; эцсийн оноо нь их сурагч; тэнцүү бол эхнийх
(check-expect (better-student aki mina) mina)
(check-expect (better-student mina aki) mina)
(check-expect (better-student sora (make-student "Tie" 60 60)) sora)

;; Ex02

;; letter-grade : Number -> String
(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))


;; student-grade : Student -> String

(define (student-grade name)
  (letter-grade (final-score name)))

;; эцсийн онооны үсгэн үнэлгээ
(check-expect (student-grade aki) "B")
(check-expect (student-grade sora) "D")
(check-expect (student-grade mina) "A")
(check-expect (student-grade ren) "F")
(check-expect (student-grade (make-student "Nine" 90 90)) "A")

;; same-grade? : Student Student -> Boolean

(define (same-grade? a b) (string=? (student-grade a) (student-grade b)))

;; хоёулаа ижил үсгэн үнэлгээтэй бол #true. string=? ашигла.
(check-expect (same-grade? aki (make-student "Ben" 85 85)) #true)
(check-expect (same-grade? aki mina) #false)

;; Ex03

;; points-to-pass : Student -> Number

(define (points-to-pass s) (max 0 (- 60 (final-score s))))

;; 60 хүрэхэд хэдэн оноо дутуу вэ; тэнцсэн бол 0
(check-expect (points-to-pass ren) 9)
(check-expect (points-to-pass sora) 0)
(check-expect (points-to-pass aki) 0)
