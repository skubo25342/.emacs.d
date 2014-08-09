;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; helm-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; helm.el (installed via elpa)
;;;; ref: https://github.com/emacs-helm/helm/wiki
;;;; ref: http://yoshiori.github.io/blog/2013/01/30/dot-emacs-renewal/
;;;; ref: http://stackoverflow.com/questions/11403862/how-to-have-emacs-helm-list-offer-files-in-current-directory-as-options
;;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-7
(when (require 'helm-config nil t)
  ;;; helm extensions
  (require 'helm-ls-git)
  ;;; Enable helm-mode
  (helm-mode 1)
  ;;; Customized helm menu
  ;;; Type "C-h v helm-source" to find available sources
  (defun my-helm ()
    (interactive)
    (helm :sources '(helm-source-buffers-list
		     helm-source-buffer-not-found
		     helm-source-files-in-current-dir
		     helm-source-ls-git
		     helm-source-ls-git-status
		     helm-source-recentf
		     helm-source-google-suggest)
	  :buffer "*helm*"))
  (define-key global-map (kbd "C-x C-a") 'my-helm)
  (define-key global-map (kbd "C-S-s") 'helm-do-ag)
  ;;; helm displaying function
  (defun helm-display-buffer (buffer)
    (split-window-vertically)
    (set-window-buffer (next-window) buffer))
  (setq helm-display-function 'helm-display-buffer))


;;;;; helm-init.el ends here
