;; pkg-personal.el -- personal settings -*- lexical-binding: t; -*-

;;; Packages

(straight-use-package 'doom-themes)
(require 'doom-themes)
(setq doom-themes 'doom-opera-light)
;; (load-theme 'doom-opera-light t)


;; My details
(setq user-full-name "Pradeep Gowda")
(setq user-mail-address "pradeep@btbytes.com")


(setq zoneinfo-style-world-list
      '(("America/New_York" "Carmel")
        ("Asia/Calcutta" "Bengaluru")))

(provide 'pkg-personal)
;; pkg-personal.el ends here
