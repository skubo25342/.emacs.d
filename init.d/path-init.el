;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; path-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;; ref: http://sakito.jp/emacs/emacsshell.html
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Set exec-path and PATH
(cond
 ;;; For Mac
 (ns-p
  ;;; exec-path-from-shell.el (installed via elpa) (for Mac)
  ;;; ref: https://github.com/purcell/exec-path-from-shell
  ;;; ref: http://qiita.com/catatsuy/items/3dda714f4c60c435bb25
  ;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-38
  ;;; Set exec-path and PATH as same as Mac's PATH
  (when (require 'exec-path-from-shell)
    (exec-path-from-shell-initialize)))
 ;;; For windows
 (windows-p
  (setq path (list ;"/app/script"
		   "/cygdrive/c/usr/local/W32TeX/bin"
		   "/cygdrive/c/dviout"
		   "/cygdrive/c/Program Files (x86)/gnuplot/binary"))
  ;;; Splitter between each directories
  (setq path-directory-splitter ";")
  (dolist (dir path)
    (when (and (file-exists-p dir) (not (member dir exec-path)))
      (setenv "PATH" (concat dir path-directory-splitter (getenv "PATH")))
      (setq exec-path (append (list dir) exec-path))))))


;;;;; path-init.el ends here
