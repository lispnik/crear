;;; -- @name@.asd
#-asdf3.3 (error "@name@ requires ASDF 3.3")

(in-package #:asdf-user)

(defsystem #:@name@
  :description ""
  :author ""
  :licence ""
  :version (:read-file-line "version")
  :components
  ((:module "src"
    :serial t
    :components ((:file "package")
		 (:file "@name@"))))
  :in-order-to ((test-op (test-op #:@name@-test))))

(defsystem #:@name@-test
  :components
  ((:module "test"
    :serial t
    :components ((:file "tests"))))
  :depends-on (#:fiveam #:@name@)
  :perform (test-op (o s)
		    (symbol-call "FIVEAM" "RUN!"
				 (find-symbol* "@NAME@-TEST-SUITE" "@NAME@-TESTS"))))
;;; -- src/package.lisp
(defpackage #:@name@
  (:use #:common-lisp
	#:alexandria)
  (:export #:@name@))
;;; -- src/@name@.lisp
(in-package #:@name@)

(defun @name@ (&rest args) nil)
;;; -- test/test.lisp
(defpackage #:@name@-test
  (:use #:common-lisp
	#:fiveam
	#:@name@)
  (:export #:run!
	   #:@name@-test-suite))

(in-package #:@name@-test)

(def-suite @name@-test-suite
  :description "")

(in-suite @name@-test-suite)

(test @name@-test
      ""
      (is (@name@)))
;;; -- .gitignore
*~
*.fasl
;;; -- .projectile
