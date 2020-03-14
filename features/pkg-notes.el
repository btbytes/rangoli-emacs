;; pkg-notes.el -- note taking -*- lexical-binding: t; -*-

;;; Packages

;; deft
(straight-use-package 'deft)
(require 'deft)
(setq deft-recursive t)
(setq deft-extensions '("md" "txt" "org"))
(setq deft-default-extension "org")
(setq deft-directory "~/btbytes/notes/")
(global-set-key [f8] 'deft)
;; zetteldeft
(straight-use-package 'zetteldeft)
(require 'zetteldeft)

(setq deft-new-file-format zetteldeft-id-format)

(global-set-key (kbd "C-c d d") 'deft)
(global-set-key [f8] 'deft)
(global-set-key (kbd "C-c d D") 'zetteldeft-deft-new-search)
(global-set-key (kbd "C-c d R") 'deft-refresh)
(global-set-key (kbd "C-c d s") 'zetteldeft-search-at-point)
(global-set-key (kbd "C-c d c") 'zetteldeft-search-current-id)
(global-set-key (kbd "C-c d f") 'zetteldeft-follow-link)
(global-set-key (kbd "C-c d F") 'zetteldeft-avy-file-search-ace-window)
(global-set-key (kbd "C-c d l") 'zetteldeft-avy-link-search)
(global-set-key (kbd "C-c d t") 'zetteldeft-avy-tag-search)
(global-set-key (kbd "C-c d T") 'zetteldeft-tag-buffer)
(global-set-key (kbd "C-c d i") 'zetteldeft-find-file-id-insert)
(global-set-key (kbd "C-c d I") 'zetteldeft-find-file-full-title-insert)
(global-set-key (kbd "C-c d o") 'zetteldeft-find-file)
(global-set-key (kbd "C-c d n") 'zetteldeft-new-file)
(global-set-key (kbd "C-c d N") 'zetteldeft-new-file-and-link)
(global-set-key (kbd "C-c d r") 'zetteldeft-file-rename)
(global-set-key (kbd "C-c d x") 'zetteldeft-count-words)

(provide 'pkg-notes)
;; pkg-notes.el ends here
