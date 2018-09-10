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
