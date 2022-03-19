;;;; trivial-configuration.lisp

(defpackage #:trivial-configuration
  (:nicknames #:config)
  (:use :cl)
  (:export
   #:read-config))

(in-package #:trivial-configuration)


(defun cleanup (string)
  (if (and (uiop:string-prefix-p "\"" string)
           (uiop:string-suffix-p string "\""))
      (let ((sub (subseq string 1 (1- (length string)))))
        ;; replace double escapes
        (ppcre:regex-replace-all "\\\\\"" sub "\""))
      string))


(defun collect-pairs (filespec)
  (with-open-file (stream filespec)
    (loop for line = (read-line stream nil nil)
          while line
          collect (destructuring-bind (key value)
                      (uiop:split-string line :separator '(#\=))
                    (cons key
                          (or (ignore-errors (parse-number:parse-number value))
                              (cleanup value)))))))


(defun interpolate (string mappings)
  (if (typep string 'string)
      (with-output-to-string (out)
        (loop for sub in (ppcre:split "(\\\$[\\w_]+)" string :with-registers-p t)
              if (char= #\$ (char sub 0))
                do (princ (cdr (find (subseq sub 1) mappings :key #'car :test #'string=))
                          out)
              else
                do (write-string sub out)))
      string))


(defmacro read-config (filespec)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@(loop with mappings = (collect-pairs filespec)
             for (name . value) in mappings
             collect `(defparameter
                          ,(intern (format nil "*~A*"
                                           (string-upcase (cl-change-case:param-case name))))
                        ,(interpolate value mappings)))
     (values)))
