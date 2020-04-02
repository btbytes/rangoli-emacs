;; pkg-notes.el -- note taking -*- lexical-binding: t; -*-

;;; Packages

;; deft
(straight-use-package 'deft)
(require 'deft)
(setq deft-recursive t)
(setq deft-extensions '("org"))
(setq deft-default-extension "org")
(setq deft-directory "~/btbytes/zettelkasten")
(global-set-key [f8] 'deft)

;; ;; zetteldeft
;; (straight-use-package 'zetteldeft)
;; (require 'zetteldeft)

;; (setq deft-new-file-format zetteldeft-id-format)

;; (global-set-key (kbd "C-c d d") 'deft)
;; (global-set-key [f8] 'deft)
;; (global-set-key (kbd "C-c d D") 'zetteldeft-deft-new-search)
;; (global-set-key (kbd "C-c d R") 'deft-refresh)
;; (global-set-key (kbd "C-c d s") 'zetteldeft-search-at-point)
;; (global-set-key (kbd "C-c d c") 'zetteldeft-search-current-id)
;; (global-set-key (kbd "C-c d f") 'zetteldeft-follow-link)
;; (global-set-key (kbd "C-c d F") 'zetteldeft-avy-file-search-ace-window)
;; (global-set-key (kbd "C-c d l") 'zetteldeft-avy-link-search)
;; (global-set-key (kbd "C-c d t") 'zetteldeft-avy-tag-search)
;; (global-set-key (kbd "C-c d T") 'zetteldeft-tag-buffer)
;; (global-set-key (kbd "C-c d i") 'zetteldeft-find-file-id-insert)
;; (global-set-key (kbd "C-c d I") 'zetteldeft-find-file-full-title-insert)
;; (global-set-key (kbd "C-c d o") 'zetteldeft-find-file)
;; (global-set-key (kbd "C-c d n") 'zetteldeft-new-file)
;; (global-set-key (kbd "C-c d N") 'zetteldeft-new-file-and-link)
;; (global-set-key (kbd "C-c d r") 'zetteldeft-file-rename)
;; (global-set-key (kbd "C-c d x") 'zetteldeft-count-words)

(require 'rangoli-org)
;;(straight-use-package 'org-roam)
(straight-use-package '(org-roam :host github :repo "jethrokuan/org-roam"))
(require 'org-roam)

(define-key org-roam-mode-map (kbd "C-c n c") #'org-roam-capture)
(define-key org-roam-mode-map (kbd "C-c n l") #'org-roam)
(define-key org-roam-mode-map (kbd "C-c n f") #'org-roam-find-file)
(define-key org-roam-mode-map (kbd "C-c n b") #'org-roam-switch-to-buffer)
(define-key org-roam-mode-map (kbd "C-c n g") #'org-roam-show-graph)
(define-key org-mode-map (kbd "C-c n i") #'org-roam-insert)
(org-roam-mode +1)
;; link-indicator taken from zetteldeft
(setq org-roam-link-title-format "§%s")
(setq org-roam-graph-exclude-matcher '("private" "dailies"))
(setq org-roam-completion-system 'ivy)
(setq org-roam-directory (f-expand "~/btbytes/zettelkasten"))
(setq org-roam-buffer-width 0.4)
(setq org-roam-graphviz-executable "/usr/local/bin/neato")

(provide 'pkg-notes)
;; pkg-notes.el ends here
