;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; popwin-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; popwin.el (installed via elpa)
;;;; Popup buffers for certain buffers such like *Help*, *Completion*
;;;; popwin.el should be loaded after load windows.el.
;;;; Ref: http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;;; Ref: https://github.com/m2ym/popwin-el
(require 'popwin nil t)
(eval-after-load "popwin"
  '(progn
     (setq popwin:special-display-config
	   (append (list
		    ;;; General
		    '("*Backtrace*"
		      :noselect t)
		    ;;; YaTeX
		    '("*YaTeX-typesetting*"
		      :noselect t)
		    '("*dvi-printing*"
		      :noselect t)
		    '("*dvi-preview*"
		      :noselect t
		      :dedicated t))
		   popwin:special-display-config))
     (eval-after-load "yatex"
       '(progn
	  (require 'popwin-yatex nil t)))
     (popwin-mode 1)))


;;;;; popwin-init.el ends here
