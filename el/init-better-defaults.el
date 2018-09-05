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


(provide 'init-better-defaults)
