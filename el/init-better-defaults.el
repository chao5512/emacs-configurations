;;for better edit
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(global-linum-mode t)
(delete-selection-mode t)
(electric-indent-mode t)
;;short edit
(setq make-backup-files 'nil)
(setq auto-save-default 'nil)

;;recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;show parents
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;1format my code
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
;;2format my code
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))
;;a new expand to improve company-mode
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
;;dired mode+ 创建目录
;;g refresh
;;C copy
;;D delet after confirm
;;R rename
;;d delete mark
;;u clear marks
;;x excute 
;;recursive deletes and copies
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;;reuse dired buffer
(put 'dired-find-alternate-file 'disabled nil)
;;access curent file's directory
;;C-x C-j
(require 'dired-x)
;;cross screen copy
;;inviad ??
(setq dired-dwin-target t)

;;simple enter
(fset 'yes-or-no-p 'y-or-n-p)
(provide 'init-better-defaults)
