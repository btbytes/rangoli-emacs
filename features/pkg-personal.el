;; pkg-personal.el -- personal settings -*- lexical-binding: t; -*-

;;; Packages

;; (straight-use-package 'doom-themes)
;; (require 'doom-themes)
;; (setq doom-themes 'doom-opera-light)
;; (load-theme 'doom-opera-light t)
(straight-use-package 'base16-theme)
(load-theme 'base16-atelier-dune-light t)
             

;; My details
(setq user-full-name "Pradeep Gowda")
(setq user-mail-address "pradeep@btbytes.com")


(setq zoneinfo-style-world-list
      '(("America/New_York" "Carmel")
        ("Asia/Calcutta" "Bengaluru")))

;; key binding overrides
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(provide 'pkg-personal)
;; pkg-personal.el ends here
