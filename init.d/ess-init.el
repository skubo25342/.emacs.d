;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 
;;;;; ess-init.el
;;;;; 
;;;;; Author: Shosei KUBO
;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; ESS (Emacs Speaks Statistics) (installed via elpa) (not for Windows)
;;;; Run statistical analysis applications (such as R) on Emacs
;;;; ref: http://stat.ethz.ch/ESS/index.php?Section=home
(if (not windows-p)
    (require 'ess-site))


;;;;; ess-init.el ends here
