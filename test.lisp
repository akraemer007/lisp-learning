(defparameter *list* '(red green blue))

(defun my-second (list)
  (cdr list))

(my-second *list*)

(oddp (+ 2 2))

;; 3.5
(defun half (number)
  (/ number 2))
(equal 8 (half 16))

(defun cube (number)
  (* number number number))
(equal 8 (cube 2))

(defun onemorep (bignum num)
  (equal bignum (+ 1 num)))
(onemorep 6 5)

;; 3.6
(defun pythag (x y)
  (sqrt (+ (* x x)
           (* y y))))
(equal 5 (pythag 3 4))

;;3.7
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
  (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))
(miles-per-gallon 100 200 5)
(sp--get-pair-list-context)

;;3.9
(cons 5 (list 6 7))
(cons 5 '(list 6 7))
(list 3 `from 9 `gives (- 9 3))
(+ (length `(1 foo 2 moo))
   (third `(1 foo 2 moo)))
;; 3.11
(defun longer-than (x y)
  (> (length x)
     (length y)))
(longer-than '(a b c) '(1 2))
(longer-than '(a) '(1 2))
;; 3.12
(defun addlength (list)
  (cons (length list) list))
(addlength '(moo goo gai pan))
(addlength (addlength '(moo goo gai pan)))

(defun myfun (x y)
  (list (list x) y))
(myfun 'alpha 'beta)

(sp--get-pair-list-context)

;; 4.1
(defun make-even (num)
  (if (oddp num) (+ num 1) num))
(equal 2 (make-even 1))
;; 4.2
(defun further (num)
  (if (> num 0) (+ num 1) (- num 1)))
(further 1)
(further -2)
(further 0)
;; 4.3
(defun my-not (bort)
  (if bort () T))
(my-not ())
;; 4.4
(defun ordered (x y)
  (if (> x y) (list y x) (list x y)))
(ordered 4 5)
(ordered 5 4)

;;4.6
(defun my-abs (num)
  (cond ((> num 0) num)
        ((< num 0) (* -1 num))
        (T 0)))
(mapcar #'my-abs '(1 -1 0))

(defun emphasize (x)
  (cond ((equal (first x) `good) (cons `great (rest x)))
        ((equal (first x) `bad) (cons `awful (rest x)))))
(emphasize '(good mystery story))
;;4.8
(defun emphasize3 (x)
  (cond ((equal (first x) `good) (cons `great (rest x)))
        ((equal (first x) `bad) (cons `awful (rest x)))
        (T (cons `very (rest x)))))
(emphasize3 '(bad long day))
;;4.9
(defun make-odd (x)
  (cond
    ((not (oddp x)) (+ x 1))
    (t x)))
(mapcar #'make-odd '(3 4 -2))
;;4.10
(defun constrain (x min max)
  (cond ((< x min) min)
        ((> x max) max)
        (t x)))
(constrain 3 -50 50)
(constrain 92 -50 50)
(defun constrain (x min max)
  (if (< x min) min 
        ((> x max) max
         (t x))))
(constrain 3 -50 50)
(constrain 92 -50 50)
;;4.11
(defun firstzero (x)
  (mapcar (lambda (x y) (if (not (equal x 0)) () y))
          x
          '(first second third)))
(firstzero '(3 0 1))
(defun firstzero (x)
  (cond ((equal 0 (first x)) 'first)
        ((equal 0 (second x)) 'second)
        ((equal 0 (third x)) 'third)))
(firstzero '(3 0 1))
;; won't work (firstzero 3 0 1)
;;4.12
(defun cycle (x)
  (cond ((equal x 99) 1)
        (t (+ 1 x))))
(mapcar #'cycle '(97 98 99))
;;4.13
(defun howcompute (x y z)
  (cond ((equal z (+ x y)) 'sum-of)
        ((equal z (* x y)) 'product-of)
        ((equal z (- x y)) 'differnce-of)
        ((equal z (/ x y)) 'quotient-of)
        (t '(beats me))))
(howcompute 3 4 12)
;;4.15
(defun geq (x y)
  (if (or (> x y) (equal x y)) T))
(geq 1 1)
(geq 2 1)
(geq 1 2)
;;4.16
(defun random-transform (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
        ((and (oddp x) (< x 0)) (* 2 x))
        (t (/ x 2))))
(random-transform 3)
(random-transform -3)
(random-transform -4)
;;4.17
(defun age-sex-detector (sex age)
  (cond ((and (or (equal sex 'boy) (equal sex 'girl))
              (equal age 'child)))
        ((and (or (equal sex 'man) (equal sex 'woman))
              (equal age 'adult)))))
(age-sex-detector 'boy 'child) ;;-> T
(age-sex-detector 'man 'adult) ;;-> T
(age-sex-detector 'man 'child) ;;-> NIL
;; 4.18
(defun play (player1 player2)
  (cond
    ((or
          (and (equal player1 'rock)
               (equal player2 'scissors))
          (and (equal player1 'paper)
               (equal player2 'rock))
          (and (equal player1 'scissors)
               (equal player2 'paper)))
     'first-wins)
    ((or
          (and (equal player2 'rock)
               (equal player1 'scissors))
          (and (equal player2 'paper)
               (equal player1 'rock))
          (and (equal player2 'scissors)
               (equal player1 'paper)))
     'second-wins)
    (t 'tie)))
(play 'scissors 'rock)
(play 'scissors 'paper)
;;4.19
(defun logical-and (x y)
  (if x (if y t)))
;;4.35
(defun demorgan-and (x y z)
  (not (or (not x)
           (not y)
           (not z))))
(demorgan-and t t f)

;;5.1
(defun poor-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))
(poor-style 8)
;;5.6
(defun throw-die ()
  ;; randomly generage 1-6
  (+ 1 (random 6)))
(throw-die)
(defun throw-dice ()
  ;; create list of 2 randomly generated die
  (let ((throw (list (throw-die) (throw-die))))
    throw))
(throw-dice)
(defun snake-eyes-p (throw)
  ;; eval if throw = (1 1)
  (if (equal throw '(1 1)) 't))
(defun boxcars-p (throw)
  ;; eval if throw = (6 6)
  (if (equal throw '(6 6)) 't))
(defun instant-win-p (throw)
  (let ((die-sum
          (+ (first throw) (second throw))))
    (if (or (equal 7 die-sum) (equal 11 die-sum)) t)))
(instant-win-p '(1 6))
(defun instant-loss-p (throw)
  (let ((die-sum
          (+ (first throw) (second throw))))
    (if (or (equal 2 die-sum)
            (equal 3 die-sum)
            (equal 12 die-sum)) t)))
(instant-loss-p '(1 1))
(defun say-throw (throw)
  (cond ((snake-eyes-p throw) 'snake-eyes)
        ((boxcars-p throw) 'boxcars)
        (t (apply #'+ throw))))
(say-throw (throw-dice))
(throw-dice)
(defun craps ()
  (let* ((throw (throw-dice))
         (die-1 (first throw))
         (die-2 (second throw))
         (die-result (say-throw throw))
         (score (cond ((instant-win-p throw) (list die-result '-- 'you 'win))
                      ((instant-loss-p throw) (list die-result '-- 'you 'lose))
                      (t (list 'your 'point 'is die-result)))))
    (append '(throw) (list die-1) '(and) (list die-2) '(--) score)))
(craps)
(defun try-for-point (num)
  (let* ((throw (throw-dice))
         (die-1 (first throw))
         (die-2 (second throw))
         (die-result (say-throw throw))
         (score (cond ((equal (apply #'+ throw) num) (list die-result '-- 'you 'win))
                      ((equal (apply #'+ throw) 7) (list die-result '-- 'you 'lose))
                      (t (list die-result '-- 'throw 'again)))))
    (append '(throw) (list die-1) '(and) (list die-2) '(--) score)))
(try-for-point 9)

;;6.5
(setf *line* '(roses are red))
(reverse *line*)
(first (last *line*))
(nth 1 *line*)
(reverse (reverse *line*))
;;6.7
(defun next-to-last (x)
  (reverse (first x)))
(next-to-last *line*)
;;6.8
(defun my-butlast (x)
  (reverse (cdr (reverse x))))
(my-butlast *line*)
(my-butlast '(g a g a))
;;6.9
(cdr)
;;6.10
(defun palendromep (x)
  (if (equal x (reverse x)) t))
(palendromep '(a b c b a))
(palendromep '(b c b a))
;;6.11
(defun make-palindrome (x)
  (append x (reverse x)))
(make-palindrome '(you and me))
;; 6.13
(intersection '(a b c) ())
;; 6.14
(intersection '(a b c) '(a b c))
;; 6.15
(defun contains-the-p (x)
  (member 'the x))
(defun contains-article-p (x)
  (intersection '(the a and) x))
(contains-article-p '(bort a bort bort))
(defun contains-article-p (x)
  (intersection '(the a and) x))
(contains-article-p '(bort a bort bort))
(defun contains-article-p (x)
  (or (member 'the x)
      (member 'a x)
      (member 'an x)))
(contains-article-p '(bort the bort bort))
(defun contains-article-p (x)
  (not (and (not (member 'the x))
            (not (member 'a x))
            (not (member 'an x)))))
(contains-article-p '(bort bort bort))
;;6.16
(union '(a b c) ())
;;6.17
(union '(a b c) '(a b c))
;;6.18
(defun add-vowels (x)
  (union x '(a e i o u)))
(add-vowels '(x a e z))
;;6.24
(defun set-equal (x y)
  (and (subsetp x y)
       (subsetp y x)))
(set-equal '(a b) '(a b))   ;-> t
(set-equal '(a b) '(a b c)) ;-> ()
(defun propper-set (x y)
  (and (subsetp x y)
       (not (subsetp y x))))
(propper-set '(a c) '(a c b))   ;-> t
(propper-set '(a c b) '(a c b)) ;-> ()
;;6.26
(setf bort '(large red shiny cube -vs- small shiny red four-sided pyramid))
(defun right-side (x)
  (reverse (set-difference (member '-vs- x) '(-vs-))))
(right-side bort)
(defun left-side (x)
  (set-difference (member '-vs- (reverse x)) '(-vs-)))
(left-side bort)
(defun count-common (x y)
  (length(intersection x y)))
(count-common (left-side bort) (right-side bort))
(defun compare (x)
  (let ((n
          (count-common (left-side x) (right-side x))))
    (append (list n) '(common features))))
(setf bort '(large red shiny cube -vs- small shiny red four-sided pyramid))
(compare bort)
;6.28
(setf *produce*
      '((apple . fruit)
        (celery . veggie)
        (banana . fruit)
        (lettuce . veggie)))
(assoc 'banana *produce*)
(rassoc 'fruit *produce*)
(assoc 'lettuce *produce*)
(rassoc 'veggie *produce*)
;6.30
(setf *books* '((kafka-on-the-shore . haruki-murakami)
                (great-gatsby . f-scott-fitzgerald)
                (odyssey . homer)
                (the-shining . stephen-king)
                (odd-thomas . dean-kuntz)))
;;6.31
(defun who-wrote (title book-list)
  (cdr (assoc title book-list)))
(who-wrote 'odyssey *books*)
;;6.32
(who-wrote 'odyssey (reverse *books*))
;;6.33
(defun what-wrote (title book-list)
  (car (rassoc title book-list)))
(what-wrote 'homer *books*)
;;6.34
(setf *atlas* '((pennsylvania . pittsburgh)
                (new-jersey . newark)
                (pensylvania . johnstown)
                (ohio . columbus)
                (new-jersey . princeton)
                (new-jersey . trenton)))
(assoc 'pennsylvania *atlas*)
(setf *atlas* '((pennsylvania . (pittsburgh johnstown))
                (new-jersey . (newark princeton trenton))
                (ohio . columbus)))
(assoc 'pennsylvania *atlas*)
;;6.35
;; a 
(setf *nerd-states*
      '((sleeping . eating)
        (eating . waiting-for-a-computer)
        (waiting-for-a-computer . programming)
        (programming . debugging)
        (debugging . sleeping)))
;; b
(defun nerdus (state nerd-states)
  (cdr (assoc state nerd-states)))
(nerdus 'sleeping *nerd-states*)
;; c
(nerdus 'playing-guitar *nerd-states*) ;;=> nil
;; d
(defun sleepless-nerdus (state nerd-states)
  (let ((next-state (nerdus state nerd-states)))
    (if (equal next-state 'sleeping) 'eating next-state)))
(sleepless-nerdus 'sleeping *nerd-states*)
(sleepless-nerdus 'eating *nerd-states*)
;; e
(defun nerd-on-caffine (state nerd-states)
  (sleepless-nerdus (sleepless-nerdus state nerd-states) nerd-states))
(nerd-on-caffine 'programming *nerd-states*)
(nerd-on-caffine 'eating *nerd-states*) ;; => infinity
;; 6.36
;; I'm not sure what the "right" way to do this is
(defun swap-first-last (x)
  (let ((fst (first x))
        (lst (car (last x))))
    (append (list lst) (remove lst (remove fst x)) (list fst))))
(swap-first-last '(you cant buy love))
;;6.37
(setf *x* '(a b c d e))
(defun rotate-left (x)
  (append (cdr x) (list (car x))))
(rotate-left *x*)
(defun rotate-right (x)
  (append (last x) (remove (car (last x)) x)))
(rotate-right *x*)
;;6.38
;;meh
(set-diff-equal (x y)
  ())
(setf a '(a b c))
(setf b '(a b c e))
(set-difference b a)
;;6.40
(member 'a '(a b c d))
(member 'd '(a b c d))
(setf *member-table* '((a '(a b c d))
                       (b '(b c d))
                       (c '(c d))
                       (d '(d))))
(assoc 'a *member-table*)
;;7.1
(defun add1 (x)
  (+ x 1))
(mapcar #'add1 '(1 3 5 7 9))
;;7.2
(setf *daily-planet* '((olsen jimmy 123-76-4535 cub-reporter)
   (kent  clark 089-52-6787 reporter)
   (lane  lois  951-26-1438 reporter)
   (white perry 355-16-7439 editor)))
(mapcar #'third  *daily-planet*)
;;7.3
(mapcar #'zerop '(2 0 3 4 0 -5 -6))
;;7.4
(defun greater-than-five-p (x)
  (> x 5))
(mapcar #'greater-than-five-p '(10 0 3 4 0 -5 -6))
;;7.5
(mapcar #'(lambda (x) (- x 7)) '(10 0 3 4 0 -5 -6))
;;7.6
(mapcar #'(lambda (x) (equal x t)) '(t 0 3 4 0 -5 -6))
;; 7.7
(mapcar #'(lambda (x) (if (equal x 'up) 'down 'up)) '(up up down))
;;7.8
(defun roughly-equal (x k)
  (find-if #'(lambda (i)
               (< (abs (- i k)) 11))
           x))
(roughly-equal '(120 20 100 22 -4 3) 3)
;;7.9
(defun find-nested ())
;;7.10
;;a
(setf *note-table*
      '((c . 1)
        (c-s . 2)
        (d . 3)
        (d-s . 4)
        (e . 5)
        (f . 6)
        (f-s . 7)
        (g . 8)
        (g-s . 9)
        (a . 10)
        (a-s . 11)
        (b . 12)))
;;b
(defun numbers (notes)
  (mapcar #'(lambda (x)
              (cdr (assoc x *note-table*)))
          notes))
(numbers '(e d c d e e e))
;;c
(defun notes (numbers)
  (mapcar #'(lambda (x)
              (car (rassoc x *note-table*)))
          numbers))
(notes '(5 3 1 3 5 5 5))
;;d
(numbers (notes '(5 3 1 3 5 5 5)))
(notes (numbers '(e d c d e e e)))
(notes (notes '(5 3 1 3 5 5 5)))
(numbers (numbers '(e d c d e e e)))
;;e
(defun raise (steps numbers)
  (mapcar #'(lambda (number)
              (+ steps number))
          numbers))
(raise 5 '(5 3 1 3 5 5 5))
;;f
(defun normalize (numbers)
  (mapcar #'(lambda (number)
              (cond ((> number 12) (- number 12))
                    ((< number 1) (+ number 12))
                    (T number)))
          numbers))
(normalize '(6 10 13))
;;g
(defun transpose (number song)
  (notes (normalize (raise number (numbers song)))))
(transpose 5 '(e d c d e e e))
;;7.11
(defun between-1-5 (x)
  (remove-if-not #'(lambda (i)
                 (and (> i 1) (< i 5)))
             x))
(between-1-5 '(1 2 3 4 5))
;;7.12
(defun count-the-the (lst)
  (length
   (remove-if-not #'(lambda (x) (equal x 'the))
                  lst)))
(count-the-the '(bort the the))
;;7.13
(defun length-2-list (lol)
  (remove-if-not #'(lambda (x) (equal (length x) 2))
                 lol))
(setf *test*
      '((1)
        (1 2)
        (1 2)
        (1 2)
        (1 2 3)))
(length-2-list *test*)
;7.14
(defun my-intersection (x y)
  (remove-if-not #'(lambda (e) (member e y))
                 x))
(my-intersection  '(a b c) '(a))
(defun my-union (x y)
  (append (remove-if #'(lambda (e) (member e y))
                     x)
          y))
(my-union '(a b c) '(a k))
;;7.15
;;a
(defun rank (x)
  (car x))
(rank '(2 clubs))
(defun suit (x)
  (cdr x))
(suit '(2 clubs))
;;b
(setf *my-hand*
      '((3 hearts)
        (5 clubs)
        (2 diamonds)
        (4 diamonds)
        (ace spades)))
(defun count-suit (suit hand)
 (length
   (remove-if-not #'(lambda (x) (member suit x))
                  hand)))
(count-suit 'diamonds *my-hand*)
;;c
(setf *colors* '((clubs . black)
                 (diamonds . red)
                 (hearts . red)
                 (spades . black)))
(defun color-of (card)
  (cdr (assoc (second card) *colors*)))
(color-of '(6 hearts))
;;d
(defun first-red (hand)
  (find-if #'(lambda (x) (equal 'red (color-of x)))
           hand))
(first-red *my-hand*)
(first-red '((ace spades)))
;;e
(defun black-cards (hand)
  (remove-if-not #'(lambda (x) (equal 'black (color-of x)))
                 hand))
(black-cards *my-hand*)
;;f
(defun what-ranks (suit hand)
  (mapcar #'rank
          (remove-if-not #'(lambda (x)
                             (equal suit (car (last x))))
                         hand)))
(what-ranks 'spades *my-hand*)
(what-ranks 'diamonds *my-hand*)
;;g
(setf *all-ranks* '(2 3 4 5 6 7 8 9 10 jack queen king ace))
(defun higher-rank-p (x y ranks)
  (member x (member y ranks)))
(higher-rank-p 2 3 *all-ranks*)
(higher-rank-p 3 2 *all-ranks*)
;;h
(defun high-card (hand)
  (assoc (find-if #'(lambda (x) (assoc x hand))
                  (reverse *all-ranks*))
         hand))
(high-card *my-hand*)
;;i just don't care yet
(defun high-card-reduce (hand)
  (reduce #'(lambda (x) higher-rank-p) hand))
(high-card-reduce *my-hand*)
(trace high-card-reduce)
;;7.16
(setf *setz* '((a b c) (c d a) (f b d) (g)))
(reduce #'union *setz*)
;;7.19
(defun all-odd (x)
  (every #'oddp x))
(all-odd '(1 2 9))
(all-odd '(1 3 9))
;;7.20
(defun none-odd (x)
  (every #'evenp x))
(none-odd '(1 2 9))
(none-odd '(2 2 2))
;;7.21
