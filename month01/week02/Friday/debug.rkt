;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname debug) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; debug.rkt-ийн эхэнд 2-р хэсгийн жишээ шийдлийг хуул.

;; 1. Хувь урвуу бодогдож байна
(define (assignment-percent-1 completed total)
  (* completed total))  ;;  !!!  total completed bairiig zassan 
(check-expect (assignment-percent-1 8 10) 80)

;; 2. Дундажийн оронд нийлбэр шалгаж байна
(define (sum3 s1 s2 s3)   ;; +++ niilber olson
  (+ s1 s2 s3))
(define (average3 s1 s2 s3) ;; +++ dundaj olson
  (/ (sum3 s1 s2 s3) 3))
(define (passing-average-2? s1 s2 s3)
  (>= (average3 s1 s2 s3) 60))    ;; !!! sum3 buyu niilber olohiig average3 buyu dundajiig shalgasan
(check-expect (passing-average-2? 20 20 20) #f)

;; 3. Нэг шалгуур мартагдсан

(define (good-attendance? attendance)  ;; +++ irts shalgah  nemsen
  (>= attendance 80))
(define (assignments-complete? completed total)  ;; +++ guitsetgelees avsan huvi shalgah nemsen 
  (>= (assignment-percent-1 completed total) 70))

(define (eligible-3? s1 s2 s3 attendance completed total)
  (and (passing-average-2? s1 s2 s3)
       (good-attendance? attendance) 
       (assignments-complete? completed total) ;; !!! guitsetgelees avsan huvi shalgah nemsen 
   )
)
(check-expect (eligible-3? 80 90 70 85 6 10) #f)

;; 4. Хоёр string-ийн байр солигдсон

(define (final-status-4 s1 s2 s3 attendance completed total)
  (if (eligible-3? s1 s2 s3 attendance completed total)
      "Eligible"        ;;  !!! "Not eligible", "Eligible"   bair soligdson
      "Not eligible"
      ))
(check-expect (final-status-4 80 90 70 85 8 10) "Eligible")

;; 5. Оролтын тоо таарахгүй
(define (final-status-5 s1 s2 s3 attendance completed total)
  (if (eligible-3? s1 s2 s3 attendance completed total)  ;;;  !!!  total dutuu bichsen baina
      "Eligible"
      "Not eligible"))
(check-expect (final-status-5 80 90 70 85 8 10) "Eligible")

;; 6. Шалтгааны дараалал буруу
(define (ineligibility-reason-6 s1 s2 s3 attendance completed total)
  (cond
    [(not (passing-average-2? s1 s2 s3)) "Low score"]  ;;; !!! [(not (good-attendance? attendance)) "Low attendance"]  bair soligdson
    [(not (good-attendance? attendance)) "Low attendance"]
    [(not (assignment-percent-1 completed total)) "Missing assignments"]
    [else "Eligible"]))
(check-expect (ineligibility-reason-6 59 59 59 50 0 10) "Low score")