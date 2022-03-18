;;;; trivial-configuration.asd

(defsystem "trivial-configuration"
  :author "Sebastian Christ <rudolfo.christ@pm.me>"
  :maintainer "Sebastian Christ <rudolfo.christ@pm.me>"
  :mailto "rudolfo.christ@pm.me"
  :license "MPL-2.0"
  :homepage "https://github.com/rudolfochrist/trivial-configuration"
  :bug-tracker "https://github.com/rudolfochrist/trivial-configuration/issues"
  :source-control (:git "https://github.com/rudolfochrist/trivial-configuration.git")
  :version (:read-file-line "version")
  :depends-on ("cl-change-case"
               "parse-number"
               (:require "uiop"))
  :components ((:file "trivial-configuration"))
  :description "A trivial configuration file reader."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.txt")))



