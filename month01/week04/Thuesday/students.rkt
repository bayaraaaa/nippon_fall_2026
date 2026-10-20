;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

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

;; Ex01

;; final-score : Student -> Number

(define (final-score student)
  (+ (* (student-quiz student) 0.4) (* (student-project student) 0.6)))

;; эцсийн оноо: quiz 40%, project 60%
(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score (make-student "Q" 100 0)) 40)
(check-expect (final-score (make-student "P" 0 100)) 60)

;; Ex02


;;


(final-score ren)
(final-score (make-student "Edge" 59 61))
(final-score (make-student "Low" 61 59))


;; passing? : Student -> Boolean

(define (passing? s)
  (>= (final-score s) 60))

;; эцсийн оноо 60 ба түүнээс дээш бол #true
(check-expect (passing? sora) #true)                          ; яг 60
(check-expect (passing? ren) #false)
(check-expect (passing? (make-student "Edge" 59 61)) #true)   ; 60.2
(check-expect (passing? (make-student "Low" 61 59)) #false)   ; 59.8


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

;; Ex03

;; rename : Student String -> Student
(define (rename s new-name)
  (make-student new-name
                (student-quiz s)
                (student-project s)))

(rename aki "Akira")   ; → (make-student "Akira" 80 90)
aki                    ; → (make-student "Aki" 80 90)


;; Ex04

;; add-bonus : Student Number -> Student

(define (add-bonus s bonus)
  (make-student (student-name s) (student-quiz s) (min 100(+ (student-project s) bonus))))

;; project оноонд bonus нэмнэ, гэхдээ 100-аас хэтрэхгүй (min ашигла)
(check-expect (add-bonus aki 5) (make-student "Aki" 80 95))
(check-expect (add-bonus mina 20) (make-student "Mina" 95 100))
(check-expect (add-bonus ren 0) ren)

;; Ex05

;; retake-quiz : Student Number -> Student

(define (retake-quiz s new-quiz)
  (make-student (student-name s) (max (student-quiz s) new-quiz) (student-project s)))

;; quiz-ийг дахин өгсөн: шинэ оноо их бол түүнийг, үгүй бол хуучныг үлдээнэ (max)
(check-expect (retake-quiz ren 70) (make-student "Ren" 70 55))
(check-expect (retake-quiz aki 50) aki)

;; student-card

;; Ex01

;; card-color : Student -> String

(define (card-color student)
  (if (passing? student)
  "green"
  "red"
  ))

;; тэнцсэн бол "green", үгүй бол "red"
(check-expect (card-color aki) "green")
(check-expect (card-color ren) "red")

;; Ex02

;; student-card : Student -> Image

(define (student-card studant)
  (overlay (above (text (student-name studant) 18 "black") (text (student-grade studant) 24 (card-color studant)))
                       (rectangle 120 70 "outline" (card-color studant))))

;; нэр (18, хар), доор нь үсгэн үнэлгээ (24, card-color), card-color хүрээ (120 × 70)
(check-expect (student-card aki)
              (overlay (above (text "Aki" 18 "black") (text "B" 24 "green"))
                       (rectangle 120 70 "outline" "green")))
(check-expect (student-card ren)
              (overlay (above (text "Ren" 18 "black") (text "F" 24 "red"))
                       (rectangle 120 70 "outline" "red")))