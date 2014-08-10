;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; markdown-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; markdown-mode.el (installed via elpa)
(eval-after-load "markdown-mode"
  '(progn
     (setq markdown-css-path "file://localhost/Users/kubo_shosei/.emacs.d/markdown.css")))

;;;; Warp
;;;; Realtime rendering & preview tool for Markdown
;;;; Ref: http://kotatu.org/blog/2012/04/07/realtime-html-preview-with-emacs/
(add-to-list 'load-path "~/.emacs.d/elisp/warp/")
(autoload 'warp-mode "warp" "Warp" t)
(eval-after-load "warp"
  '(progn
     (add-to-list 'warp-format-converter-alist
		  '("\\.md\\'" t (lambda ()
				'("markdown")
;				(list "pandoc" "-f" "markdown" "-t" "html5" "-c" (expand-file-name "~/.emacs.d/markdown.css") "-s" "-S")
				)))))


;;;;; markdown-init.el ends here
