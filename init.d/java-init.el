;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; java-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; malabar-mode (installed via elpa)
;;;; Ref: http://qiita.com/toshikiw/items/389430db19561307d037
(autoload 'malabar-mode "malabar-mode" "malabar-mode" t)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))


;;;;; java-init.el ends here
