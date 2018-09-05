  (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

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

;; Find Executable Path on OS X
;;somequestion here
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

;; set agenda file dir
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(load-theme 'monokai t)

(require 'hungry-delete)
(global-hungry-delete-mode)

;;config for smartparents
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;config for company mode 
(add-hook 'emacs-lisp-mode-hook 'company-mode)
;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;config for semx

;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
 ;;(global-set-key (kbd "M-x") 'smex)
(global-hl-line-mode 1)
;;set themes
;;(add-to-list 'my/packages 'monokai-theme)

;;(load-theme 'monokai 1)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;import init-themes.el
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;;(require 'init-themes)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(tool-bar-mode -1)
(scroll-bar-mode -1)
(delete-selection-mode t)
(electric-indent-mode t)
(global-linum-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;(global-company-mode t)
;;(global-set-key(kbd )

;;8388699 commond+]
(global-set-key [8388701] (quote open-my-init-file))
(setq-default cursor-type 'bar)
(setq make-backup-files 'nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;8388699 commond+[
(global-set-key [8388699] (quote recentf-open-files))


(require 'org)
(setq org-src-fontify-natively 1)

 (setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;;remember
(global-set-key (kbd "C-c r") 'org-capture)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 )
 ;;'(package-selected-packages (quote(monokai-theme company)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq inhibit-splash-screen t)


