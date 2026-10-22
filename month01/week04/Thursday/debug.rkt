;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; A List-of-students is one of:
;; - empty
;; - (cons Student List-of-students)

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

;; endfunctions

;; 1 (if (passing? l) --> (if (passing? (first l))
(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l))
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(check-expect (count-passing students) 3)

;; 2 [(empty? l) 0] --> [(empty? l) empty]
(define (names l)
  (cond [(empty? l) empty]
        [else (cons (student-name (first l)) (names (rest l)))]))

(check-expect (names (list aki)) (list "Aki"))

;; 3 l --> (passing-students (rest l))
(define (passing-students l)
  (cond [(empty? l) empty]
        [else (if (passing? (first l))
                  (cons (first l) (passing-students (rest l)))
                  (passing-students (rest l)))]))

(check-expect (passing-students (list ren aki)) (list aki))

;; 4 [(empty? (l) (first l)] --> [(empty? (rest l)) (first l)]
(define (best-student l)
  (cond [(empty? (rest l)) (first l)]
        [else (better-student (first l) (best-student (rest l)))]))

(check-expect (best-student students) mina)

;; 5 (rest l) --> (grades (rest l))
(define (grades l)
  (cond
    [(empty? l) empty]
    [else (cons
           (student-grade (first l))
           (grades (rest l))
           )]))

(check-expect (grades (list aki sora)) (list "B" "D"))