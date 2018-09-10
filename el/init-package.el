;; cl - Common Lisp Extension
(require 'cl)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;;---------------------------------configurations------------------------------------
;;config for company mode
(use-package company 
  :config
  (add-hook 'emacs-lisp-mode-hook 'company-mode))

;;config for hungry-delete
(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

;; config for swiper
(use-package swiper
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))
;; config for avy
(use-package avy
  :ensure t
  :bind ("s-f" . avy-goto-char))

;;config for smartparents
(use-package smartparens
  :config
  (require 'smartparens-config)
  ;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (smartparens-global-mode t))

;; Find Executable Path on OS X
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;;config for theme
(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;;config for popwin
(use-package popwin
  :config
  (require 'popwin)
  (popwin-mode 1))

;;config for try and which-keys
(use-package try
  :ensure t)

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))
;;org-bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;cross multiple window
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))
;;--------------------------------configurations--------------------------------------
(provide 'init-package)
