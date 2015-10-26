(provide 'app)
(defpackage app
  (:use common-lisp)
  (:export app))

(in-package app)

(defun app (env)
  (cond
   ((string= (getf env :path-info) "/")
    '(200
      (:content-type "text/html")
      ("Hello, ngx-roswell-cartridge!")))
   (t '(404 (:content-type "text/plain") ("Not found")))))
