;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; 100 elements prices?
;; resursive function

;; fun-for-lon : List-of-numbers -> ???

(define (fun-for-lon l)
  (cond
    [(empty? l) ...]
    [else (... (first l)
               ... (fun-for-lon (rest l)) ...)]))

;; sum : List-of-numbers -> Number
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l)
             (sum (rest l)))]
    ))

;; бүх тооны нийлбэр
(check-expect (sum empty) 0)
(check-expect (sum (cons 1 (cons 2 (cons 3 empty)))) 6)

;; multiply : List-of-numbers -> Number
(define (multiply l)
  (cond
    [(empty? l) 1]
    [else (* (first l)
             (multiply (rest l)))]
    ))

(check-expect (multiply empty) 1)
(check-expect (multiply (cons 1 (cons 2 (cons 3 empty)))) 6)
(check-expect (multiply (cons 1 (cons 2 (cons 3 (cons 4 empty))))) 24)

;; Ex01

;; count-words

(define (count-words words)
  (cond
    [(empty? words) 0]
    [else (+ 1
             (count-words (rest words)))]
    ))

(check-expect (count-words empty) 0)
(check-expect (count-words (cons "hello" empty)) 1)
(check-expect (count-words (cons "hello" (cons "world" empty))) 2)
(check-expect (count-words (cons "I" (cons "love" (cons "Racket" empty)))) 3)

;; Ex02
;; contains-word? : List-of-strings

(define (contains-word? word words)
  (cond
    [(empty? words) #false]
    [(string=? word (first words)) #true]
    [else (contains-word? word (rest words))]
  )
)
(check-expect (contains-word? "cat" empty) #false)
(check-expect (contains-word? "cat" (cons "cat" empty)) #true)
(check-expect (contains-word? "dog" (cons "cat" (cons "dog" empty)))#true)
(check-expect (contains-word? "bird" (cons "cat" (cons "dog" empty)))#false)

;; Ex03
;; count-long-words : list-of-strings

(define (count-long-words words)
  (cond
    [(empty? words) 0]
    [(>= (string-length (first words)) 5)
     (+ 1 (count-long-words (rest words)))]
    [else (count-long-words (rest words))]))

(check-expect (count-long-words empty) 0)
(check-expect (count-long-words (cons "cat" empty)) 0)
(check-expect (count-long-words (cons "apple" empty)) 1)
(check-expect (count-long-words (cons "apple" (cons "hi" (cons "banana" empty)))) 2)
(check-expect (count-long-words (cons "hello" (cons "world" (cons "Racket" empty)))) 3)

;; Ex04
;; cound-completed : List-fo-Boolean



(define (count-completed boolean)
  (cond
    [(empty? boolean) 0]
    [(first boolean)
     (+ 1 (count-completed (rest boolean)))]
    [else (count-completed (rest boolean))]))


(check-expect (count-completed empty) 0)
(check-expect (count-completed (cons #true empty)) 1)
(check-expect (count-completed (cons #false empty)) 0)
(check-expect (count-completed (cons #true (cons #false empty))) 1)
(check-expect (count-completed (cons #true (cons #true (cons #false (cons #true empty))))) 3)
(check-expect (count-completed (cons #false (cons #false (cons #false empty)))) 0)

;; Ex05
;; join-words : List-of-strings

(define (join-words text)
  (cond
    [(empty? text) ""]
    [(empty? (rest text)) (first text)]
    [else  (string-append (first text) " " (join-words (rest text)))]))

(check-expect (string-append "Hello" "world") "Helloworld")

(check-expect (join-words empty) "")
(check-expect (join-words (cons "Hello" empty)) "Hello")
(check-expect (join-words (cons "Hello" (cons "world" empty))) "Hello world")
(check-expect (join-words (cons "I" (cons "love" (cons "Racket" empty)))) "I love Racket")

;; Ex06

;; count-items : List-of-numbers -> Number

(define (count-items items)
  (cond
    [(empty? items) 0]
    [else (+ 1
             (count-items (rest items)))]
    ))

;; элементийн тоо
(check-expect (count-items empty) 0)
(check-expect (count-items (cons 7 (cons 8 (cons 9 empty)))) 3)

;; Ex07

;; product : List-of-numbers -> Number

(define (product numbers)
  (cond
    [(empty? numbers) 1]
    [else (* (first numbers)
             (product (rest numbers)))]
    ))

;; бүх тооны үржвэр. Хоосон list-ийн үржвэр 1 (0 биш!) — яагаад?
(check-expect (product empty) 1)
(check-expect (product (cons 2 (cons 3 (cons 4 empty)))) 24)

;; Ex08

;; contains-zero? : List-of-numbers -> Boolean

(define (contains-zero? numbers)
  (cond
    [(empty? numbers) #f]
    [else (or (= (first numbers) 0) (contains-zero? (rest numbers)))]
    ))


;; list дотор 0 байвал #t. or ашигла.
(check-expect (contains-zero? empty) #f)
(check-expect (contains-zero? (cons 1 (cons 0 empty))) #t)
(check-expect (contains-zero? (cons 1 (cons 2 empty))) #f)

;; 2 function

;; count-positive : List-of-numbers -> Number
;; эерэг тоонуудын тоо (0 эерэг биш)
(check-expect (count-positive empty) 0)
(check-expect (count-positive (cons -2 (cons 0 (cons 5 (cons 9 empty))))) 2)

(define (count-positive l)
  (cond
    [(empty? l) 0]
    [else
     (if (positive? (first l))
         (+ 1 (count-positive (rest l)))
         (count-positive (rest l)))]))

;; Ex01

;; count-even : List-of-numbers -> Number

(define (count-even l)
  (cond
    [(empty? l) 0]
    [else
     (if (even? (first l))
         (+ 1 (count-even (rest l)))
         (count-even (rest l)))]))

;; тэгш тоонуудын тоо
(check-expect (count-even empty) 0)
(check-expect (count-even (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 empty)))))) 3)
(check-expect (count-even (cons 1 (cons 3 empty))) 0)

;; Ex02

;; count-negative : List-of-numbers -> Number

(define (count-negative l)
  (cond
    [(empty? l) 0]
    [else
     (if (negative? (first l))
         (+ 1 (count-negative (rest l)))
         (count-negative (rest l)))]))

;; сөрөг тоонуудын тоо (0 сөрөг биш)
(check-expect (count-negative (cons -1 (cons 0 (cons -3 empty)))) 2)

;; Ex03

;; draw-all : List-of-images -> Image


(define (draw-all imgs)
  (cond
    [(empty? imgs) empty-image]
    [else (beside (first imgs) (draw-all (rest imgs)))]))

;; бүх зургийг зүүнээс баруун тийш тавина
(check-expect (draw-all empty) empty-image)
(check-expect (draw-all (cons (circle 20 "solid" "red") (cons (rectangle 40 40 "solid" "blue") empty)))(beside (circle 20 "solid" "red") (rectangle 40 40 "solid" "blue")))
