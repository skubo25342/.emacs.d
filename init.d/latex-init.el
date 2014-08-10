;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; latex-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; yatex.el
;;;; Ref: http://www.yatex.org/
;;;; Ref: http://www.nk.rim.or.jp/~naru/yatex/startup.html
;;;; Ref: http://www.proton.jp/main/latex/yatex.html
;(add-to-list 'load-path "~/.emacs.d/elisp/yatex/yatex1.77")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex\\'" . yatex-mode)
		("\\.cls\\'" . yatex-mode)
		("\\.sty\\'" . yatex-mode)
		("\\.clo\\'" . yatex-mode)
		("\\.bbl\\'" . yatex-mode)
		("\\.aux\\'" . yatex-mode))
	      auto-mode-alist))
(eval-after-load "yatex"
  '(progn
     ;;; Inhibid prefix letter (recommended) -> Can't set successfully...
     (setq YaTeX-inhibid-prefix-letter t)
     ;;; kanji-code
     ;;; 0 : no-conversion
     ;;; 1 : Shift JIS (Windows & DOS default)
     ;;; 2 : ISO-2022-JP (other default)
     ;;; 3 : EUC
     ;;; 4 : UTF-8
     (setq YaTeX-kanji-code nil)
     ;;; Use LaTeX2e
     (setq YaTeX-use-LaTeX2e t)
     ;;; Use AMS-LaTeX
     (setq YaTeX-use-AMS-LaTeX t)
     ;;; Commands
     (cond
      ;; for Mac
      (ns-p
       ;; LaTeX
       (setq tex-command "platex2pdf-utf8")
       ;; BiBTeX
       (setq bibtex-command "pbibtex -kanji=utf8")
       ;; Dvi print
       (setq dviprint-command-format "dvipdfmx %S")
       ;; Previewer
       (setq dvi2-command "open -a Preview"))
      ;; for Windows
      (windows-p
       ;; LaTeX
       (setq tex-command "platex -kanji=utf8")
       ;; Dvi print
       (setq dviprint-command-format "dvipdfmx %S")
       ;; Previewer
       (setq dvi2-command "dviout")
       ;; BiBTeX
       (setq bibtex-command "pbibtex -kanji=utf8")))
     ;;; Inhibid completing parentheses automatically
     (setq YaTeX-close-paren-always t)
     (add-hook 'yatex-mode-hook
	       '(lambda ()
		  ;;; Inhibid auto fill mode
		  (auto-fill-mode -1)
		  ;;; Key bindings
		  ;;; Ref: https://github.com/ryseto/emacs_and_tex/blob/master/my_yatex.el
		  (when (require 'yatexprc nil t)
		    (YaTeX-define-key (kbd "C-t") 'YaTeX-typeset-buffer)
		    (YaTeX-define-key (kbd "C-p") 'YaTeX-preview)
		    (YaTeX-define-key (kbd "C-l") 'YaTeX-lpr)
		    (YaTeX-define-key (kbd "C-k")
				      '(lambda ()
					 (interactive)
					 (YaTeX-kill-typeset-process YaTeX-typeset-process))))))))


;;;; latex-math-preview.el
;;;; Ref: http://transitive.info/software/latex-math-preview/
;;;; Ref: http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
(autoload '(latex-math-preview-expression
	    latex-math-preview-insert-symbol
	    latex-math-preview-save-image-file
	    latex-math-preview-beamer-frame)
  "latex-math-preview" nil t)
(eval-after-load "latex-math-preview"
  '(progn
     ;;; Command paths
     (setq latex-math-preview-command-path-alist
	   '((latex . "latex")
	     (platex . "platex")
	     (pdflatex . "pdflatex")
	     (dvipng . "dvipng")
	     (dvips . "dvips")
	     (dvipdf . "dvipdf")
	     (dvipdfm . "dvipdfm")
	     (dvipdfmx . "dvipdfmx")))
     ;;; Command for preview
     (setq latex-math-preview-tex-to-png-for-preview '(platex dvipng))
     ;;; Command for make png
     (setq latex-math-preview-tex-to-png-for-save '(platex dvipng))
     ;;; Command for make eps
     (setq latex-math-preview-tex-to-eps-for-save '(platex dvips-to-eps))
     ;;; Command for make ps
     (setq latex-math-preview-tex-to-ps-for-save '(platex dvips-to-ps))
     ;;; Command for preview beamer frame
     (setq latex-math-preview-beamer-to-png '(platex dvipdfmx gs-to-png))
     ;;; Settings for YaTeX
     ;; Key binds
     (add-hook 'yatex-mode-hook
	       '(lambda ()
		  (YaTeX-define-key (kbd "M-p") 'latex-math-preview-expression)
		  (YaTeX-define-key (kbd "M-S-p") 'latex-math-preview-save-image-file)
		  (YaTeX-define-key (kbd "M-j") 'latex-math-preview-insert-symbol)
		  (YaTeX-define-key (kbd "M-S-j") 'latex-math-preview-last-symbol-again)
		  (YaTeX-define-key (kbd "M-b") 'latex-math-preview-beamer-frame)))
     ;; Use "YaTeX-in-math-mode-p" to distinguish whether cursor is in math mode or not
     (setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)))


;;;;; latex-init.el ends here
