;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
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
(define (count-honor los)
  (cond
    [(empty? los) 0]
    [(honor? (first los)) (+ 1 (count-honor (rest los)))]
    [else (count-honor (rest los))]))

;; Ex02
(define (failing-names los)
  (cond [(empty? los) empty]
        [else
         (if (not (passing? (first los)))
             (cons (student-name (first los)) (failing-names (rest los)))
             (failing-names (rest los)))]))
;; Ex03
(define (name-tag s)
  (overlay (text (student-name s) 18 "black")
           (rectangle 120 36 "outline" "blue")))

(define (tags-row los)
  (cond
    [(empty? los) empty-image]
    [else
     (beside (name-tag (first los))
             (tags-row (rest los)))]))

;; count-honor : List-of-students -> Number
;; эцсийн оноо 90+ сурагчийн тоо (Пүрэвийн honor? ашигла)
(check-expect (count-honor empty) 0)
(check-expect (count-honor students) 1)
(check-expect (count-honor (list mina (make-student "Nine" 90 90))) 2)

;; failing-names : List-of-students -> List-of-strings
;; тэнцээгүй сурагчдын нэр
(check-expect (failing-names empty) empty)
(check-expect (failing-names students) (list "Ren"))

;; tags-row : List-of-students -> Image
;; Даваагийн name-tag-уудыг зэрэгцүүлнэ
(check-expect (tags-row empty) empty-image)
(check-expect (tags-row (list aki sora))
              (beside (name-tag aki) (name-tag sora)))
