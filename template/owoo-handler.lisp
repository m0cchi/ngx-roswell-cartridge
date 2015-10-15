(provide 'clack.handler.owoo)
(defpackage clack.handler.owoo
  (:use :common-lisp)
  (:export :run
           :*address*
           :*worker-num*
           :*backlog-size*))
(in-package :clack.handler.owoo)

(defvar *backlog-size* 128)
(defvar *worker-num* nil)
(defvar *address* "0.0.0.0")

(defun run (app &key (debug t)
                (port 5000))
  (woo:run app
           :debug debug
           :port port
           :address *address*
           :backlog *backlog-size*
           :worker-num *worker-num*))
