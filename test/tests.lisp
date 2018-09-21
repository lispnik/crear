(defpackage #:crear-tests
  (:use #:common-lisp
	#:fiveam
	#:crear))

(in-package #:crear-tests)

(def-test-suite crear-test-suite)

(test crear
      "test main "
      (is (crear)))
