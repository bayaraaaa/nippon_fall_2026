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



;; Boolean opration

;; and ,or ,not

(and (> 10 5) (< 3 1)) ;; #f
(or (= 4 4) (> 2 9))          ; #t
(not (even? 7))               ; #t
(and (>= 75 60) (>= 90 80))   ; #t

;; Exercises

(check-expect (and #t #t) #t) ; #t
(check-expect (and #t #f) #f) ; #f
(check-expect (or #f #f) #f)  ; #f 
(check-expect (or #f #t) #t)  ; #t
(check-expect (not #t) #f)
(check-expect (not #f) #t)
(check-expect (and (> 8 3) (even? 10)) #t)
(check-expect (or (< 1 0) (= 6 (+ 3 3))) #t)
(check-expect (not (positive? -2)) #t)
(check-expect (and (>= 60 60) (>= 79 80)) #f)

;; Ex01

;; in-range? : Number -> Boolean
;; n нь 1-ээс 10 хүртэл (хоёр талдаа орно) бол #t
(define (in-range? n)
  (and (>= n 1) (<= n 10)))

(check-expect (in-range? 5) #t)
(check-expect (in-range? 1) #t)    ; доод хил
(check-expect (in-range? 10) #t)   ; дээд хил
(check-expect (in-range? 0) #f)    ; доод хилийн гадна
(check-expect (in-range? 11) #f)   ; дээд хилийн гадна


;; Ex02
;; teen? : Number -> Boolean
(define (teen? age)
  (and (>= age 13)(<= age 19)))

;; age 13-аас 19 хүртэл (хоёр талдаа орно) бол #t
(check-expect (teen? 13) #t)
(check-expect (teen? 19) #t)
(check-expect (teen? 12) #f)
(check-expect (teen? 20) #f)


;; Ex03 

;; weekend? : Number -> Boolean
(define (weekend? date)
  (or (= 6 date) (= 7 date)))

;; долоо хоногийн өдрийн дугаар (1 = Даваа ... 7 = Ням) 6 эсвэл 7 бол #t
(check-expect (weekend? 6) #t)
(check-expect (weekend? 7) #t)
(check-expect (weekend? 5) #f)

;; Ex04

;; scholarship? : Number Number -> Boolean
(define (scholarship? score attendance)
  (and (>= score 90) (>= attendance 80)))

;; score 90 ба түүнээс дээш, attendance 80 ба түүнээс дээш бол #t
(check-expect (scholarship? 90 80) #t)
(check-expect (scholarship? 89 100) #f)
(check-expect (scholarship? 100 79) #f)

;; Ex05

;; not-passing? : Number -> Boolean
(define (not-passing? next)
  (not (> next 59)))

;; Даваагийн passing-score?-г not-оор урвуулна
(check-expect (not-passing? 59) #t)
(check-expect (not-passing? 60) #f)

;; IF

;; adult-or-minor : Number -> String
;; age 18 ба түүнээс дээш бол "adult", үгүй бол "minor"
(define (adult-or-minor age)
  (if (>= age 18)
      "adult"
      "minor"))

(check-expect (adult-or-minor 30) "adult")
(check-expect (adult-or-minor 18) "adult")   ; хил
(check-expect (adult-or-minor 17) "minor")   ; хилийн доор

;; Exercises IF
;; Ex01

(define (even-or-odd number)
  (if (even? number)
      "even"
      "odd"))
(check-expect (even-or-odd 4) "even")
(check-expect (even-or-odd 7) "odd")
(check-expect (even-or-odd 0) "even")

;; Ex02

;; pass-or-fail : Number -> String
(define (pass-or-fail score)
  (if (>= score 60)
      "pass"
      "fail"))

;; score 60 ба түүнээс дээш бол "pass", үгүй бол "fail"
(check-expect (pass-or-fail 60) "pass")
(check-expect (pass-or-fail 59) "fail")

;; Ex03

;; shipping-fee : Number -> Number
(define (shipping-fee vall)
  (if (>= vall 50000)
  0
  3000))
;; захиалгын дүн 50000 ба түүнээс их бол хүргэлт 0, үгүй бол 3000
(check-expect (shipping-fee 50000) 0)
(check-expect (shipping-fee 49999) 3000)

;; Ex04

;; free-shipping? : Number -> Boolean
(define (free-shipping? n)
  (>= n 50000))

;; дүн 50000 ба түүнээс их бол #t. if ашиглахгүйгээр бич.
(check-expect (free-shipping? 50000) #t)
(check-expect (free-shipping? 49999) #f)

;; Ex05

;; larger : Number Number -> Number
(define (larger a b)
  (if (> a b)
  a
  b))
;; хоёр тооны их нь
(check-expect (larger 3 8) 8)
(check-expect (larger 8 3) 8)
(check-expect (larger 5 5) 5)

;;Ex06

;; absolute-value : Number -> Number
(define (absolute-value value)
  (if (> value 0)
      value
      (* value -1)))

;; сөрөг бол эсрэг тэмдэгтэй болгоно, үгүй бол хэвээр
(check-expect (absolute-value -4) 4)
(check-expect (absolute-value 4) 4)
(check-expect (absolute-value 0) 0)

;;Ex07

;; scholarship-label : Number Number -> String
(define (scholarship-label score attendance)
  (if (scholarship? score attendance)
      "scholarship"
      "regular"))
;; score, attendance → тэтгэлэгт тэнцвэл "scholarship", үгүй бол "regular"
(check-expect (scholarship-label 95 85) "scholarship")
(check-expect (scholarship-label 90 80) "scholarship")
(check-expect (scholarship-label 89 80) "regular")
(check-expect (scholarship-label 90 79) "regular")

;; COND

;; Ex01

;; grade : Number -> String

;; 0–100 оноог үсгэн дүн болгоно
(define (grade score)
  (cond
    [(>= score 90) "A"]
    [(>= score 80) "B"]
    [(>= score 70) "C"]
    [(>= score 60) "D"]
    [else "F"]))

(check-expect (grade 90) "A")   ; хил
(check-expect (grade 89) "B")   ; хилийн доор
(check-expect (grade 50) "F")   ; муу

;; Ex02

;; temperature-label : Number -> String
(define (temperature-label temp)
  (cond
    [(< temp 0) "freezing"]
    [(<= temp 14) "cold"]
    [(<= temp 24) "warm"]
    [else "hot"]
    
    ))
;; 0-ээс бага "freezing", 0–14 "cold", 15–24 "warm", 25 ба түүнээс дээш "hot"
(check-expect (temperature-label -1) "freezing")
(check-expect (temperature-label 0) "cold")
(check-expect (temperature-label 14) "cold")
(check-expect (temperature-label 15) "warm")
(check-expect (temperature-label 24) "warm")
(check-expect (temperature-label 25) "hot")

;; Ex03

;; ticket-price : Number -> Number
(define (ticket-price age)
  (cond
    [(< age 13) 5000]
    [(<= age 59) 10000]
    [else 6000]
    ))

;; age 13-аас бага 5000, 13–59 10000, 60 ба түүнээс дээш 6000
(check-expect (ticket-price 12) 5000)
(check-expect (ticket-price 13) 10000)
(check-expect (ticket-price 59) 10000)
(check-expect (ticket-price 60) 6000)

;; Ex04

;; number-sign : Number -> String

(define (number-sign n)
  (cond
    [(> n 0) "positive"]
    [(= n 0) "zero"]
    [else "negative"]
    ))

;; "positive", "zero", "negative"
(check-expect (number-sign 5) "positive")
(check-expect (number-sign 0) "zero")
(check-expect (number-sign -5) "negative")

;; Ex05

;; file-size-label : Number -> String
(define (file-size-label MiB)
  (cond
    [(< MiB 10) "small"]
    [(<= MiB 99) "medium"]
    [else "large"]
    ))

;; MiB хэмжээ: 10-аас бага "small", 10–99 "medium", 100 ба түүнээс их "large"
(check-expect (file-size-label 9) "small")
(check-expect (file-size-label 10) "medium")
(check-expect (file-size-label 99) "medium")
(check-expect (file-size-label 100) "large")

;; Ex06

;; club-status : Number Number -> String
(define (club-status score attendance)
  (cond
    [(scholarship? score attendance)  "scholarship"]
    [(and (>= score 60) (>= attendance 70))"member"]
    [else "waitlist"]
   ))

;; score, attendance:
;;   scholarship? үнэн бол                    "scholarship"
;;   score >= 60 ба attendance >= 70 бол       "member"
;;   бусад                                    "waitlist"
(check-expect (club-status 95 90) "scholarship")
(check-expect (club-status 90 79) "member")     ; scholarship-д attendance хүрэхгүй
(check-expect (club-status 60 70) "member")     ; хоёр хил
(check-expect (club-status 59 100) "waitlist")
(check-expect (club-status 100 69) "waitlist")