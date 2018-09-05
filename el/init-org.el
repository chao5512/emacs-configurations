;;for org

(require 'org)
(setq org-src-fontify-natively 1)
;; set agenda file dir
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;;remember
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
