;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; functions

(define-struct student(name quiz project))

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define students (list aki sora mina ren))


(define (fn-for-los l)
  (cond [(empty? l) ...]
        [else (... (fn-for-student (first l))
                   (fn-for-los (rest l)))]))

(define (final-score student)
  (+ (* (student-quiz student) 0.4) (* (student-project student) 0.6)))

(define (honor? s)
  (>= (final-score s) 90))

(define (passing? s)
  (>= (final-score s) 60))

(define (letter-grade n)
  (cond [(>= n 90) "A"]
        [(>= n 80) "B"]
        [(>= n 70) "C"]
        [(>= n 60) "D"]
        [else "F"]))

(define (student-grade name)
  (letter-grade (final-score name)))


(define (add-bonus s bonus)
  (make-student (student-name s) (student-quiz s) (min 100(+ (student-project s) bonus))))

(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))

(define my-class (list aki sora mina ren
                      (make-student "bayaraa" 100 100)
                      (make-student "pro" 99 99)))

;; endfunctions

;; Ex01

;; count-at-least : List-of-students Number -> Number


(define (count-at-least s n)
  (cond
    [(empty? s) 0]
    [else (if (>= (final-score (first s)) n)
              (+ 1 (count-at-least (rest s) n))
              (count-at-least (rest s) n)
           )]))


;; эцсийн оноо нь n ба түүнээс дээш сурагчийн тоо
(check-expect (count-at-least empty 50) 0)
(check-expect (count-at-least students 80) 2)
(check-expect (count-at-least students 0) 4)

;; Ex02

;; names-with-grade : List-of-students String -> List-of-strings

(define (names-with-grade s n)
  (cond
    [(empty? s) empty]
    [(string=? (student-grade (first s)) n)
              (cons (student-name (first s))
                    (names-with-grade (rest s) n))
           ]
    [else (names-with-grade (rest s) n)
     ]))

;; өгөгдсөн үнэлгээтэй сурагчдын нэр
(check-expect (names-with-grade students "A") (list "Mina"))
(check-expect (names-with-grade students "C") empty)
(check-expect (names-with-grade empty "A") empty)

;; Ex03

;; grade-row : List-of-students -> Image

(define (grade-color score)
  (if (passing? score)
      "green"
      "red"))

(define (grade-bar score)
  (circle 10 "solid" (grade-color score)))


(define (grade-row s)
  (cond
    [(empty? s) empty-image]
    [else (beside (grade-bar(first s))
                  (grade-row (rest s)))]))

;; сурагч бүрт радиус 10 тойрог: тэнцсэн бол ногоон, үгүй бол улаан
(check-expect (grade-row empty) empty-image)
(check-expect (grade-row (list aki ren))
              (beside (circle 10 "solid" "green") (circle 10 "solid" "red")))