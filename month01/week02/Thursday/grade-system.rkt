;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grade-system) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Step01

;; Ex01

(define (sum3 a b c)
  (+ (+ a b) c))
;; sum3 : Number Number Number -> Number
(check-expect (sum3 80 90 70) 240)

;; average3 : Number Number Number -> Number
(define (average3 a b c)
  (/ (sum3 a b c) 3))

;; гурван тооны дундаж. sum3-г дуудна.
(check-expect (average3 80 90 70) 80)
(check-expect (average3 60 60 60) 60)

;; Ex02

;; assignment-percent : Number Number -> Number
(define (assignment-percent point percent)
  (* point percent))

;; хийсэн ба нийт даалгавар → гүйцэтгэлийн хувь (total > 0)
(check-expect (assignment-percent 8 10) 80)
(check-expect (assignment-percent 7 10) 70)
(check-expect (assignment-percent 0 10) 0)

;; Step02

;; Ex01

;; passing-average? : Number Number Number -> Boolean
(define (passing-average? a b c)
  (>= (average3 a b c) 60))

;; average3 60 ба түүнээс дээш бол #t
(check-expect (passing-average? 60 60 60) #t)
(check-expect (passing-average? 59 59 59) #f)
(check-expect (passing-average? 100 80 0) #t)   ; дундаж яг 60

;; Ex02

;; good-attendance? : Number -> Boolean
(define (good-attendance? n)
  (>= n 80))

;; ирц 80 ба түүнээс дээш бол #t
(check-expect (good-attendance? 80) #t)
(check-expect (good-attendance? 79) #f)

;; Ex03

;; assignments-complete? : Number Number -> Boolean
(define (assignments-complete? a b)
  (>= (assignment-percent a b) 70))

;; assignment-percent 70 ба түүнээс дээш бол #t. assignment-percent-г дуудна.
(check-expect (assignments-complete? 7 10) #t)
(check-expect (assignments-complete? 6 10) #f)
(check-expect (assignments-complete? 0 10) #f)

;; Step03

;; Ex01

;; eligible? : Number Number Number Number Number Number -> Boolean
(define (eligible? a b c d e f)
  (and (passing-average? a b c) (good-attendance? d) (assignments-complete? e f)))

;; s1 s2 s3 attendance completed total → гурван шалгуур бүгд үнэн бол #t
(check-expect (eligible? 80 90 70 85 8 10) #t)
(check-expect (eligible? 80 90 70 79 8 10) #f)   ; ирц
(check-expect (eligible? 59 59 59 100 10 10) #f) ; оноо
(check-expect (eligible? 80 90 70 85 6 10) #f)   ; даалгавар

;; Step04

;; Ex01

;; final-status : Number Number Number Number Number Number -> String
(define (final-status  a b c d e f)
  (if (eligible? a b c d e f)
      "Eligible"
      "Not eligible"
  )
)

;; тэнцсэн бол "Eligible", үгүй бол "Not eligible"
(check-expect (final-status 80 90 70 85 8 10) "Eligible")
(check-expect (final-status 80 90 70 79 8 10) "Not eligible")

;; Step05

;; Ex01

;; letter-grade : Number -> String
(define (letter-grade n)
  (cond
    [(>= n 90) "A"]
    [(>= n 80) "B"]
    [(>= n 70) "C"]
    [(>= n 60) "D"]
    [else "F"]
    
   ))

;; дундаж оноо → "A" "B" "C" "D" "F" (Мягмарын grade-тэй ижил дүрэм)
(check-expect (letter-grade 90) "A")
(check-expect (letter-grade 89) "B")
(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 79) "C")
(check-expect (letter-grade 60) "D")
(check-expect (letter-grade 59) "F")

;; Ex02

;; student-grade : Number Number Number -> String
(define (student-grade a b c)
  (letter-grade (average3 a b c)))
;; гурван оноо → үсгэн дүн. average3 ба letter-grade-г дуудна.
(check-expect (student-grade 80 90 70) "B")
(check-expect (student-grade 100 90 80) "A")

;; Step06

;; Ex01

;; grade-color : Number -> String
(define (grade-color n)
  (cond
    [(>= n 90) "green"]
    [(>= n 80) "blue"]
    [(>= n 70) "gold"]
    [(>= n 60) "orange"]
    [else "red"]
   ))

;; дундаж оноо → өнгө: 90+ "green", 80–89 "blue", 70–79 "gold", 60–69 "orange", бусад "red"
(check-expect (grade-color 90) "green")
(check-expect (grade-color 89) "blue")
(check-expect (grade-color 60) "orange")
(check-expect (grade-color 59) "red")

;; Ex02

;; grade-badge : Number -> Image
;; дундаж оноо → өнгөт тойрог дээр цагаан үсгэн дүн.
(define (grade-badge n)
  (overlay (text (letter-grade n) 24 "white") (circle 30 "solid" (grade-color n))
))
;; grade-color, letter-grade-г дуудна.
(check-expect (grade-badge 95) (overlay (text "A" 24 "white") (circle 30 "solid" "green")))
(check-expect (grade-badge 59) (overlay (text "F" 24 "white") (circle 30 "solid" "red")))

(grade-badge 95) (overlay (text "A" 24 "white") (circle 30 "solid" "green"))
(grade-badge 59) (overlay (text "F" 24 "white") (circle 30 "solid" "red"))
;; Ex03

;; student-card : Number Number Number Number Number Number -> Image
;; s1 s2 s3 attendance completed total → тэмдэг, хажууд нь final-status-ийн текст.
(define (student-card a b c d e f)
  (beside (grade-badge (average3 a b c)) (text (final-status  a b c d e f) 20 "black"))
)

;; average3, grade-badge, final-status-г дуудна.
(check-expect (student-card 80 90 70 85 8 10)
              (beside (grade-badge 80) (text "Eligible" 20 "black")))
(student-card 80 90 70 85 8 10)
              (beside (grade-badge 80) (text "Eligible" 20 "black"))

;; Step07

;; Ex01

;; honor-roll? : Number Number Number Number -> Boolean
(define (honor-roll? a b c d)
  (and (>= (average3 a b c) 90) (>= d 95)))

;; s1 s2 s3 attendance: дундаж 90 ба түүнээс дээш, ирц 95 ба түүнээс дээш бол #t
(check-expect (honor-roll? 90 90 90 95) #t)
(check-expect (honor-roll? 90 90 90 94) #f)
(check-expect (honor-roll? 89 89 89 100) #f)

;; Ex02

;; ineligibility-reason : Number Number Number Number Number Number -> String
;; Хэд хэдэн шалгуур унавал эхнийхийг нь буцаана: оноо → ирц → даалгавар.
(define (ineligibility-reason a b c d e f)
  (cond
    [(not (passing-average? a b c)) "Low score"]
    [(not (good-attendance? d)) "Low attendance"]
    [(not (assignments-complete? e f)) "Missing assignments"]
    [else "Eligible"]
  )
)

;; Бүгд үнэн бол "Eligible".
(check-expect (ineligibility-reason 59 59 59 50 0 10) "Low score")
(check-expect (ineligibility-reason 80 90 70 79 0 10) "Low attendance")
(check-expect (ineligibility-reason 80 90 70 85 6 10) "Missing assignments")
(check-expect (ineligibility-reason 80 90 70 85 8 10) "Eligible")

;; average5 : Number Number Number Number Number -> Number
(define (average5 a1 a2 a3 a4 a5)
  (/ (+ a1 a2 a3 a4 a5) 5))

;; таван онооны дундаж
(check-expect (average5 60 70 80 90 100) 80)