;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; anzu-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; anzu.el (installed via elpa)
;;;; ref: http://qiita.com/syohex/items/56cf3b7f7d9943f7a7ba
;;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-51
(when (require 'anzu)
  (global-anzu-mode +1)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
  (set-face-attribute 'anzu-mode-line nil
		      :foreground "#ff0"
		      :weight 'bold))


;;;;; anzu-init.el ends here
