;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; --- songolt 1 ---

; Функцийн нэр: rectangle-area
 ; Оролт: width, height
 ; Гаралт: area
 ; Томьёо: width × height
(define (rectangle-area width height)
  (* width height))

(rectangle-area 10 5)  ; Хүлээсэн үр дүн: 50

; Функцийн нэр: rectangle-perimeter
; Оролт: a, b, c
; Гаралт: perimeter
; Томьёо: a + b + c
(define (rectangle-perimeter a b c)
  (+ a b c))

(rectangle-perimeter 10 5 6) ; Хүлээсэн үр дүн: 21

; Функцийн нэр: square-area
; Оролт: a, b
; Гаралт: area
; Томьёо: a * b
(define (square-area a b)
  (* a b))

(square-area 5 6) ; Хүлээсэн үр дүн: 30

; Функцийн нэр: minutes-to-seconds
; Оролт: min
; Гаралт: sec
; Томьёо: min * 60 = sec
(define (minutes-to-seconds min)
  (* min 60))

(minutes-to-seconds 3) ; Хүлээсэн үр дүн: 180

; Функцийн нэр: kilometers-to-meters
; Оролт: km
; Гаралт: meters
; Томьёо: km × 1000 = meters
(define (kilometers-to-meters km)
  (* km 1000))

(kilometers-to-meters 3) ; Хүлээсэн үр дүн: 3000

