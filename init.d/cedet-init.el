;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; cedet-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-ede-mode 1)
(semantic-mode 1)
(eval-after-load "semantic"
  '(progn
     (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
				       global-semantic-idle-completions-mode
				       global-semanticdb-minor-mode
				       global-semantic-decoration-mode
				       global-semantic-highlight-func-mode
				       global-semantic-stickyfunc-mode
				       global-semantic-mru-bookmark-mode
				       global-semantic-show-unmatched-syntax-mode
				       global-semantic-idle-local-symbol-highlight-mode
				       global-semantic-idle-summary-mode))
     (add-to-list 'ac-sources 'ac-source-semantic)))


;;;;; cedet-init.el ends here
