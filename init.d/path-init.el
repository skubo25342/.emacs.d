;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; path-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; Ref: http://sakito.jp/emacs/emacsshell.html
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Set exec-path and PATH
(cond
 ;;; For Mac
 (ns-p
  ;;; exec-path-from-shell.el (installed via elpa) (for Mac)
  ;;; Ref: https://github.com/purcell/exec-path-from-shell
  ;;; Ref: http://qiita.com/catatsuy/items/3dda714f4c60c435bb25
  ;;; Ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-38
  ;;; Set exec-path and PATH as same as Mac's PATH
  (exec-path-from-shell-initialize))
 ;;; For windows
 (windows-p
  (setq path '(;"/app/script"
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
