(provide 'myapp)
(defpackage myapp
  (:use :common-lisp)
  (:export *app*))
(in-package :myapp)

(defvar *app* (make-instance 'ningle:<app>))

(setf (ningle:route *app* "/")
      "Welcome to ningle!")
