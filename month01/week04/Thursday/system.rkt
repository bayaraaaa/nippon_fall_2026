;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

;;my-class

;; Ex01

(define (count-students l)
  (cond [(empty? l) 0]
        [else (+ 1 (count-students (rest l)))]))

(count-students my-class) 

;; Ex02

(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (passing? (first l))
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))

(count-passing my-class)

;; Ex03

(define (total-final l)
  (cond
    [(empty? l) 0]
    [else (+ (final-score (first l))
             (total-final (rest l)))]))

(total-final my-class)

;; Ex04

(define (average-final l)
  (/ (total-final l) (count-students l)))

(average-final my-class)

;; Ex05

(define (best-student l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (better-student (first l)
                          (best-student (rest l))
          )]))

(define (top-name l)
  (student-name (best-student l)))

(top-name my-class)

(define (grades l)
  (cond
    [(empty? l) empty]
    [else (cons (student-grade (first l))
                (grades (rest l)))]))

(grades my-class)

;; end my-class
;; Ex01

(define (failing-students l)
  (cond
    [(empty? l) empty]
    [else (if (passing? (first l)) (failing-students (rest l))
              (cons (first l) (failing-students (rest l))))]))

;; failing-students : List-of-students -> List-of-students
(check-expect (failing-students empty) empty)
(check-expect (failing-students students) (list ren))

;; Ex02

;; count-failing : List-of-students -> Number

(define (count-failing l)
  (- (count-students l) (count-passing l)))

(check-expect (count-failing students) 1)
