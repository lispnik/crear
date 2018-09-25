(in-package #:crear)

(defun crear (&rest args))

(let ((template-pathname #p"templates/simple.lisp")))
(defvar *template-line-regexp* "^;;; --")
(defvar *template-regexp* "@(\\w)@")

(defun parse-template (string))

(defun expand-pairs (pairs)
  (loop
    with result = (make-hash-table)
    for (k . v) in pairs
    do (setf (gethash (concatenate 'string "_" k) result) v
	     (gethash (string-capitalize k) result) (string-capitalize v)
	     (gethash (string-downcase k) result) (string-downcase v)
	     (gethash (string-upcase k) result) (string-upcase v))
    finally (return result)))



