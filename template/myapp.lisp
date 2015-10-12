(provide 'myapp)

(defpackage myapp
  (:use common-lisp)
  (:export app))

(in-package myapp)

(defun app (env)
  (cond
    ((string= (getf env :path-info) "/")
     '(200
       (:content-type "text/html")
       ("Hello, roswell-cartridge!")))
    (t '(404 (:content-type "text/plain") ("Not found")))))
