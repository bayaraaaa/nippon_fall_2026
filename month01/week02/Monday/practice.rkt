;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname practice) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sergeeh 1
(+ (* 4 5) 3)
(/ (+ 8 4) 3)

; Sergeeh 2
(define (rectangle-area width height)
  (* width height))
(rectangle-area 4 5)

; Sergeeh 3
(define (rectangle-cost rectangle-area cost)
  (* rectangle-area cost))
(rectangle-cost (rectangle-area 6 3) 500)

