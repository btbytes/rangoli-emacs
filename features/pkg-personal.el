;; pkg-personal.el -- personal settings -*- lexical-binding: t; -*-

;;; Packages

;; (straight-use-package 'doom-themes)
;; (require 'doom-themes)
;; (setq doom-themes 'doom-opera-light)
;; (load-theme 'doom-opera-light t)

;; ;;(straight-use-package 'base16-theme)
;;(load-theme 'base16-atelier-dune-light t)
;; (load-theme 'base16-bespin t)
;; (load-theme 'base16-atelier-lakeside-light t)
;; (load-theme 'base16-grayscale-light t)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))             

;; My details
(setq user-full-name "Pradeep Gowda")
(setq user-mail-address "pradeep@btbytes.com")


(setq zoneinfo-style-world-list
      '(("America/New_York" "Carmel")
        ("Asia/Calcutta" "Bengaluru")))

;; key binding overrides
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


;; fix ssl issues -- not yet
(require 'gnutls)
(push "/usr/local/etc/libressl/cert.pem" gnutls-trustfiles)

;; proportional fonts
'(variable-pitch ((t (:family "Helvetica Neue" :height 160))))



(provide 'pkg-personal)
;; pkg-personal.el ends here
