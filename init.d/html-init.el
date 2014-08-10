;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; html-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; yahtml.el
;;;; Ref: http://www.yatex.org/
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(add-to-list 'auto-mode-alist '("\\.html\\'" . yahtml-mode))
(eval-after-load "yahtml"
  '(progn
     ;;; Browser command
;     (setq yahtml-www-browser "")
     ;;; Image viewer command
;     (setq yahtml-image-viewer "")
     ;;; Lint program command
;     (setq yahtml-lint-program "")
     ;;; kanji code for html file
     ;;; 1 : Shift JIS
     ;;; 2 : JIS (default)
     ;;; 3 : EUC
     (setq yahtml-kanji-code nil)
     ;;; Inhibid auto fill mode
     (add-hook 'yahtml-mode-hook '(lambda ()
				    (auto-fill-mode -1)))
     ;;; Correspondence between URL and html file path
     (setq yahtml-path-url-alist
	   '(("/Users/kubo_shosei/Dropbox/Public/html/html_ref" .
	      "https://dl.dropboxusercontent.com/u/79096678/html/html_ref")))))


;;;;; html-init.el ends here
