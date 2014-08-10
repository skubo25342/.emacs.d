;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; calender-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;; Ref: http://inuno-tamashii.blogzine.jp/bebebenobe/files/emacs_calendar.html
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; calfw.el (installed via elpa) (not for Windows)
;;;; Ref: http://d.hatena.ne.jp/kiwanami/20110107/1294404952
;;;; Ref: http://d.hatena.ne.jp/kiwanami/20110723/1311434175
(require 'calfw nil t)
(eval-after-load "calfw"
  '(progn
     (when (and (require 'calfw-ical nil t)
		(require 'calfw-gcal nil t))
       (defun cfw:open-my-calendar ()
	 (interactive)
	 (cfw:open-calendar-buffer
	  :view 'month
	  :contents-sources (list (cfw:ical-create-source
				   "Shosei KUBO"
				   "https://www.google.com/calendar/ical/s.kubo.25342%40gmail.com/private-80e6da038a53c2b79971f979b96f5547/basic.ics"
				   "grey")
				  (cfw:ical-create-source
				   "kyoto-u"
				   "https://www.google.com/calendar/ical/c2t0g24og0q5dp9v083ds9u6qo%40group.calendar.google.com/private-315c6a40bf9beb209a57a7804b520710/basic.ics"
				   "green")
				  (cfw:ical-create-source
				   "kyoto-u_icr-molmat"
				   "https://www.google.com/calendar/ical/pu1guhi2dm7vg7aicsagf0knpo%40group.calendar.google.com/private-77c9195adf596b620d1b33b8107ff568/basic.ics"
				   "blue"))))
       (define-key cfw:calendar-mode-map (kbd "a") 'cfw:gcal-main)
       (cfw:open-my-calendar))))


;;;;; calendar-init.el ends here
