;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score-analyzer) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; data

;; 2 жишээ list. Эхнийх нь бүгд тэнцсэн, хоёр дахь нь тэнцээгүй оноотой.
(define scores (list 70 82 95 63 88))
(define mixed-scores (list 40 60 72 58 100))


;; Ex01

;; total : List-of-numbers -> Number

(define (total numbers)
  (cond
    [(empty? numbers) 0]
    [else (+ (first numbers) (total (rest numbers)))]
  ))

(check-expect (total empty) 0)
(check-expect (total scores) 398)

;; Ex02

;; count-scores : List-of-numbers -> Number

(define (count-scores items)
  (cond
    [(empty? items) 0]
    [else (+ 1
             (count-scores (rest items)))]
    ))



(check-expect (count-scores empty) 0)
(check-expect (count-scores scores) 5)

;; Ex03

;; average : NEList-of-numbers -> Number

(define (average numbers)
  (/ (total numbers) (count-scores numbers)))

;; total, count-scores-г дуудна. Хоосон list дээр дуудахгүй (NEList).
(check-expect (average scores) 79.6)
(check-expect (average mixed-scores) 66)

;; Ex04

(define (highest numbers)
  (cond
    [(empty? numbers) 0]
    [else (max (first numbers) (highest (rest numbers)))]
  ))

;; highest : NEList-of-numbers -> Number
(check-expect (highest (list 63)) 63)
(check-expect (highest scores) 95)
(check-expect (highest mixed-scores) 100)

;; limit

;; Ex01

;; count-passing : List-of-numbers -> Number

(define (count-passing numbers)
  (cond
    [(empty? numbers) 0]
    [else
     (if (>= (first numbers) 60) 
         (+ 1 (count-passing (rest numbers)))
         (count-passing (rest numbers)))
    ]))

;; 60 ба түүнээс дээш онооны тоо
(check-expect (count-passing scores) 5)
(check-expect (count-passing mixed-scores) 3)
(check-expect (count-passing (list 60 59)) 1)    ; хил

;; Ex02

;; count-failing : List-of-numbers -> Number

(define (count-failing numbers)
  (cond
    [(empty? numbers) 0]
    [else
     (if (< (first numbers) 60) 
         (+ 1 (count-failing (rest numbers)))
         (count-failing (rest numbers)))
    ]))

;; 60-аас бага онооны тоо
(check-expect (count-failing scores) 0)
(check-expect (count-failing mixed-scores) 2)

;; Ex03

;; passing-scores : List-of-numbers -> List-of-numbers

(define (passing-scores numbers)
  (cond
    [(empty? numbers) empty]
    [else
     (if (>= (first numbers) 60)
         (cons (first numbers) (passing-scores (rest numbers)))
         (passing-scores (rest numbers))
     )
    ]))

;; зөвхөн тэнцсэн оноонууд
(check-expect (passing-scores mixed-scores) (list 60 72 100))
(check-expect (passing-scores (list 10 20)) empty)

;; img

;; Ex01

;; score-bars : List-of-numbers -> Image

(define (score-bars sizes)
  (cond [(empty? sizes) empty-image]
        [else (above (rectangle (first sizes) 20 "solid" "blue")
                      (score-bars (rest sizes)))]))

;; оноо бүрийг 2-р долоо хоногийн score-bar-аар (rectangle оноо 20 "solid" "blue")
;; дээрээс доош тавина. Хоосон list → empty-image.
(check-expect (score-bars empty) empty-image)
(check-expect (score-bars (list 80 60))
              (above (rectangle 80 20 "solid" "blue") (rectangle 60 20 "solid" "blue")))
