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
		      company
		      ;; --- Better Editor ---
		      hungry-delete
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
(add-hook 'emacs-lisp-mode-hook 'company-mode)

;;config for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

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
;;--------------------------------configurations--------------------------------------
(provide 'init-package)
