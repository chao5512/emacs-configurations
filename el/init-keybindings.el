;;for key bindings

;;set global key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;8388699 commond+]
(global-set-key [8388701] (quote open-my-init-file))
;;C-.
(global-set-key [67108910] (quote set-mark-command))

;;8388699 commond+[
(global-set-key [8388699] (quote recentf-open-files))

;;short break for counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)

;;remember
(global-set-key (kbd "C-c r") 'org-capture)

;;format short break
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;hippie-expand to improve campany-mode
(global-set-key (kbd "s-/") 'hippie-expand)

;;search and edit
(global-set-key (kbd "M-s o") 'occur-dwim)

;;scale text
;;C-=
(global-set-key [8388669] (quote text-scale-increase))
;;C--
(global-set-key [8388653] (quote text-scale-decrease))

;; direct load Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; delay load
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
