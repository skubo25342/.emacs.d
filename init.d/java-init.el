;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; java-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; malabar-mode (installed via elpa)
;;;; Ref: http://qiita.com/toshikiw/items/389430db19561307d037
(when (require 'malabar-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode)))


;;;;; java-init.el ends here
