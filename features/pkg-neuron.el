;; pkg-neuron.el -- neuron -*- lexical-binding: t; -*-

;;; Packages
(straight-use-package 'neuron-mode)
;; (defun 'neuron-default-zettelkasten-directory "~/cortex/")
(customize-set-variable 'neuron-default-zettelkasten-directory (expand-file-name "~/cortex"))
(customize-set-variable 'neuron-daily-note-title-format "%Y-%m-%d")
(customize-set-variable 'neuron-toggle-id-visibility t)

;; (setq zk-custom "/Users/pgowda/btbytes/")
(provide 'pkg-neuron)
;; pkg-neuron.el ends here
