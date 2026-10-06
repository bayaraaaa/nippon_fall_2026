;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname review) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (kb-to-bytes kb)
  (* kb 1000))

;; kb-to-bytes : Number -> Number
(check-expect (kb-to-bytes 2) 2000)

;; kb-to-bits : Number -> Number
(define (kb-to-bits kb)
  (* (* kb 1000) 8))

;; kb-to-bytes, Даваагийн bytes-to-bits-г дуудна
(check-expect (kb-to-bits 2) 16000)   ; (kib-to-bits 2) бол 16384


;; can-store? : Number Number -> Boolean
(define (can-store? KiBf KiBm)
  (<= KiBf KiBm))

;; файлын хэмжээ, дискний сул зай (KiB) → багтвал #t
(check-expect (can-store? 500 512) #t)
(check-expect (can-store? 512 512) #t)   ; хил
(check-expect (can-store? 513 512) #f)

;; cheap-order? : Number Number -> Boolean
(define (cheap-order? too price)
  (> 10000 (* too price)))

;; нэгж үнэ, тоо ширхэг → item-total 10000-аас бага бол #t
(check-expect (cheap-order? 2000 4) #t)   ; 8000
(check-expect (cheap-order? 2000 5) #f)   ; 10000, хил