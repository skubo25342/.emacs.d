;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; frame-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Frame
;;;; ref: http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
(cond
 ;;; for Mac
 (ns-p
  (setq initial-frame-alist
	(append
	 '(;;; X-position
	   (top . 0)
	   ;;; Y-position
	   (left . 0)
	   ;;; Frame width
	   (width . 210)
	   ;;; Frame height
	   (height . 60))
	 initial-frame-alist)))
 ;;; for Windows
 (windows-p
  (setq initial-frame-alist
	(append
	 '(;;; X-position
	   (top . 10)
	   ;;; Y-position
	   (left . 30)
	   ;;; Frame width
	   (width . 115)
	   ;;; Frame height
	   (height . 53))
	 initial-frame-alist))))
;;; Common
(setq initial-frame-alist
      (append
       '(;;; Frame opacity (active, non-active)
	 (alpha . (90 80))
	 ;;; Show vertical scroll bar or not
	 (vertical-scroll-bars . nil))
       initial-frame-alist))
;;; Apply the initial setting to default
(setq default-frame-alist initial-frame-alist)

;;;; Frame title
;;;; %b : Buffer title
;;;; %f : File path
;;;; To use variables shown above in 'format', you need to escape "%" using "%" in format command. (e.g. to use "%b", you should input "%%b")
;;;; ref: 
(setq frame-title-format (format "%%b [%%f] - Emacs@%s" (system-name)))

;;;; Theme
(load-theme 'deeper-blue t)

;;;; Fonts
;;;; ref: https://gist.github.com/mitukiii/4365568
;;;; ref: http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
;;;; ref: http://sakito.jp/emacs/emacs23.html
;;;; ref: http://d.hatena.ne.jp/sugyan/20120828/1346082898
;;;; ref: http://d.hatena.ne.jp/kitokitoki/20110502/p2
(set-face-attribute 'default nil
		    :family "Ricty"
		    :height (cond (ns-p 175) (windows-p 125)))
(set-fontset-font "fontset-default"
		  'unicode
		  (font-spec :family "Ricty"))
;;; To adjust widths of English and Japanese fonts to 1:2, set rescale factor for Japanese font manually.
(setq face-font-rescale-alist '((".*Ricty.*" . 1.0)
				;(".*Hiragino.*" . 0.9)
				))
;;; Line spacing
;;; Using integer or decimal value set line spacing in absolute pixels, or in relative to line height, respectively.
(setq-default line-spacing 0.1)

;;;; Toolbar
;;; Hide toolbar
;;; ref: http://milanista224.blogspot.jp/2012/08/retina-emacs24.html
(if window-system
    (tool-bar-mode 0))

;;;; Mode line
;;; Show line number (default: enable)
;;; ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
(line-number-mode t)
;;; Show column number (default: disable)
;;; ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
(column-number-mode t)
;;; Show file size on mode line
(size-indication-mode t)
;;; Show current time on mode line (default: disable)
;;; ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
;;; ref: http://milanista224.blogspot.jp/2012/08/retina-emacs24.html
(when (require 'time)
  (setq display-time-24hr-format t)
  (setq display-time-string-forms '(24-hours ":" minutes)))
(display-time-mode t)
;;; Show battery status on mode line (default: disable)
;;; Can't enable on Mac OS X Maveriks (@2013.12.23)
;;; ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
;;; ref: http://milanista224.blogspot.jp/2012/08/retina-emacs24.html
;(display-battery-mode t)
;;; Show function name in mode line (default: disable)
;(which-function-mode t)
;;; powerline.el (installed via elpa)
;;; Customize mode line style
;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-53
;;; ref: http://shibayu36.hatenablog.com/entry/2014/02/11/160945
(when (and (not windows-p) (require 'powerline))
;  (set-face-attribute 'mode-line nil
;		      :background "#fff"
;		      :foreground "#f00")
;  (set-face-attribute 'powerline-active1 nil
;		      :foreground "#000"
;		      :background "#f60"
;		      :inherit 'mode-line)
;  (set-face-attribute 'powerline-active2 nil
;		      :foreground "#000"
;		      :background "#f90"
;		      :inherit 'mode-line)
  (setq powerline-default-separator 'arrow-fade)
  (powerline-default-theme))

;;;; Show line number on left
;;;; ref: http://developmemo.seesaa.net/article/158676937.html
(global-linum-mode t)
(setq linum-format (cond (ns-p "%4d") (windows-p "%4d ")))
;;; hlinum.el (installed via elpa)
;;; Extension for linum-mode to highlight current line number
;;; ref: http://d.hatena.ne.jp/tm_tn/20110605/1307238416
;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-55
(when (require 'hlinum)
  (hlinum-activate))
;;; linum-off.el
;;; Disable linum for certain major-modes
;;; ref: http://www.emacswiki.org/emacs/linum-off.el
(require 'linum-off nil t)

;;;; smartparens.el (installed via elpa)
;;;; Auto-filling parenthesis
;;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-24
;;;; ref: http://d.hatena.ne.jp/kiririmode/20131231/p1
(when (require 'smartparens-config)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

;;;; yascroll.el (installed via elpa)
;;;; Yet another scroll bar mode
;;;; ref: http://d.hatena.ne.jp/m2ym/20110401/1301617991
;;;; ref: http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-57
(when (require 'yascroll)
  (global-yascroll-bar-mode 1))

;;;; Scroll step
;;; Scroll with keyboard
;;; ref: http://www-section.cocolog-nifty.com/blog/emacs/index.html
(setq scroll-step 1)
;;; Scroll with wheel
;;; ref: http://tjun.org/blog/2009/11/emacs_mouse_whee/
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;;;; windows.el & revive.el
(load "windows-init")

;;;; popwin.el
(load "popwin-init")


;;;;; frame-init.el ends here
