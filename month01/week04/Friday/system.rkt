;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(define (count-grade l g)
  (cond [(empty? l) 0]
        [else (if (string=? (student-grade (first l)) g)
                  (+ 1 (count-grade (rest l) g))
                  (count-grade (rest l) g))]))

;; count-grade : List-of-students String -> Number
;; өгөгдсөн үсгэн үнэлгээтэй сурагчийн тоо (string=?)
(check-expect (count-grade empty "A") 0)
(check-expect (count-grade students "A") 1)
(check-expect (count-grade students "F") 1)
(check-expect (count-grade students "C") 0)



(define (report-row s)
  (beside (text (student-name s) 14 "black")
          (rectangle (* 2 (final-score s)) 16 "solid" "green")))

;; report-row : Student -> Image
;; нэр (14, хар), хажууд нь урт = 2 × эцсийн оноо, өндөр 16 багана (card-color)
(check-expect (report-row aki)
              (beside (text "Aki" 14 "black") (rectangle 172 16 "solid" "green")))

(define (report-chart l)
  (cond [(empty? l) empty-image]
        [else (above/align "left"
                           (report-row (first l))
                           (report-chart (rest l)))]))

;; report-chart : List-of-students -> Image
;; мөрүүдийг доош нь, зүүн тийш тэгшилж байрлуулна (above/align "left" ...)
(check-expect (report-chart empty) empty-image)
(check-expect (report-chart (list aki ren))
              (above/align "left" (report-row aki) (report-row ren)))

