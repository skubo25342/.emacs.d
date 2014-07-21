;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; windows-init.el
;;;;; 
;;;;; Author: Shosei Kubo
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; windows.el
;;;; ref: http://www.gentei.org/~yuuji/software/
;;;; ref: http://technique.sonots.com/?UNIX%2F%E5%AD%A6%E7%94%9F%E3%83%84%E3%83%BC%E3%83%AB%2Felisp%2Fwindows.el
;;;; ref: http://www.bookshelf.jp/soft/meadow_30.html#SEC407
;;;; ref: http://d.hatena.ne.jp/kobapan/20100126/1264459661
(add-to-list 'load-path "~/.emacs.d/elisp/windows")
(when (require 'windows)
  (setq win:use-frame nil)
  (setq win:quick-selection nil)
  (setq win:configuration-file "~/.emacs.d/.windows")
  (setq revive:ignore-buffer-pattern "^*[]a-zA-Z0-9!\"#\\$%&'()-=^~\\\\|@`\\[{;\\+:\\*},<.>/\\?_ ]*\\*")
  ;;; Customize wipe-windows (in windows.el) to inhibit kill-buffer for buffers named "*foobar*".
  (defun wipe-windows (&optional no-ask)
    "Kill all buffers.  Optional argument NO-ASK non-nil skips query."
    (interactive "P")
    (if (and (null no-ask)
	     (not (y-or-n-p "Are you sure to wipe Emacs? ")))
	(error "Aborted"))
    (save-some-buffers)
    (let ((i 2))
      (while (< i win:max-configs)
	(and win:use-frame win:wipe-also-frames (aref win:configs i)
	     (delete-frame (aref win:configs i)))
	(aset win:configs i nil)
	(setq i (1+ i))))
    ;;; buffer-list -> revive:buffer-list
    ;(mapcar (function kill-buffer) (buffer-list))
    (mapcar (function kill-buffer) (revive:buffer-list))
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (delete-other-windows)
    (win:store-config 1)
    (win:update-mode-line 1))
  (win:startup-with-window))


;;;;; windows-init.el ends here
