(tool-bar-mode -1)
(scroll-bar-mode -1)

;;skip welcome window
(setq inhibit-splash-screen t)

;; maximized screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode 1) 

(setq-default cursor-type 'bar)

(provide 'init-ui)
