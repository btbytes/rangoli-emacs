;; (require 'geiser)
;; pkg-gerbil.el --- gerbil scheme language configuration -*- lexical-binding: t; -*-
;; (stright-use-package
;;  '(gerbil :type git :host github
;;           :repo "vyzo/gerbil"
;;           :files ("etc/gerbil.el")
;;           :branch "master"))
;;

;; ln -s ~/src/gerbil/etc/gerbil.el
(autoload 'gerbil-mode "gerbil" "Gerbil editing mode." t)
(require 'gambit)
(add-hook 'inferior-scheme-mode-hook 'gambit-inferior-mode)
(defvar gerbil-program-name
  (expand-file-name "/usr/local/opt/gerbil-scheme/libexec/bin/gxi")) ; Set this for your GERBIL_HOME
(setq scheme-program-name gerbil-program-name)

(provide 'pkg-gerbil)
