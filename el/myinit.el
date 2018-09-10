(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'load-path "~/.emacs.d/el")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/el/myinit.el"))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(use-package org
  )

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)
