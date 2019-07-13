(defvar a "a variable")

(defun b ()
  "a function"
  (+ 2 2))

(defun c ()
  "another function"
  (let ((x 42))
    (+ x
       (+ 2 2)
       (+ 3 3)
       (+ 4 4))))

(progn
  (+ 1 1)
  (+ 2 2)
  (+ 3 3))