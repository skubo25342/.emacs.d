;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; howm-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; Ref: http://howm.sourceforge.jp/index-j.html
;;;;; Ref: http://blogs.yahoo.co.jp/t_terui/64103355.html
;;;;; Ref: http://uwabami.junkhub.org/log/20101226p01.html
;;;;; Ref: http://www.kyo-ko.org/knowhow/vine/memo12.html
;;;;; Ref: http://codeout.hatenablog.com/entry/2014/04/16/023011
;;;;; Ref: http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?SwitchMemoDirectory
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Title header
;;; This must be evaluated before load howm.
(defvar howm-view-title-header "#")
(require 'howm nil t)
(eval-after-load "howm"
  '(progn
     ;;;; Set language
     (setq howm-menu-lang 'ja)
     ;;;; Howm data directory
     (setq howm-directory "~/howm/general/")
     ;;;; Menu file
     ;;;; Set menu file manually
     (setq howm-menu-top nil)
     ;;;; Menu file name
     (setq howm-menu-file (concat howm-directory ".howm-menu"))
     ;;;; File name format
     ;;; Save files in "howm-directory"/"howm-file-name-format"
     (setq howm-file-name-format "%Y/%m/%Y-%m-%d.md")
     ;;;; Keyword file
     (setq howm-keyword-file (concat howm-directory ".howm-keys"))
     ;;;; History file
     (setq howm-history-file (concat howm-directory ".howm-history"))
     ;;;; Switch howm-directory
     (defun howm:switch-howm-directory (dir)
       `(lambda ()
	  (interactive)
	  (kill-buffer (howm-keyword-buffer))
	  (setq howm-directory ,dir)
	  (setq howm-keyword-file (concat howm-directory ".howm-keys"))
	  (setq howm-history-file (concat howm-directory ".howm-history"))
	  (howm-menu)
	  (message "[howm]: howm-directory is switched to %s" ,dir)))
     ;;;; Enable howm-menu
     (howm-menu)))


;;;;; howm-init.el ends here
