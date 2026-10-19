;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; 1. 
(define (count-failing-1 l)
  (cond [(empty? l) 0]
        [else (if (< (first l) 60)
                  (+ 1 (count-failing-1 (rest l)))
                  (count-failing-1 (rest l)))]))
(check-expect (count-failing-1 (list 60)) 0)

;; 2.

(define (total numbers)
  (cond
    [(empty? numbers) 0]
    [else (+ (first numbers) (total (rest numbers)))]
  ))

(define (count-scores items)
  (cond
    [(empty? items) 0]
    [else (+ 1
             (count-scores (rest items)))]
    ))

(define (average-2 l)
  (/ (total l) (count-scores l)))
(check-expect (average-2 (list 60 80)) 70)

;; 3.
(define (passing-scores-3 l)
  (cond [(empty? l) empty]
        [else (if (>= (first l) 60)
                  (cons (first l) (passing-scores-3 (rest l)))
                  (passing-scores-3 (rest l)))]))
(check-expect (passing-scores-3 (list 40 60)) (list 60))

;; 4.
(define (grade-color n)
  (cond
    [(>= n 90) "green"]
    [(>= n 80) "blue"]
    [(>= n 70) "gold"]
    [(>= n 60) "orange"]
    [else "red"]
   ))

(define (score-bar score)
  (circle 20 "solid" (grade-color score)))

(define (score-bars-4 l)
  (cond [(empty? l) empty-image]
        [else (above (score-bar (first l)) (score-bars-4 (rest l)))]))
(check-expect (score-bars-4 (list 80)) (score-bar 80))