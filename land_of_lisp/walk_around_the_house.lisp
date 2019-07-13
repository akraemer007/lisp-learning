(defvar *nodes* '((living-room (you are in the living-room. a wizard is snorling loudly on the couch.))
                  (garden (you are in a beautiful garden. there is a well in front of you.))
                  (attic (you are in a the attic. there is a giant welding torch in the corner.))
                  ))



(defun describe-location (location nodes)
  (cadr (assoc location nodes)))


(describe-location 'living-room *nodes*)

(defvar *edges* '((living-room (garden west door)
                               (attic upstairs ladder))
                  (garden (living-room east door))
                  (attic (living-room downstairs ladder))))

(cdr (assoc 'living-room *edges*))
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(describe-path '(garden west door))
;; (cdr `(garden west door)) ; (west door)
;; (car `(garden west door)) ; (garden)
;; (cadr `(garden west door)) ; (west)
(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
(describe-paths 'living-room *edges*)

;; (cdr (assoc 'living-room *edges*))
;; (apply #'append (mapcar #'describe-path '((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER))))
;; (mapcar #'describe-path '((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER)))
;; (append (mapcar #'describe-path '((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER))))

(defvar *objects* '(whiskey bucket frog chain))
(defvar *object-locations* '((whiskey living-room)
                             (bucket living-room)
                             (frog garden)
                             (chain garden)))
(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
                     (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(objects-at 'living-room *objects* *object-locations*) ;doesn't run in emacs

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
                         `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(describe-objects 'living-room *objects* *object-locations*)

;look around
(defparameter *location* 'living-room)

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))

(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (car next))
               (look))
        '(you cannot go that way.))))

(defun pick-up (object)
  (cond ((member object
                 (objects-at *location* *objects* *object-locations*))
         (push (list object 'body) *object-locations*)
         `(you are now carrying the ,object))
        (t '(you cannot get that.))))

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))
