;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lesson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct book (title author pages))

(define b1 (make-book "Harry Potter" "Rowling" 320))
(define b2 (make-book "Бяцхан ханхүү" "Exupéry" 96))
(define b3 (make-book "Нууц товчоо" "Тодорхойгүй" 300))


;; Template
(book-title b2)
;; b3 heden huudastai
(book-pages b3)
;; b1-iin zohigch
(book-author b1)

;;

(define (long-book? book)
  (> (book-pages book) 300))

(check-expect (long-book? b1) #true)
(check-expect (long-book? b2) #false)
(check-expect (long-book? b3) #false)   ; яг 300
(check-expect (long-book? (make-book "A" "B" 301)) #true)

;;

(define (reading-days book)
  (/ (book-pages book) 20))


(check-expect (reading-days b1) 16)
(check-expect (reading-days b2) 4.8)
(check-expect (reading-days b3) 15)

;; 

(define-struct pet (name kind age))



(define bobo (make-pet "Бобо" "нохой" 3))
(define mimi (make-pet "Мими" "муур" 1))
(define tom  (make-pet "Том"  "муур" 12))

;; cat?

(define (cat? pet)
  (string=? (pet-kind pet) "муур"))

(check-expect (cat? mimi) #true)
(check-expect (cat? tom) #true)
(check-expect (cat? bobo) #false)

;; amitan 10 ba tuunees deesh nastai bol # true

(define (senior? pet)
  (>= (pet-age pet) 10))

(check-expect (senior? tom) #true)
(check-expect (senior? bobo) #false)
(check-expect (senior? (make-pet "Хар" "нохой" 10)) #true)
(check-expect (senior? (make-pet "Цагаан" "муур" 9)) #false)

;;

(define (pet-intro pet)
  (string-append (pet-name pet) " бол "
                 (number->string (pet-age pet)) " настай "
                 (pet-kind pet)))

(check-expect (pet-intro bobo) "Бобо бол 3 настай нохой")
(check-expect (pet-intro mimi) "Мими бол 1 настай муур")
(check-expect (pet-intro tom) "Том бол 12 настай муур")


;;

(define-struct product (name price qty))

(define pen      (make-product "Үзэг"   500   40))
(define notebook (make-product "Дэвтэр" 1500  0))
(define bag      (make-product "Цүнх"   45000 3))

(define (stock-value p)
  (* (product-price p) (product-qty p)))

(check-expect (stock-value pen) 20000)
(check-expect (stock-value bag) 135000)
(check-expect (stock-value notebook) 0)

(define (in-stock? p)
  (> (product-qty p) 0))

(check-expect (in-stock? pen) #true)
(check-expect (in-stock? bag) #true)
(check-expect (in-stock? notebook) #false)

(define (price-with-tax p)
  (* (product-price p) 1.1))

(check-expect (price-with-tax pen) 550)
(check-expect (price-with-tax notebook) 1650)
(check-expect (price-with-tax bag) 49500)

;;

(require 2htdp/image)

(define-struct ball (radius color))

(define red-ball (make-ball 20 "red"))
(define big-blue (make-ball 50 "blue"))
(define tiny     (make-ball 5  "green"))

(define (draw-ball b)
  (circle (ball-radius b) "solid" (ball-color b)))

(check-expect (draw-ball red-ball) (circle 20 "solid" "red"))
(check-expect (draw-ball big-blue) (circle 50 "solid" "blue"))

;;

(define (bigger? b1 b2)
  (> (ball-radius b1) (ball-radius b2)))

(check-expect (bigger? big-blue red-ball) #true)
(check-expect (bigger? red-ball tiny) #true)
(check-expect (bigger? tiny red-ball) #false )
(check-expect (bigger? red-ball red-ball) #false)

;;

(define (ball-in-box b)
  (overlay (draw-ball b) (square (+ (* (ball-radius b) 2) 10) "outline" "black")))

(check-expect (ball-in-box red-ball) (overlay (circle 20 "solid" "red") (square 50 "outline" "black")))
(check-expect (ball-in-box tiny) (overlay (circle 5 "solid" "green") (square 20 "outline" "black")))
(check-expect (ball-in-box big-blue) (overlay (circle 50 "solid" "blue") (square 110 "outline" "black")))

;;

(define-struct game (home away home-goals away-goals))

(define g1 (make-game "Монгол" "Япон" 2 1))
(define g2 (make-game "Хятад" "Солонгос" 0 3))
(define g3 (make-game "Монгол" "Хятад" 1 1))

(check-expect (game? g1) #true)
(check-expect (game-home g1) "Монгол")
(check-expect (game-away g2) "Солонгос" )
(check-expect (game-away-goals g2) 3)

(define (total-goals game)
  (+ (game-home-goals game) (game-away-goals game)))

(check-expect (total-goals g1) 3)
(check-expect (total-goals g2) 3)
(check-expect (total-goals g3) 2 )
(check-expect (total-goals (make-game "A" "B" 0 0)) 0)

(define (winner game)
  (cond
    [(> (game-home-goals game) (game-away-goals game))
     (game-home game)]
    [(< (game-home-goals game) (game-away-goals game))
     (game-away game)]
    [else "Тэнцээ"]))

(check-expect (winner g1) "Монгол")
(check-expect (winner g2) "Солонгос")
(check-expect (winner g3) "Тэнцээ" )
(check-expect (winner (make-game "A" "B" 0 0)) "Тэнцээ")

(define (score-line game)
  (string-append (game-home game) " " (number->string (game-home-goals game)) " : " (number->string (game-away-goals game)) " " (game-away game)))

(check-expect (score-line g1) "Монгол 2 : 1 Япон")
(check-expect (score-line g2) "Хятад 0 : 3 Солонгос")
(check-expect (score-line g3) "Монгол 1 : 1 Хятад" )


;;


(define-struct student (name quiz project))
;; A Student is (make-student String Number Number)
;; name    : сурагчийн нэр
;; quiz    : quiz оноо, 0–100
;; project : project оноо, 0–100

(define aki  (make-student "Aki"  80 90))
(define sora (make-student "Sora" 60 60))
(define mina (make-student "Mina" 95 91))
(define ren  (make-student "Ren"  45 55))

(define (final-score student)
  (+ (* (student-quiz student) 0.4)
     (* (student-project student) 0.6)))

;; эцсийн оноо: quiz 40%, project 60%
(check-expect (final-score aki) 86)
(check-expect (final-score sora) 60)
(check-expect (final-score mina) 92.6)
(check-expect (final-score ren) 51)
(check-expect (final-score (make-student "Zero" 0 0)) 0)


;;

(define (passed? s)
  (>= (final-score s) 60))

(check-expect (passed? aki) #true)
(check-expect (passed? sora) #true)
(check-expect (passed? mina) #true)
(check-expect (passed? ren) #false)
(check-expect (passed? (make-student "UKa" 100 34)) #true)

(check-expect (passed? (make-student "UKa" 100 34)) #true)
(check-expect (passed? (make-student "bat" 100 33)) #false)