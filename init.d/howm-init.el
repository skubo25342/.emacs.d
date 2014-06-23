;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; howm-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;; ref: http://howm.sourceforge.jp/index-j.html
;;;;; ref: http://blogs.yahoo.co.jp/t_terui/64103355.html
;;;;; ref: http://uwabami.junkhub.org/log/20101226p01.html
;;;;; ref: http://www.kyo-ko.org/knowhow/vine/memo12.html
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path "~/.emacs.d/elisp/howm/howm-test130321")
(when (require 'howm nil t)
  ;;;; Set language
  (setq howm-menu-lang 'ja)
  ;;;; Howm data directory
  (setq howm-directory "~/.emacs.d/howm/")
  ;;;; Menu file
  ;;; Set menu file manually
  (setq howm-menu-top nil)
  ;;; Menu file name
  (setq howm-menu-file (concat howm-directory ".howm-menu"))
  ;;;; File name format
  ;;;; Save files in "howm-directory"/"howm-file-name-format"
  (setq howm-file-name-format "%Y/%m/%Y-%m-%d.txt")
  ;;;; Keyword file
  (setq howm-keyword-file (concat howm-directory ".howm-keys"))
  ;;;; History file
  (setq howm-history-file (concat howm-directory ".howm-history"))
  ;;;; Enable howm-menu
  (howm-menu))


;;;;; howm-init.el ends here
