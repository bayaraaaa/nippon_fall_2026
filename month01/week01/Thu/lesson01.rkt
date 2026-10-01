;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Thursday (2026-10-01) -- comment (сэтгэгдэл)
; values -- утга
5
-6
1.6
"Hello World"
true

; arithmetic operation

(+ 3 4)
(- 10 6)
(* 5 8)
(/ 20 4)
(+ 100 50)
(- 30 12)
(* 7 6)
(/ 81 9)
;many numbers
(+ 1 2 3)
(* 2 3 4)
(- 20 5 3)
(/ 100 2 5)
; nested expression
(+ (* 2 3) 4)

; (* 2 3 -> syntax error
(* 2 3 )

; (* 4)
; (sign operator operand)
(+ 2 3)

; define - тодорхойлох - keyword буюу түлхүүр үг
;
(define age 35)
age

(define name "bayarbileg")
name

(define job "Software Engineer")
job

(define whidth 4)
(define height 5)
(+ whidth height)
(* whidth height)

(define price 100)
(define quantity 3)
(* price quantity)

(define salary 1500)
(define bonus 300)
(+ salary bonus)

;
(* height height)
(* whidth whidth)
; 4 * 4 = 16

; Functions
;; square гэдэг функц тодорхойлох
;; x -iig functioniin prameter
;; INPUT -x
;; FUNCTION FROCESS -> (* x x)
(define (square x)
  (* x x))

;; output ???
(square 5)
(square 12)
(square 123214234214)

;; Ex04
;; double gedeg nertei 1 prameter avaad tuuniig double-dag FUNCTION bichne uu
;; tuuniig 4, 8, -35 gedeg utgaar test hii
(define (double x)
  (* x x))

;; output
(double 4)
(double 8)
(double -35)

;; Ex05
(define (triple x)
  (* 3 x))

;; output
(triple 42)
(triple 32)

;; Ex06
(define (add-ten x)
  (+ 10 x))

;; output
(add-ten 2)

;; Ex07 tegsh ontsogtiin talbai
(define (calculate-area-rectangle width height)
  (* width height))

;; output
(calculate-area-rectangle 5 6)

;; Ex08 perimiter
;; P = 2 * (a + b)

(define (calculate-perimiter-rectangle a b)
  (* 2 (+ a b)))

;; output
(calculate-perimiter-rectangle 10 5)

;; Ex09 A = 3.14 * radius * radius
(define (calculate-circle-area radius)
  (* 3.14 radius radius))

;; output
(calculate-circle-area 10)



