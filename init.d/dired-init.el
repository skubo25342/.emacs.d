;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; dired-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(eval-after-load "dired"
  '(progn
     ;;;; dired+.el (installed via elpa) (not for Windows)
     ;;;; Ref: http://d.hatena.ne.jp/kakurasan/20070702/p1
     ;;;; Ref: http://www.emacswiki.org/emacs/DiredPlus
     ;;;; Ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-47
     (require 'dired+ nil t)
     ;;;; Enable disabled command dired-find-alternate-file
     (put 'dired-find-alternate-file 'disabled nil)
     ;;;; Key bindings
     ;;; Open directory in current buffer
     (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
     ;;; Open parent directory in current buffer
     (define-key dired-mode-map (kbd "^") (lambda ()
					    (interactive)
					    (find-alternate-file "..")))
     ;;; Open file or directory in new buffer
     (define-key dired-mode-map (kbd "a") 'dired-find-file)))


;;;;; dired-init.el ends here
