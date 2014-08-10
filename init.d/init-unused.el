;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; init-unused.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; This elisp file is for unused (old) settings. DO NOT LOAD!
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Colors
;;;; Ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
;;;; Ref: http://milanista224.blogspot.jp/2012/08/retina-emacs24.html
(if window-system
    (progn
      (set-face-foreground 'region "white")
      (set-face-background 'region "blue")
      ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Cursor type -> Can't set successfully...
;;;; t : Default
;;;; nil : Not show
;;;; box : Box type cursor which is as same width as text
;;;; bar : Vertical bar
;;;; (bar . n) : Vertical bar (width: n pt)
;;;; hbar : Underline
;;;; (hbar . n) : Underline (height: n pt)
;;;; hollow : (Other cases) Non-filled box
;;;; Ref: http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html
(add-to-list 'default-frame-alist '(cursor-type . 'box))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; mic-paren.el
;;;; Highlight parenthesis
;;;; Ref: http://www.emacswiki.org/emacs/mic-paren.el
;;;; Ref: http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
(when (require 'mic-paren nil t)
  (paren-activate))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; wb-line-number.el
;;;; Show line number on left
;;;; Ref: http://homepage1.nifty.com/blankspace/emacs/wb-line-number.html
;;;; Ref: http://www-section.cocolog-nifty.com/blog/emacs/index.html
(require 'wb-line-number)
(wb-line-number-toggle)
(setq truncate-partial-width-windows nil)
(custom-set-faces
 '(wb-line-number-face ((t (:foreground "light gray"))))
 '(wb-line-number-scroll-bar-face ((t (:foreground "black" :background "gray"))))
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; word-count.el
;;;; Ref: http://www.emacswiki.org/emacs/WordCount
;;;; Ref: http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
(eval-after-autoload-if-found '(word-count-mode) "word-count" "Minor mode to count words." t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; calendar
;;; Mark holidays in calender
(setq mark-holidays-in-calendar t)
;;; Mark diary entries in calender
(setq mark-diary-entries-in-calendar t)
;;; Faces
;; Title
(make-face 'my-calendar-title-face)
(set-face-foreground 'my-calendar-title-face "White")
;; Day for weekday
(make-face 'my-calendar-week-normal-face)
(set-face-foreground 'my-calendar-week-normal-face "#404040")
;; Day for Sunday
(make-face 'my-calendar-week-sunday-face)
(set-face-foreground 'my-calendar-week-sunday-face "#ff7070")
;; Day for Saturday
(make-face 'my-calendar-week-saturday-face)
(set-face-foreground 'my-calendar-week-saturday-face "#7070ff")
;; Date for Sunday
(make-face 'my-calendar-sunday-face)
(set-face-foreground 'my-calendar-sunday-face "Red")
;; Date for Saturday
(make-face 'my-calendar-saturday-face)
(set-face-foreground 'my-calendar-saturday-face "Blue")
;;
(setq calendar-weekend '(0 6))
;; Set weekend
(setq calendar-weekend-marker '(my-calendar-sunday-face nil nil nil nil nil my-calendar-saturday-face))
;; Diary entry
(setq diary-entry-marker (quote bold-italic))
;;; Set home location
(setq calendar-latitude 36.404027)
(setq calendar-longitude 139.0719046)
(setq calendar-location-name "Maebashi, JP")
;;; Set time zone
;; JST: +540
(setq calendar-time-zone +540)
(setq calendar-standard-time-zone-name "JST")
(setq calendar-daylight-time-zone-name "JST")
;;; Hook
(add-hook 'calendar-load-hook
	  '(lambda ()
	     ;;; Face settings
	     (setq calendar-font-lock-keywords
		   `((,(concat (regexp-opt (mapcar 'identity calendar-month-name-array) t)
			       " -?[0-9]+")
		      . 'my-calendar-title-face)
		     (,(regexp-opt (list (substring (aref calendar-day-name-array 0) 0 2)))
		      . 'my-calendar-week-sunday-face)
		     (,(regexp-opt (list (substring (aref calendar-day-name-array 6) 0 2)))
		      . 'my-calendar-week-saturday-face)
		     (,(regexp-opt (mapcar (lambda (x) (substring x 0 2)) calendar-day-name-array))
		      . 'my-calendar-week-normal-face)))
	     ;;; Japanese holidays
	     (when (require 'japanese-holidays nil t)
	       (setq calendar-holidays
		     (append japanese-holidays local-holidays other-holidays))
	       (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
	       (add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
	       (add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)
	       )))
;;; Decoration diary
(add-hook 'diary-display-hook 'fancy-diary-display)
;;; Show holidays that have no diary
(setq diary-list-include-blanks t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; anything.el (for Mac only)
;;;; Ref: http://www.emacswiki.org/cgi-bin/wiki/Anything
;;;; Ref: http://www24.atwiki.jp/anything/m/pages/13.html
;;;; Ref: http://dev.ariel-networks.com/Members/matsuyama/open-anything-emacs/
(cond
 ;;; for Mac
 ((eq window-system 'ns)
  (add-to-list 'load-path "./.emacs.d/elisp/anything")
  (require 'anything-startup)
  (setq anything-sources
	'(;;; Select buffers
	  anything-c-source-buffers+
	  ;;; "find-file" recent files
	  anything-c-source-recentf
	  ;;; "find-file" files in current directory
	  anything-c-source-files-in-current-dir
         ;;; Call Emacs commands (M-x)
	  anything-c-source-emacs-commands
	  ;;; Call Emacs functions command
	  anything-c-source-emacs-functions
	  ;;; "eval"
	  anything-c-source-evaluation-result
	  ;;; "calc-eval"
	  anything-c-source-calculation-result
	  ;;; Google suggest search
	  anything-c-source-google-suggest
	  ))
  ;;; Wait before show candidates (default: 0.3)
  (setq anything-idle-delay 0.3)
  ;;; Wait before search (default: 0)
  (setq anything-input-idle-delay 0)
  ;;; Candidate number limit (default: 50)
  (setq anything-candidate-number-limit 100)
  ;;; Set keybind
  (define-key global-map (kbd "C-x C-a") 'anything)
  )
 ;;; for Windows
 ((eq window-system 'w32)
  ;(require 'anything-startup)
  ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;; init-unused.el ends here
