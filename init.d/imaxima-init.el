;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; imaxima-init.el
;;;;;
;;;;; Author: Shosei KUBO
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; imaxima.el
;;;; Ref: http://macwiki.sourceforge.jp/wiki/index.php/Imaxima
(add-to-list 'load-path "/opt/local/share/maxima/5.28.0/emacs")
(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(eval-after-load "imaxima"
  '(progn
     ;;;; maxima executable
     (setq imaxima-maxima-program "maxima")
     ;;;; ghostscript executable
     (setq imaxima-gs-program "gs")
     ;;;; Image type
     (setq imaxima-image-type 'png)
     ;;;; Temporary directory
     (setq imaxima-tmp-dir "/tmp")
     ;;;; Image scale
     (setq imaxima-scale-factor 1.2)))


;;;;; imaxima-init.el ends here
