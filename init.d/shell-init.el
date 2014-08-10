;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; shell-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; Ref: http://sakito.jp/emacs/emacsshell.html
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setenv "LANG" "ja_JP.UTF-8")
(setq shell-file-name (or (executable-find "zsh")
			  (executable-find "bash")
			  (error "Can't find 'shell' command in PATH!!")))
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(add-hook 'shell-mode-hook
	  '(lambda ()
	     (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))

;;;; multi-term.el (installed via elpa)
;;;; Ref: http://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode
(eval-after-load "multi-term"
  '(progn
     (setq multi-term-program shell-file-name)
     (setq system-uses-terminfo nil)
     (add-hook 'term-exec-hook
	       '(lambda ()
		  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)))))


;;;;; shell-init.el ends here
