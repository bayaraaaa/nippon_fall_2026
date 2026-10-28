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
