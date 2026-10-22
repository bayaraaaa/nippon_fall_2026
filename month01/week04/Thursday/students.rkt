;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname students) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; A List-of-students is one of:
;; - empty
;; - (cons Student List-of-students)

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

;; Ex01

;; count-passing : List-of-students -> Number


(define (count-passing l)
  (cond
    [(empty? l) 0]
    [else (if (passing? (first l))
              (+ 1 (count-passing (rest l)))
              (count-passing (rest l))
           )]))

;; тэнцсэн сурагчийн тоо
(check-expect (count-passing empty) 0)
(check-expect (count-passing students) 3)
(check-expect (count-passing (list ren)) 0)

;; Ex02

;; total-final : List-of-students -> Number

(define (total-final l)
  (cond
    [(empty? l) 0]
    [else (+ (final-score (first l))
             (total-final (rest l)))]))

;; бүх сурагчийн эцсийн онооны нийлбэр
(check-expect (total-final empty) 0)
(check-expect (total-final students) 289.6)

;; Ex03

;; count-students : List-of-students -> Number

(define (count-students l)
  (cond
    [(empty? l) 0]
    [else (+ 1 (count-students (rest l)))]))

(check-expect (count-students empty) 0)
(check-expect (count-students students) 4)

;; Ex04

;; passing-students : List-of-students -> List-of-students

(define (passing-students l)
  (cond
    [(empty? l) empty]
    [else (if (passing? (first l))
              (cons (first l) (passing-students (rest l)))
              (passing-students (rest l)))]))

;; зөвхөн тэнцсэн сурагчид
(check-expect (passing-students empty) empty)
(check-expect (passing-students students) (list aki sora mina))
(check-expect (passing-students (list ren aki)) (list aki))

;; Ex05

;; names : List-of-students -> List-of-strings

(define (names l)
  (cond
    [(empty? l) empty]
    [else (cons (student-name (first l))
                (names (rest l)))]))

(check-expect (names empty) empty)
(check-expect (names students) (list "Aki" "Sora" "Mina" "Ren"))

;; Ex06

;; grades : List-of-students -> List-of-strings

(define (grades l)
  (cond
    [(empty? l) empty]
    [else (cons (student-grade (first l))
                (grades (rest l)))]))

;; сурагч бүрийн үсгэн үнэлгээ
(check-expect (grades students) (list "B" "D" "A" "F"))

;; bonus-all : List-of-students Number -> List-of-students

(define (add-bonus s bonus)
  (make-student (student-name s) (student-quiz s) (min 100(+ (student-project s) bonus))))

(define (bonus-all l b)
  (cond
    [(empty? l) empty]
    [else (cons (add-bonus (first l) b) (bonus-all (rest l) b))]))

;; сурагч бүрийн project-д bonus нэмнэ (add-bonus)
(check-expect (bonus-all empty 10) empty)
(check-expect (bonus-all (list aki ren) 10)
              (list (make-student "Aki" 80 100) (make-student "Ren" 45 65)))

;; A NEList-of-students is one of:
;; - (cons Student empty)
;; - (cons Student NEList-of-students)

;; Ex01

;; best-student : NEList-of-students -> Student

(define (better-student a b)
  (if (>= (final-score a) (final-score b)) a b))

(define (best-student l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (better-student (first l)
                          (best-student (rest l))
          )]))

;; эцсийн оноо хамгийн их сурагч (тэнцүү бол түрүүлж байгаа нь)
(check-expect (best-student (list sora)) sora)
(check-expect (best-student students) mina)

;; Ex02

;; average-final : NEList-of-students -> Number

(define (average-final l) (/ (total-final l) (count-students l)))

;; эцсийн онооны дундаж: total-final ба count-students-ийг дууд
(check-expect (average-final (list aki)) 86)
(check-expect (average-final students) 72.4)

;; Ex03

;; top-name : NEList-of-students -> String

(define (top-name l) (student-name (best-student l)))

(check-expect (top-name students) "Mina")
