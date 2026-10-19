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

