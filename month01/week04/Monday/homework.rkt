;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname homework) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))


(make-student "Aki" 80 90)  ;; ur dun: шинэ student, make-student -     constructor
(student-name aki)          ;; ur dun: 	"Aki" ,      student-name -     selector
(student-quiz aki)          ;; ur dun: 80 ,          student-quiz -     selector
(student-project aki)       ;; ur dun: 90 ,          student-project -	selector
(student? aki)              ;; ur dun: #true ,       student? -  	predicate

(student-name aki)                             ;;  "Aki"
(student-project ren)                          ;;  55
(student? mina)                                ;;  #true
(student? 85)                                  ;;  #false
(student-quiz (make-student "Bat" 70 85))      ;;  70
(+ (student-quiz sora) (student-project sora)) ;;  120
;; (student-quiz 5)                            ;;  Алдаа: student-quiz нь student хүлээж авна, 5 биш.
;; (make-student "Bat" 70)                     ;;  Алдаа: make-student 3 аргумент хүлээнэ, 2 өгсөн.

;; list 

(define (fn-for-student s)
  (... (student-name s)
       (student-quiz s)
       (student-project s)))

;; Ex01

;; student-total : Student -> Number

(define (student-total s)
  (+ (student-quiz s) (student-project s)))

;; quiz ба project онооны нийлбэр
(check-expect (student-total aki) 170)
(check-expect (student-total (make-student "Zero" 0 0)) 0)

;; Ex02

;; project-better? : Student -> Boolean

(define (project-better? s)
  (> (student-project s) (student-quiz s)))

;; project оноо quiz онооноос их бол #true (тэнцүү бол #false)
(check-expect (project-better? aki) #true)
(check-expect (project-better? sora) #false)
(check-expect (project-better? mina) #false)

;; Ex03

;; quiz-passed? : Student -> Boolean

(define (quiz-passed? s)
  (>= (student-quiz s) 60))

;; quiz оноо 60 ба түүнээс дээш бол #true
(check-expect (quiz-passed? sora) #true)
(check-expect (quiz-passed? ren) #false)
(check-expect (quiz-passed? (make-student "Uka" 59 100)) #false)

;; Ex04

;; name-tag : Student -> Image

(define (name-tag s)
  (overlay (text (student-name s) 18 "black") (rectangle 120 36 "outline" "blue")))

;; сурагчийн нэрийг (18, хар) цэнхэр хүрээтэй (120 × 36) тэмдэг дээр бичнэ
(check-expect (name-tag aki)
              (overlay (text "Aki" 18 "black") (rectangle 120 36 "outline" "blue")))




