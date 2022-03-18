;;;; trivial-configuration.lisp

(defpackage #:trivial-configuration
  (:nicknames #:config)
  (:use :cl)
  (:export
   #:read-config))

(in-package #:trivial-configuration)

(defmacro read-config (filespec)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@(with-open-file (in filespec)
         (loop for line = (read-line in nil nil)
               while line
               collect (destructuring-bind (key value)
                           (uiop:split-string line :separator '(#\=))
                         `(defparameter ,(intern (format nil "*~A*"
                                                         (string-upcase (cl-change-case:param-case key))))
                            ,(or (ignore-errors (parse-number:parse-number value ))
                                 value)))))))
