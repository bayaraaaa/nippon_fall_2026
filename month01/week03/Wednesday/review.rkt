;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Review

;; Ex01

;; count-zeros : List-of-numbers -> Number


(define (count-zeros l)
  (cond
   [(empty? l) 0]
   [else
    (if (= (first l) 0) 
            (+ 1 (count-zeros (rest l)))
         (count-zeros (rest l)))]))

;; 0-ийн тоо
(check-expect (count-zeros empty) 0)
(check-expect (count-zeros (cons 0 (cons 5 (cons 0 empty)))) 2)

;; Ex02

;; all-positive? : List-of-numbers -> Boolean

(define (all-positive? numbers)
  (cond
    [(empty? numbers) #t]
    [else (and (positive? (first numbers)) (all-positive? (rest numbers)))]
    ))

;; бүх тоо эерэг бол #t. Хоосон list-д эерэг биш тоо байхгүй тул #t.
(check-expect (all-positive? empty) #t)
(check-expect (all-positive? (cons 1 (cons 2 empty))) #t)
(check-expect (all-positive? (cons 1 (cons 0 empty))) #f)

;; Ex03

;; stack-all : List-of-images -> Image

(define (stack-all imgs)
  (cond
    [(empty? imgs) empty-image]
    [else (above (first imgs) (stack-all (rest imgs)))]))

;; бүх зургийг дээрээс доош тавина
(check-expect (stack-all empty) empty-image)
(check-expect (stack-all (cons (circle 10 "solid" "red") (cons (circle 10 "solid" "blue") empty)))
              (above (circle 10 "solid" "red") (circle 10 "solid" "blue")))