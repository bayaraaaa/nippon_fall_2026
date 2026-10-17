;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))

(define (total l)
  (cond [(empty? l) 0]
        [else (+ (first l) (total (rest l)))]))

(define (count-scores l)
  (cond [(empty? l) 0]
        [else (+ 1 (count-scores (rest l)))]))

(define (average l) (/ (total l) (count-scores l)))      ; NEList

(define (highest l)                                      ; NEList
  (cond [(empty? (rest l)) (first l)]
        [else (max (first l) (highest (rest l)))]))

(define (count-passing l)
  (cond [(empty? l) 0]
        [else (if (>= (first l) 60)
                  (+ 1 (count-passing (rest l)))
                  (count-passing (rest l)))]))
(define (passing-scores l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores (rest l)))
                  (passing-scores (rest l)))]))
(define (score-bar score) (rectangle score 20 "solid" "blue"))