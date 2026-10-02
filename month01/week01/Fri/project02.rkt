;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname project02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; --- songolt 3 ---

; Функцийн нэр: travel-time
; Оролт: km, speed
; Гаралт: time
; Томьёо: km / speed = time
(define (travel-time km speed)
  (/ km speed))

(travel-time 300 60) ; Хүлээсэн үр дүн: 5

; Функцийн нэр: fuel-needed
; Оролт: km, ml
; Гаралт: fuel
; Томьёо: km / 100 * ml = fuel
(define (fuel-needed km ml)
  (* (/ km 100) ml))

(travel-time 500 9) ; Хүлээсэн үр дүн: 55.5

; Функцийн нэр: distance-per-day
; Оролт: km
; Гаралт: per-day
; Томьёо: km / 700 = per-day
(define (distance-per-day km)
  (/ km 700))

(distance-per-day 1500) ; Хүлээсэн үр дүн: 2.142857

; Функцийн нэр: average-speed
; Оролт: max min
; Гаралт: speed
; Томьёо: (max + min)/2 = speed
(define (average-speed max min)
  (/ (+ max min) 2))

(average-speed 120 70) ; Хүлээсэн үр дүн: 95

; Функцийн нэр: total-distance
; Оролт: km speed
; Гаралт: total
; Томьёо: (km / speed) = total
(define (total-distance km speed)
  (/ km speed))
(total-distance 300 60) ; Хүлээсэн үр дүн: 5


