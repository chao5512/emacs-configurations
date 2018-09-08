 ;; cl - Common Lisp Extension
(require 'cl)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize) 
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")			   
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))


;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      ;;company
		      ;; --- Better Editor ---
		      ;;hungry-delete
		      swiper
		      counsel
		      ;;smex
		      smartparens
		      ;; --- Major Mode ---
		      ;;js2-mode
		      ;; --- Minor Mode ---
		      ;;nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      popwin
		      ;; open current file in finder directly
		      reveal-in-osx-finder
		      ;; try package
		      try
		      ;; keys tips
		      which-key
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;;---------------------------------configurations------------------------------------
;;config for company mode
(use-package company 
  :config
  (add-hook 'emacs-lisp-mode-hook 'company-mode))

;;config for hungry-delete
(use-package hungry-delete
  :config
  (global-hungry-delete-mode))
;;(require 'hungry-delete)
;;(global-hungry-delete-mode)

;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;config for smartparents
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;config for theme
(load-theme 'monokai t)

;;config for popwin
(require 'popwin)
(popwin-mode 1)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
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
