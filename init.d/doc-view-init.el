;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; doc-view-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; Ref: http://mublakcalb.blog74.fc2.com/blog-entry-363.html
;;;;; Ref: http://stackoverflow.com/questions/7088677/how-to-set-emacs-variable-doc-view-continuous
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(autoload 'doc-view-mode "doc-view" "doc-view-mode" t)
(eval-after-load "doc-view"
  '(progn
     ;;; Program to convert ps and pdf files to png
     (setq doc-view-ghostscript-program
	   (cond
	    ;;; for Mac
	    (ns-p "gs")
	    ;;; for Windows
	    (windows-p "gswin32c")
	    ;;; default
	    (t "gs")))
     ;;; View document pages continuously
     (setq doc-view-continuous t)))


;;;;; doc-view-init.el ends here
