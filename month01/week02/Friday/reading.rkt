;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname reading) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ---- Пүрэвийн төсөл: жишээ шийдэл ----
(define (sum3 a b c) (+ a b c))
(define (average3 a b c) (/ (sum3 a b c) 3))
(define (assignment-percent completed total)
  (* (/ completed total) 100))

(average3 80 90 70) 
(assignment-percent 7 10)

(define (passing-average? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))
(define (good-attendance? attendance)
  (>= attendance 80)) 
(define (assignments-complete? completed total)
  (>= (assignment-percent completed total) 70))

(passing-average? 100 80 0)

(define (eligible? s1 s2 s3 attendance completed total)
  (and (passing-average? s1 s2 s3)
       (good-attendance? attendance)
       (assignments-complete? completed total)))

(eligible? 80 90 70 79 8 10)


(define (final-status s1 s2 s3 attendance completed total)
  (if (eligible? s1 s2 s3 attendance completed total)
      "Eligible"
      "Not eligible"))

(final-status 59 59 59 100 10 10)

(define (letter-grade avg)
  (cond
    [(>= avg 90) "A"]
    [(>= avg 80) "B"]
    [(>= avg 70) "C"]
    [(>= avg 60) "D"]
    [else "F"]))

(letter-grade 69)

(define (student-grade s1 s2 s3)
  (letter-grade (average3 s1 s2 s3)))

(student-grade 100 90 80)

(define (ineligibility-reason s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average? s1 s2 s3)) "Low score"]
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignments-complete? completed total)) "Missing assignments"]
    [else "Eligible"]))

(ineligibility-reason 80 90 70 79 0 10)