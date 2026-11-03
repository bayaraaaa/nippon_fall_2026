;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cond) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; get-age-category : Number -> String
;; Returns the age category based on the given age
(define (get-age-category age)
  (cond
    [(and (< 0 age) (<= age 12)) "baby"]
    [(and (<= 13 age) (<= age 19)) "teenager"]
    [(and (<= 20 age) (<= age 65)) "adult"]
    [(and (< 65 age) (<= age 120)) "senior"]
    [else "invalid age"]))
