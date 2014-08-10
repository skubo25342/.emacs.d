;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; helm-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; helm.el (installed via elpa)
;;;; Ref: https://github.com/emacs-helm/helm/wiki
;;;; Ref: http://yoshiori.github.io/blog/2013/01/30/dot-emacs-renewal/
;;;; Ref: http://stackoverflow.com/questions/11403862/how-to-have-emacs-helm-list-offer-files-in-current-directory-as-options
;;;; Ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-7
(require 'helm-config nil t)
(eval-after-load "helm-config"
  '(progn
     ;;; Customized helm menu
     ;;; Type "C-h v helm-source" to find available sources
     (setq my-helm:source-list `(helm-source-buffers-list
				 helm-source-buffer-not-found
				 helm-source-files-in-current-dir
				 ,@(when (require 'helm-ls-git nil t)
				     '(helm-source-ls-git
				       helm-source-ls-git-status))
				 helm-source-recentf
				 helm-source-google-suggest))
     (defun my-helm ()
       (interactive)
       (helm :sources my-helm:source-list
	     :buffer "*helm*"))
     ;;; helm displaying function
     (defun helm-display-buffer (buffer)
       (split-window-vertically)
       (set-window-buffer (next-window) buffer))
     (setq helm-display-function 'helm-display-buffer)
     ;;; Key bindings
     (define-key global-map (kbd "C-x C-a") 'my-helm)
     (define-key global-map (kbd "C-S-s") 'helm-do-ag)
     ;;; Enable helm-mode
     (helm-mode 1)))


;;;;; helm-init.el ends here
