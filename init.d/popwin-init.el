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
;;;; ref: http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;;; ref: https://github.com/m2ym/popwin-el
(when (require 'popwin)
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
		   :dedicated t)
		 )
		popwin:special-display-config))
  ;;; popwin for YaTeX
  (add-to-list 'load-path "~/.emacs.d/elisp/popwin")
  (eval-after-load "yatex" '(require 'popwin-yatex))
  (popwin-mode 1))


;;;;; popwin-init.el ends here
