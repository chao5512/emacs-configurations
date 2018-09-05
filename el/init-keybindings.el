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


;;8388699 commond+[
(global-set-key [8388699] (quote recentf-open-files))

;;short break for counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)

;;remember
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-keybindings)
